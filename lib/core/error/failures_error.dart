import 'package:netflixy/core/error/data_response.dart';

abstract class Failure implements DataResponse {}

class ServerFailure extends Failure {}
class NoInternet extends Failure {}
