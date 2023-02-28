import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travan_code_app/model/crypto.dart';
import 'package:travan_code_app/presentation/crypto_detail/bloc/favorite_bloc.dart';
import 'package:travan_code_app/presentation/crypto_detail/bloc/favorites_event.dart';
import 'package:travan_code_app/presentation/favorites_screen.dart';
import 'package:travan_code_app/presentation/home/bloc/crypto_bloc.dart';
import 'package:travan_code_app/presentation/home/bloc/crypto_event.dart';
import 'package:travan_code_app/presentation/home/bloc/crypto_state.dart';
import 'package:travan_code_app/presentation/home/view/widget/crypto_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    fetchCrypto();
  }

  List<CryptoModel> cryptos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: BlocConsumer<CryptoBloc, CryptoState>(
        listener: (context, state) {
          if (state is CrytpoErrorState) {
            showSnackBar(message: state.errorMessage, color: Colors.red);
          } else if (state is CrytpoSuccessState) {
            updateFavorite(state.cryptos);
          }
        },
        builder: (context, state) {
          if (state is CrytpoSuccessState) {
            return IndexedStack(
              children: [
                ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: state.cryptos.length,
                  itemBuilder: (context, index) {
                    final crypto = state.cryptos[index];
                    return CryptoCard(cryptos: crypto);
                  },
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToFavoritesScreen,
        label: const Text('Favorites'),
      ),
    );
  }

  Future<void> fetchCrypto() async {
    final bloc = context.read<CryptoBloc>();
    final event = CryptoFetchEvent();
    bloc.add(event);
  }

  void updateFavorite(List<CryptoModel> data) {
    final box = Hive.box<int>('crypto_favoritess');
    final ids = box.values.toList();
    final favoriteCrypto =
        data.where((element) => ids.contains(element.id)).toList();
    final bloc = context.read<FavoritesBloc>();
    favoriteCrypto.forEach((element) {
      bloc.add(AddToFavoritesEvent(cryptos: element));
    });
  }

  void showSnackBar({required String message, required Color color}) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void navigateToFavoritesScreen() {
    final route = MaterialPageRoute(
      builder: (context) => const FavoritesScreen(),
    );
    Navigator.push(context, route);
  }
}
