import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travan_code_app/presentation/crypto_detail/bloc/favorite_bloc.dart';
import 'package:travan_code_app/presentation/crypto_detail/bloc/favorites_state.dart';
import 'package:travan_code_app/presentation/home/view/widget/crypto_card.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          final length = state.cryptos.length;
          return ListView.builder(
            itemCount: length,
            itemBuilder: (context, index) {
              final cryptos = state.cryptos[index];
              return CryptoCard(cryptos: cryptos);
            },
          );
        },
      ),
    );
  }
}
