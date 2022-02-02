import 'package:dio/dio.dart';
import '../../helpers/failure.dart';
import '../models/currencies.dart';
import 'remote_datasource.dart';

abstract class CurrenciesRemoteDatasource {
  Future<Currencies?> fetch();
}

class CurrenciesRemoteDatasourceImpl extends RemoteDatasource
    implements CurrenciesRemoteDatasource {
  final Dio _httpClient;

  const CurrenciesRemoteDatasourceImpl(this._httpClient);

  @override
  Future<Currencies?> fetch() async {
    try {
      final Response response = await _httpClient.get(
          "https://api.hgbrasil.com/finance",
          queryParameters: {'format': 'json', 'key': 'a077f4c2'});
      final result = handleResponse<Map<String, dynamic>>(response);
      if (result == null) return null;
      return Currencies.fromMap(result['results']['currencies']);
    } on Failure {
      rethrow;
    } on DioError catch (error, stackTrace) {
      throw ServerError.generic(stackTrace: stackTrace);
    } catch (error, stackTrace) {
      throw DatasourceError(message: error.toString(), stackTrace: stackTrace);
    }
  }
}
