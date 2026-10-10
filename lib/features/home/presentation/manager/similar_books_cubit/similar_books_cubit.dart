import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit({required this.homeRepo,})
    : super(SimilarBooksInitial());

  final HomeRepo homeRepo;

  Future fetchBestSellerBooks() async {
    emit(SimilarBooksInitial());
    var result = await homeRepo.fetchSimilarBooks();

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
