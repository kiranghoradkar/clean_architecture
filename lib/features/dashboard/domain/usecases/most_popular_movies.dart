import 'package:netflixy/core/error/data_response.dart';
import 'package:netflixy/core/usecases/usecase.dart';
import 'package:netflixy/features/dashboard/domain/entity/movie_details.dart';
import 'package:netflixy/features/dashboard/domain/repositories/movies_repository.dart';

class MostPopularMovies implements UseCase<MoviesResponse, NoParams> {
  final MovieRepository moviesRepository;
  MostPopularMovies(this.moviesRepository);

  @override
  Future<DataResponse> call(NoParams params) {
    return moviesRepository.getMostPopularMovies();
  }
}