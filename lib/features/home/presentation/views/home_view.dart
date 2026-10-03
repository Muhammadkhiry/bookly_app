import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/best_books_cubit/best_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const new({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum SelectedTab { home, search, favorites, profile }

class _HomeViewState extends State<HomeView> {
  var _selectedTab = SelectedTab.home;
  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBooksCubit(homeRepo: getIt.get<HomeRepoImpl>())
                ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              BestBooksCubit(homeRepo: getIt.get<HomeRepoImpl>())
                ..fetchBestSellerBooks(),
        ),
      ],
      child: Scaffold(
        body: HomeViewBody(),
        extendBody: true,
        bottomNavigationBar: CrystalNavigationBar(
          currentIndex: SelectedTab.values.indexOf(_selectedTab),
          height: 10,
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          // ignore: deprecated_member_use
          backgroundColor: Colors.white.withOpacity(0.2),
          onTap: _handleIndexChanged,
          items: [
            /// book
            CrystalNavigationBarItem.svg(
              iconPath: "assets/images/books.svg",
              unselectedIconPath: "assets/images/books.svg",
              selectedColor: Colors.white,
            ),

            /// book mark
            CrystalNavigationBarItem(
              icon: Icons.bookmark,
              unselectedIcon: Icons.bookmark,
              selectedColor: Colors.white,
            ),

            /// library music
            CrystalNavigationBarItem.svg(
              iconPath: "assets/images/audio.svg",
              unselectedIconPath: "assets/images/audio.svg",
              selectedColor: Colors.white,
            ),

            /// user avatar
            CrystalNavigationBarItem(
              icon: Icons.person_outline,
              unselectedIcon: Icons.person_outline,
              selectedColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
