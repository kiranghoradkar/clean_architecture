import 'package:netflixy/core/error/data_response.dart';

abstract class UseCase<Type, Params> {
  Future<DataResponse> call(Params params);
}

class NoParams {}

class Params {}
