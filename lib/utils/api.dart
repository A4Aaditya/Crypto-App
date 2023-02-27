import 'package:dio/dio.dart';

class DioService {
  static final _dio = Dio();
  static Dio getInstance() {
    _dio.options = BaseOptions(
      baseUrl: 'https://pro-api.coinmarketcap.com/v1',
      headers: {'X-CMC_PRO_API_KEY': '4036605b-683f-42e2-9c70-103e1a0f574d'},
    );
    return _dio;
  }
}
