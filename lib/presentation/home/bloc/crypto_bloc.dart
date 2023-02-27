import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travan_code_app/presentation/home/bloc/crypto_event.dart';
import 'package:travan_code_app/presentation/home/bloc/crypto_state.dart';
import 'package:travan_code_app/services/api_service.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoState> {
  CryptoBloc() : super(CrytpoInitialState()) {
    on<CryptoFetchEvent>(_fetchEvent);
  }

  FutureOr<void> _fetchEvent(
    CryptoFetchEvent event,
    Emitter<CryptoState> emit,
  ) async {
    emit(CrytpoLoadingState());
    try {
      final response = await CryptoApi().getCripto();
      if (response.isNotEmpty) {
        emit(CrytpoSuccessState(cryptos: response));
      } else {
        CrytpoErrorState(errorMessage: 'Something went wrong!');
      }
    } catch (e) {
      emit(
        CrytpoErrorState(errorMessage: e.toString()),
      );
    }
  }
}
