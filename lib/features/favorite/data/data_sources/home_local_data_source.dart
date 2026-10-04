import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';

abstract class HomeLocalDataSource {
  List<BookModel> fetchFavorites();
  Future<void> addBookToFavorites(BookModel book);
}