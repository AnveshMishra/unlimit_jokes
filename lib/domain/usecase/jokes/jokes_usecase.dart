import 'package:dartz/dartz.dart';
import 'package:unlimit_jokes_app/core/faliure/failures.dart';
import 'package:unlimit_jokes_app/domain/entity/jokes/jokes_response_entity.dart';
import 'package:unlimit_jokes_app/domain/repo/jokes/jokes_repo.dart';

class JokesUseCase {
  final JokesRepo repo;

  JokesUseCase({
    required this.repo,
  });

  Future<Either<Failure, JokesResponseEntity>> getJokes() {
    //* can be used to for some business logic
    return repo.getJokes();
  }
}
