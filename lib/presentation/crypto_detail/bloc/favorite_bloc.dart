import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travan_code_app/presentation/crypto_detail/bloc/favorites_event.dart';
import 'package:travan_code_app/presentation/crypto_detail/bloc/favorites_state.dart';

class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  FavoritesBloc() : super(FavoritesState()) {
    on<AddToFavoritesEvent>(_addToFavorites);
    on<RemoveFromFavoritesEvent>(_removeFromFavorites);
  }

  final favoriteBox = Hive.box<int>('crypto_favoritess');

  FutureOr<void> _addToFavorites(
    AddToFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    final cryptos = state.cryptos;
    favoriteBox.put(event.cryptos.id, event.cryptos.id);
    final updatedState = FavoritesState(cryptos: [event.cryptos, ...cryptos]);
    emit(updatedState);
  }

  FutureOr<void> _removeFromFavorites(
    RemoveFromFavoritesEvent event,
    Emitter<FavoritesState> emit,
  ) async {
    final cryptos = state.cryptos;
    favoriteBox.delete(event.crypto.id);
    final updatedProduct =
        cryptos.where((element) => element != event.crypto).toList();
    final updatedState = FavoritesState(cryptos: updatedProduct);
    emit(updatedState);
  }
}
