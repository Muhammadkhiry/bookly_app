import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks({
    required String bookName,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: "search-books",
        queryParameters: {
          'query': bookName,
          'number': 20,
        },
      );

      List<BookModel> books = [];
      if (data["books"] != null) {
        for (var bookMap in data["books"]) {
          if (bookMap is List && bookMap.isNotEmpty) {
            books.add(BookModel.fromJson(bookMap[0]));
          } else {
            books.add(BookModel.fromJson(bookMap));
          }
        }
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(errMessage: e.toString()));
    }
  }
}