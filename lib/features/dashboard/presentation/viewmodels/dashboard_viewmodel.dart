import 'package:flutter/material.dart';
import 'package:netflixy/core/error/failures_error.dart';
import 'package:netflixy/core/usecases/usecase.dart';
import 'package:netflixy/features/dashboard/domain/entity/movie_details.dart';
import 'package:netflixy/features/dashboard/domain/usecases/in_theater_movies.dart';
import 'package:netflixy/features/dashboard/domain/usecases/most_popular_movies.dart';
import 'package:netflixy/features/dashboard/domain/usecases/top_250_movies.dart';

class DashboardViewModel extends ChangeNotifier {
  // List of movies
  List<MovieDetails>? inTheaterMovieList;
  List<MovieDetails>? mostPopularMovieList;
  List<MovieDetails>? top250movieList;

  // Manage Visibility
  bool inTheaterVisible = true;
  bool mostPopularVisible = true;
  bool top250Visible = true;

  // Use cases
  final InTheaterMovies inTheaterMovies;
  final MostPopularMovies mostPopularMovies;
  final Top250Movies top250movies;

  DashboardViewModel(
      {required this.inTheaterMovies,
      required this.mostPopularMovies,
      required this.top250movies}) {
    getInTheaterMovies();
    getMostPopularMovies();
    getTop250movies();
  }

  void getInTheaterMovies() async {
    var dataResponse = await inTheaterMovies(NoParams());
    switch (dataResponse.runtimeType) {
      case MoviesResponse:
        MoviesResponse moviesResponse = dataResponse as MoviesResponse;
        inTheaterMovieList = moviesResponse.movies;
        break;
      case NoInternet:
        break;
      case ServerFailure:
        break;
    }
    notifyListeners();
  }

  void getMostPopularMovies() async {
    var dataResponse = await mostPopularMovies(NoParams());
    switch (dataResponse.runtimeType) {
      case MoviesResponse:
        MoviesResponse moviesResponse = dataResponse as MoviesResponse;
        mostPopularMovieList = moviesResponse.movies;
        break;
      case NoInternet:
        break;
      case ServerFailure:
        break;
    }
    notifyListeners();
  }

  void getTop250movies() async {
    var dataResponse = await top250movies(NoParams());
    switch (dataResponse.runtimeType) {
      case MoviesResponse:
        MoviesResponse moviesResponse = dataResponse as MoviesResponse;
        top250movieList = moviesResponse.movies;
        break;
      case NoInternet:
        break;
      case ServerFailure:
        break;
    }
    notifyListeners();
  }

  void manageVisibility(int index) {
    switch (index) {
      case 0:
        // All
        inTheaterVisible = true;
        mostPopularVisible = true;
        top250Visible = true;
        break;
      case 1:
        // Top 250
        inTheaterVisible = false;
        mostPopularVisible = false;
        top250Visible = true;
        break;
      case 2:
        // Most Popular
        inTheaterVisible = false;
        mostPopularVisible = true;
        top250Visible = false;
        break;
      case 3:
        // In Theater
        inTheaterVisible = true;
        mostPopularVisible = false;
        top250Visible = false;
        break;
    }
    notifyListeners();
  }
}
