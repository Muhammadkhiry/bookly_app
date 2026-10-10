import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "https://api.bigbookapi.com/";
  final String _apiKey = "244ba434ec8547638f752dec9770bfd9";

  final Dio dio;

  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
  }) async {
    final Map<String, dynamic> query = {
      'api-key': _apiKey,
      ...?queryParameters,
    };

    final response = await dio.get(
      '$_baseUrl$endPoint',
      queryParameters: query,
    );
    return response.data;
  }
}
