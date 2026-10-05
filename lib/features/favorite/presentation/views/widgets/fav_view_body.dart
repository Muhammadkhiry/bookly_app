import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/favorite/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:bookly_app/features/favorite/presentation/manager/fav_cubit/fav_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/best_seller_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavViewBody extends StatelessWidget {
  const FavViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 20, bottom: 20),
            child: Text('Favorite Books', style: Styles.textStyle18),
          ),
        ),
        SliverFillRemaining(
          child: BlocBuilder<FavCubit, FavState>(
            builder: (context, state) {
              if (state is FavSuccess) {
                if (state.books.isEmpty) {
                  return const Center(
                    child: Text(
                      'No favorite books yet',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.only(
                    bottom: 100,
                  ), 
                  physics: const NeverScrollableScrollPhysics(), 
                  itemBuilder: (context, index) {
                    final book = state.books[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: BestSellerItem(bookModel: book),
                    );
                  },
                );
              } else if (state is FavFailure) {
                return Center(
                  child: Text(
                    state.errMessage,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
