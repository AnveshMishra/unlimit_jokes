import 'package:get_it/get_it.dart';
import 'package:unlimit_jokes_app/data/datasoures/joke/jokes_remote_data_source.dart';
import 'package:unlimit_jokes_app/data/repo/jokes/jokes_repo_impl.dart';
import 'package:unlimit_jokes_app/domain/usecase/jokes/jokes_usecase.dart';
import 'package:unlimit_jokes_app/presentation/pages/jokes_listing/bloc/jokes_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; // service locator

Future<void> initDependencies() async {
  //* Application Layer:
  sl.registerFactory(
    () => JokesBloc(useCase: sl()),
  );

  //* domain layer:
  sl.registerFactory(
    () => JokesUseCase(
      repo: sl<JokeRepoImpl>(),
    ),
  );

  //* data layer
  sl.registerFactory(
    () => JokeRepoImpl(
      dataSource: JokeRemoteDataSourceImpl(
        client: sl(),
      ),
    ),
  );
  //* external:
  sl.registerFactory(
    () => http.Client(),
  );
}
