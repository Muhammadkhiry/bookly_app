import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/presentation/manager/best_books_cubit/best_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const new({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestBooksCubit, BestBooksState>(
      builder: (context, state) {
        if (state is BestBooksSucceeded) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (BuildContext context, int index) {
              return BestSellerItem(bookModel: state.books[index]);
            },
          );
        } else if (state is BestBooksFailure) {
          return CustomErrorWidget(errMessage: "err");
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
