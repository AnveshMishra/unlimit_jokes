import 'package:dartz/dartz.dart';

import '../../../core/faliure/failures.dart';
import '../../entity/jokes/jokes_response_entity.dart';

abstract class JokesRepo {
  Future<Either<Failure, JokesResponseEntity>> getJokes();
}
