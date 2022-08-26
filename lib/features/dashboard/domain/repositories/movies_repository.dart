import 'package:netflixy/core/error/data_response.dart';

abstract class MovieRepository {
  Future<DataResponse> getTop250Movies();
  Future<DataResponse> getMostPopularMovies();
  Future<DataResponse> getInTheaterMovies();
}