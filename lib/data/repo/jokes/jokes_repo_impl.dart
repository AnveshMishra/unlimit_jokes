import 'package:dartz/dartz.dart';
import 'package:unlimit_jokes_app/core/faliure/failures.dart';
import 'package:unlimit_jokes_app/data/datasoures/joke/jokes_remote_data_source.dart';
import 'package:unlimit_jokes_app/domain/entity/jokes/jokes_response_entity.dart';
import 'package:unlimit_jokes_app/domain/repo/jokes/jokes_repo.dart';

class JokeRepoImpl extends JokesRepo {
  final JokeRemoteDataSource dataSource;

  JokeRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, JokesResponseEntity>> getJokes() async {
    try {
      final result = await dataSource.getJokeResponse();
      return right(result);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
