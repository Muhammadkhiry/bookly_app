import 'package:bookly_app/features/favorite/presentation/manager/fav_cubit/fav_state.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial()) {
    fetchFavBooks();
    Hive.box<BookModel>('favBox').listenable().addListener(() {
      fetchFavBooks();
    });
  }

  void fetchFavBooks() {
    try {
      var box = Hive.box<BookModel>('favBox');
      List<BookModel> books = box.values.toList();
      emit(FavLoading());
      emit(FavSuccess(List.from(books)));
    } catch (e) {
      emit(FavFailure(e.toString()));
    }
  }
}
