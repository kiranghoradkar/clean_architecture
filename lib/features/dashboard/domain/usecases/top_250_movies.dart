import 'package:netflixy/core/error/data_response.dart';
import 'package:netflixy/core/usecases/usecase.dart';
import 'package:netflixy/features/dashboard/domain/entity/movie_details.dart';
import 'package:netflixy/features/dashboard/domain/repositories/movies_repository.dart';

class Top250Movies implements UseCase<MoviesResponse, NoParams> {
  final MovieRepository moviesRepository;
  Top250Movies(this.moviesRepository);

  @override
  Future<DataResponse> call(NoParams params) {
    return moviesRepository.getTop250Movies();
  }
}