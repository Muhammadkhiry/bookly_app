import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/service_locator.dart';
import 'package:bookly_app/features/favorite/presentation/manager/fav_cubit/fav_cubit.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/author.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/book_details_model/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(BookModelAdapter());
  Hive.registerAdapter(AuthorAdapter());
  Hive.registerAdapter(RatingAdapter());

  await Hive.openBox<BookModel>('favBox');

  setupServiceLocator();

  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FavCubit()..fetchFavBooks()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
      ),
    );
  }
}
