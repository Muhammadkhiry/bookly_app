import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/favorite/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:bookly_app/features/favorite/presentation/views/fav_view.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly_app/features/home/presentation/manager/best_books_cubit/best_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

enum SelectedTab { home, favorites }

class _HomeViewState extends State<HomeView> {
  var _selectedTab = SelectedTab.home;

  final List<Widget> _screens = const [HomeViewBody(), FavView()];

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = SelectedTab.values[i];
    });

    if (_selectedTab == SelectedTab.favorites) {
      context.read<FavCubit>().getFavorites();
    }
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
        BlocProvider(
          create: (context) =>
              FavCubit(getIt.get<HomeRepoImpl>())..getFavorites(),
        ),
      ],
      child: Scaffold(
        body: IndexedStack(
          index: SelectedTab.values.indexOf(_selectedTab),
          children: _screens,
        ),
        extendBody: true,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 75.0),
          child: CrystalNavigationBar(
            currentIndex: SelectedTab.values.indexOf(_selectedTab),
            height: 10,
            unselectedItemColor: Colors.white70,
            selectedItemColor: Colors.white,
            // ignore: deprecated_member_use
            backgroundColor: Colors.white.withOpacity(0.2),
            onTap: _handleIndexChanged,
            items: [
              /// Item 0: Home
              CrystalNavigationBarItem.svg(
                iconPath: "assets/images/books.svg",
                unselectedIconPath: "assets/images/books.svg",
                selectedColor: Colors.white,
              ),

              /// Item 1: Favorites / Bookmark
              CrystalNavigationBarItem(
                icon: Icons.bookmark,
                unselectedIcon: Icons.bookmark,
                selectedColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
