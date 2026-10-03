
import 'package:bookly_app/features/home/data/repos/search_repo.dart';
import 'package:bookly_app/features/home/presentation/manager/search_cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepo searchRepo;

  SearchCubit(this.searchRepo) : super(SearchInitial());

  Future<void> fetchSearchedBooks({required String bookName}) async {
    if (bookName.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());
    var result = await searchRepo.fetchSearchedBooks(bookName: bookName);

    result.fold(
      (failure) => emit(SearchFailure(errMessage: failure.errMessage)),
      (books) => emit(SearchSuccess(books: books)),
    );
  }
}