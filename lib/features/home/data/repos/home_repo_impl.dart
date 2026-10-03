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
          'query': 'programming',
          'sort': 'rating',
          'sort-direction': 'DESC',
          'group-results': 'true',
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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: "search-books",
        queryParameters: {
          'query': 'cooking',
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
