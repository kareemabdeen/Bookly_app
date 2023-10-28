import 'package:flutter/material.dart';

import '../../Features/Home/presentation/views/book_details_view.dart';
import '../../Features/Home/presentation/views/home_view.dart';
import '../../Features/Search/presentation/views/search_view.dart';
import '../../Features/Splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kSplashView = '/';
  static const kHomeView = '/HomeView';
  static const kDetailsBookView = '/DetailsBookView';
  static const kSearchView = '/searchBookView';

  static Route<dynamic>? onGenetayeRoutes(RouteSettings route) {
    String routeName = route.name!;

    //FIXME: provide the nedded bloc providers here
    switch (routeName) {
      case kSplashView:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case kSearchView:
        return MaterialPageRoute(builder: (context) => const SearchView());

      case kHomeView:
        return MaterialPageRoute(builder: (context) => const HomeView());

      case kDetailsBookView:
        return MaterialPageRoute(builder: (context) => const DetailsBookView());
    }
    return null;
  }
}
