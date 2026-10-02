import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_service.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  new({required this.apiService});
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            "&query=books&sort=rating&sort-direction=DESC&group-results=true",
      );
      List<BookModel> books = [];
      for (var book in data["books"]) {
        books.add(book);
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: "&query=books&sort=rating&sort-direction=DESC",
      );
      List<BookModel> books = [];
      for (var book in data["books"]) {
        books.add(book);
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(ServiceFailure.fromDioError(e));
      }
      return left(ServiceFailure(errMessage: e.toString()));
    }
  }
}
