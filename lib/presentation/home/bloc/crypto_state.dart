import 'package:travan_code_app/model/crypto.dart';

abstract class CryptoState {}

class CrytpoInitialState extends CryptoState {}

class CrytpoLoadingState extends CryptoState {}

class CrytpoErrorState extends CryptoState {
  CrytpoErrorState({required this.errorMessage});
  final String errorMessage;
}

class CrytpoSuccessState extends CryptoState {
  CrytpoSuccessState({required this.cryptos});
  final List<CryptoModel> cryptos;
}
