import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_books_state.dart';

class BestBooksCubit extends Cubit<BestBooksState> {
  BestBooksCubit({required this.homeRepo}) : super(BestBooksInitial());

  final HomeRepo homeRepo;

  Future fetchFeaturedBooks() async {
    emit(BestBooksInitial());
    var result = await homeRepo.fetchFeaturedBooks();

    result.fold(
      (failure) {
        emit(BestBooksFailure(errMessgae: failure.errMessage));
      },
      (books) {
        emit(BestBooksSucceeded(books: books));
      },
    );
  }
}
