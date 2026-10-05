import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;
  List<BookModel> featuredBooks = [];

  Future<void> fetchFeaturedBooks() async {
    if (featuredBooks.isNotEmpty) {
      emit(FeaturedBooksSucceeded(books: featuredBooks));
      return;
    }

    emit(FeaturedBooksLoading());
    var result = await homeRepo.fetchFeaturedBooks();
    result.fold(
      (failure) {
        emit(FeaturedBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        featuredBooks = books;
        emit(FeaturedBooksSucceeded(books: books));
      },
    );
  }
}
