import 'package:travan_code_app/model/crypto.dart';

class FavoritesState {
  FavoritesState({
    this.cryptos = const [],
  });
  final List<CryptoModel> cryptos;
}
