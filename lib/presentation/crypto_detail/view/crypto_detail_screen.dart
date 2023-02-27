import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travan_code_app/model/crypto.dart';
import 'package:travan_code_app/presentation/crypto_detail/bloc/favorite_bloc.dart';
import 'package:travan_code_app/presentation/crypto_detail/bloc/favorites_event.dart';
import 'package:travan_code_app/presentation/crypto_detail/bloc/favorites_state.dart';
import 'package:travan_code_app/utils/crypto_style.dart';

/// Also, show the symbol, market cap, and 24hr price change
//  percentage of a particular coin when the list item is pressed.

class CryptoDetailScreen extends StatefulWidget {
  const CryptoDetailScreen({
    super.key,
    required this.cryptos,
  });
  final CryptoModel cryptos;

  @override
  State<CryptoDetailScreen> createState() => _CryptoDetailScreenState();
}

class _CryptoDetailScreenState extends State<CryptoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final cryptos = widget.cryptos;
    final quote = cryptos.quote['USD'];
    final isNegative = quote?.percentChange24h.isNegative ?? false;
    return Scaffold(
      appBar: AppBar(
        title: Text(cryptos.name),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.grey,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Text(
                    cryptos.symbol[0],
                    style: CryptoTextStyle.body1,
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  cryptos.name,
                  style: CryptoTextStyle.body1,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  'USD .${quote?.price.toStringAsFixed(3)}',
                  style: CryptoTextStyle.body3,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
            ),
            child: ListTile(
              leading: const Icon(Icons.factory),
              title: const Text(
                'Market Cap',
                style: CryptoTextStyle.body2,
              ),
              trailing: Text(
                quote?.marketCap.toStringAsFixed(3) ?? '',
                style: CryptoTextStyle.body2,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 8,
              right: 8,
            ),
            child: ListTile(
              leading: const Icon(Icons.money),
              title: const Text(
                'Percentage changes in 24h',
                style: CryptoTextStyle.body2,
              ),
              trailing: Text(
                quote?.percentChange24h.toStringAsFixed(3) ?? '',
                style: CryptoTextStyle.body2.copyWith(
                  color: isNegative ? Colors.red : Colors.green,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
      floatingActionButton: BlocBuilder<FavoritesBloc, FavoritesState>(
        builder: (context, state) {
          return Visibility(
              visible: !state.cryptos.contains(cryptos),
              replacement: floatingbutton(
                backGroundColor: Colors.red,
                label: const Text('Remove from Favorite'),
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  final bloc = context.read<FavoritesBloc>();
                  final event = RemoveFromFavoritesEvent(crypto: cryptos);
                  bloc.add(event);
                },
              ),
              child: floatingbutton(
                backGroundColor: Colors.blue,
                label: const Text('Add to Favorite'),
                icon: const Icon(Icons.favorite_border),
                onPressed: () {
                  final bloc = context.read<FavoritesBloc>();
                  final event = AddToFavoritesEvent(cryptos: cryptos);
                  bloc.add(event);
                },
              ));
        },
      ),
    );
  }

  Widget floatingbutton({
    required Color backGroundColor,
    required Widget label,
    required Icon icon,
    required void Function() onPressed,
  }) {
    return FloatingActionButton.extended(
      backgroundColor: backGroundColor,
      icon: icon,
      onPressed: onPressed,
      label: label,
    );
  }
}
