import 'package:bookly_app/Features/Home/data/reposotory/home_repo_implementaion.dart';
import 'package:bookly_app/Features/Home/presentation/view_model/Futured_books_cubit/featured_books_cubit.dart';
import 'package:bookly_app/Features/Home/presentation/view_model/News_books_cubit/news_books_cubit.dart';
import 'package:bookly_app/core/utils/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Features/Splash/presentation/views/splash_view.dart';
import 'constants.dart';
import 'core/utils/app_router.dart';

void main() {
  setupDependencyInjection();
  runApp(const Booklyapp());
}

class Booklyapp extends StatelessWidget {
  const Booklyapp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchFeturedBooks(), // using spread operator in order to access this method directly when creating cubit
        ),
        BlocProvider(
          create: (context) => NewsBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: AppRouter.onGenetayeRoutes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor:
              kPrimaryColor, // we called mont... theme to take text theme of dark mode in orfer to apply best sellers to white again as default
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        home: const SplashView(),
      ),
    );
  }
}
