import 'package:bookly_app/features/favorite/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:bookly_app/features/favorite/presentation/manager/fav_cubit/fav_state.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavViewBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is FavSuccess) {
          if (state.books.isEmpty) {
            return const Center(child: Text('No favorite books yet.'));
          }
          return ListView.builder(
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return CustomListViewItem(
                imageURL: state.books[index].image ?? '',
              );
            },
          );
        } else if (state is FavFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
