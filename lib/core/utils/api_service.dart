import 'package:dio/dio.dart';

class ApiService {
  final String baseURL = "https://api.bigbookapi.com/search-books";
  final String apiKey = "f4e5202f79ea42058a97f56148996c8a";

  final Dio dio;

  new({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await dio.get("$baseURL?api-key$apiKey&$endPoint");
    return response.data;
  }
}
