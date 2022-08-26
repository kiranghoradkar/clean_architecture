import 'package:netflixy/core/error/data_response.dart';
import 'package:netflixy/core/usecases/usecase.dart';
import 'package:netflixy/features/dashboard/domain/entity/movie_details.dart';
import 'package:netflixy/features/dashboard/domain/repositories/movies_repository.dart';

class InTheaterMovies implements UseCase<MoviesResponse, NoParams> {
  final MovieRepository moviesRepository;
  InTheaterMovies(this.moviesRepository);

  @override
  Future<DataResponse> call(NoParams params) {
    return moviesRepository.getInTheaterMovies();
  }
}