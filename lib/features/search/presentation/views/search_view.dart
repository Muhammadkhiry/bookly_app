import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repos/search_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly_app/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Row(
              children: [
                IconButton(
                  onPressed: () =>
                      GoRouter.of(context).push(AppRouter.kHomeView),
                  icon: Icon(Icons.arrow_back),
                ),
                SvgPicture.asset("assets/images/Overlay.svg"),
                SizedBox(width: 19),
                Text(
                  "Explore search",
                  style: Styles.textStyle30.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Color(0xffE7DEFC),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => SearchCubit(getIt.get<SearchRepoImpl>()),
        child: SearchViewBody(),
      ),
    );
  }
}
