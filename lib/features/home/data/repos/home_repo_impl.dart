import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(
        endPoint: "search-books",
        queryParameters: {
          'query': 'books',
          'sort': 'rating',
          'sort-direction': 'DESC',
          'group-results': 'true',
        },
      );

      List<BookModel> books = [];
      // Big Book API بترجع المادة جوه قائمة باسم "books"
      for (var bookMap in data["books"]) {
        // لو الـ API بيرجع الـ book جواه Array غلفه بالطريقة دي:
        if (bookMap is List && bookMap.isNotEmpty) {
          books.add(BookModel.fromJson(bookMap[0]));
        } else {
          books.add(BookModel.fromJson(bookMap));
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: "search-books",
        queryParameters: {
          'query': 'books',
          'sort': 'rating',
          'sort-direction': 'DESC',
          'number': 50,
        },
      );

      List<BookModel> books = [];
      for (var bookMap in data["books"]) {
        if (bookMap is List && bookMap.isNotEmpty) {
          books.add(BookModel.fromJson(bookMap[0]));
        } else {
          books.add(BookModel.fromJson(bookMap));
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
