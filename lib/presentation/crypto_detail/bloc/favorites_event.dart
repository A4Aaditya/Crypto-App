import 'package:travan_code_app/model/crypto.dart';

abstract class FavoritesEvent {}

class AddToFavoritesEvent extends FavoritesEvent {
  AddToFavoritesEvent({
    required this.cryptos,
  });
  final CryptoModel cryptos;
}

class RemoveFromFavoritesEvent extends FavoritesEvent {
  RemoveFromFavoritesEvent({
    required this.crypto,
  });
  final CryptoModel crypto;
}
