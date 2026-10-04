import 'package:bookly_app/features/favorite/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  Box<BookModel> get _favBox => Hive.box<BookModel>('favBox');

  @override
  List<BookModel> fetchFavorites() {
    return _favBox.values.toList();
  }

  @override
  Future<void> addBookToFavorites(BookModel book) async {
    await _favBox.add(book);
  }
}
