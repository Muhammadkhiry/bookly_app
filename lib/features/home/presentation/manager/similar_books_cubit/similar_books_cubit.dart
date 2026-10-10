import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.homeRepo, required this.bookName})
    : super(SimilarBooksInitial());

  final HomeRepo homeRepo;
  final String bookName;

  Future fetchBestSellerBooks() async {
    emit(SimilarBooksInitial());
    var result = await homeRepo.fetchSimilarBooks(bookName: bookName);

    result.fold(
      (failure) {
        emit(SimilarBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(SimilarBooksSucceeded(books: books));
      },
    );
  }
}
