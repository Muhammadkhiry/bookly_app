import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/search_cubit/search_state.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const Center(child: Text('Search for a book to get started'));
        }

        if (state is SearchLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is SearchFailure) {
          return Center(child: Text(state.errMessage));
        }

        if (state is SearchSuccess) {
          if (state.books.isEmpty) {
            return const Center(child: Text('No books found'));
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              final book = state.books[index];
              return BestSellerItem(bookModel: book);
            },
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
