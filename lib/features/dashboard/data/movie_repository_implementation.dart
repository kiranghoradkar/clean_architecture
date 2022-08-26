import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflixy/core/error/failures_error.dart';
import 'package:netflixy/core/network/network_info.dart';
import 'package:netflixy/core/error/data_response.dart';
import 'package:netflixy/core/utilities/constants.dart';
import 'package:netflixy/features/dashboard/domain/entity/movie_details.dart';
import 'package:netflixy/features/dashboard/domain/repositories/movies_repository.dart';

class MovieRepositoryImplementation implements MovieRepository {
  final NetworkInfo networkInfo;

  MovieRepositoryImplementation(this.networkInfo);

  @override
  Future<DataResponse> getInTheaterMovies() async {
    if (await networkInfo.isConnected) {
      final response =
      await http.get(Uri.parse(StringConstant.inTheaterMovieApi));

      if (response.statusCode == 200) {
        return MoviesResponse.fromJson(jsonDecode(response.body));
      } else {
        return ServerFailure();
      }
    } else {
      return NoInternet();
    }
  }

  @override
  Future<DataResponse> getMostPopularMovies() async {
    if (await networkInfo.isConnected) {
      final response = await http.get(Uri.parse(StringConstant.mostPopularApi));

      if (response.statusCode == 200) {
        return MoviesResponse.fromJson(jsonDecode(response.body));
      } else {
        return ServerFailure();
      }
    } else {
      return NoInternet();
    }
  }

  @override
  Future<DataResponse> getTop250Movies() async {
    if (await networkInfo.isConnected) {
      final response =
      await http.get(Uri.parse(StringConstant.top250MoviesAPI));

      if (response.statusCode == 200) {
        return MoviesResponse.fromJson(jsonDecode(response.body));
      } else {
        return ServerFailure();
      }
    } else {
      return NoInternet();
    }
  }

}
