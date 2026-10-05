import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/features/favorite/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:bookly_app/features/favorite/presentation/views/widgets/fav_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavView extends StatelessWidget {
  const FavView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavCubit()..fetchFavBooks(),
      child: const Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 25, top: 15),
                child: Text("Favorite Books", style: Styles.textStyle20),
              ),
              Expanded(child: FavViewBody()),
            ],
          ),
        ),
      ),
    );
  }
}
