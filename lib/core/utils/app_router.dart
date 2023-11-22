import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Features/Home/data/models/book_model/book_model.dart';
import '../../Features/Home/data/reposotory/home_repo_implementaion.dart';
import '../../Features/Home/presentation/view_model/FetchSimilarbooks_cubit/fetch_similarbooks_cubit.dart';
import '../../Features/Home/presentation/views/book_details_view.dart';
import '../../Features/Home/presentation/views/home_view.dart';
import '../../Features/Search/presentation/views/search_view.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';
import 'dependency_injection.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kHomeView = '/HomeView';
  static const kDetailsBookView = '/DetailsBookView';
  static const kSearchView = '/searchBookView';

  static Route<dynamic>? onGenetayeRoutes(RouteSettings route) {
    String routeName = route.name!;

    switch (routeName) {
      case kSplashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case kSearchView:
        return MaterialPageRoute(builder: (context) => const SearchView());

      case kHomeView:
        return MaterialPageRoute(builder: (context) => const HomeView());

      case kDetailsBookView:
        // ignore: unused_local_variable
        final BookModel bookModel = route.arguments
            as BookModel; // recive the object that passed when the user clicked on the book object in BookListViewItem
        return MaterialPageRoute(
          builder: (context) => BlocProvider<FetchSimilarbooksCubit>(
            create: (context) =>
                FetchSimilarbooksCubit(getIt.get<HomeRepoImpl>()),
            child: DetailsBookView(bookModel: bookModel),
          ),
        );
    }
    return null;
  }
}
