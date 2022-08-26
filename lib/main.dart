import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:netflixy/core/network/network_info.dart';
import 'package:netflixy/features/dashboard/data/movie_repository_implementation.dart';
import 'package:netflixy/features/dashboard/domain/usecases/in_theater_movies.dart';
import 'package:netflixy/features/dashboard/domain/usecases/most_popular_movies.dart';
import 'package:netflixy/features/dashboard/domain/usecases/top_250_movies.dart';
import 'package:netflixy/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:netflixy/features/dashboard/presentation/viewmodels/dashboard_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
            create: (BuildContext context) {

              var movieRepository = MovieRepositoryImplementation(
                  NetworkInfoImpl(connectivity: Connectivity()));

              return DashboardViewModel(
                  inTheaterMovies: InTheaterMovies(movieRepository),
                  mostPopularMovies: MostPopularMovies(movieRepository),
                  top250movies: Top250Movies(movieRepository));
            },
            child: const DashboardPage()));
  }
}
