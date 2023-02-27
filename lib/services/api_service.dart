import 'package:dio/dio.dart';
import 'package:travan_code_app/model/crypto.dart';
import 'package:travan_code_app/utils/api.dart';

class CryptoApi {
  final dio = DioService.getInstance();

  Future<List<CryptoModel>> getCripto() async {
    const path = '/cryptocurrency/listings/latest';
    try {
      final result = await dio.get(path, options: Options());
      final body = result.data;
      final data = body['data'] as List;
      return data.map((e) => CryptoModel.fromMap(e)).toList();
    } on DioError catch (e) {
      throw e.message.toString();
    } catch (e) {
      rethrow;
    }
  }
}
