import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:unlimit_jokes_app/core/utils/shared_pref/shared_pref_utils.dart';
import 'package:unlimit_jokes_app/domain/entity/jokes/jokes_response_entity.dart';
import 'package:unlimit_jokes_app/domain/usecase/jokes/jokes_usecase.dart';

import '../../../../core/utils/shared_pref/pref_keys.dart';

part 'jokes_event.dart';
part 'jokes_state.dart';

class JokesBloc extends Bloc<JokesEvent, JokesState> {
  List<String> jokesList = [];
  final JokesUseCase useCase;
  JokesBloc({required this.useCase}) : super(JokesInitial()) {
    on<JokesInit>((event, emit) async {
      await _fetchJokes().then(
        (value) {
          jokesList.addAll(value);
        },
      ).whenComplete(
        () async {
          await SharedPreferencesUtils()
              .addStringList(key: jokeListPrefKey, value: jokesList)
              .whenComplete(() => {
                    emit(RefreshList()),
                    emit(ShowJokeList()),
                  });
        },
      );
    });
    on<GetJokeFromApi>((event, emit) async {
      await _fetchJokesFromApi().then((value) {
        jokesList.addAll(value);
        jokesList = jokesList.reversed.toList();
        if (jokesList.length > 10) {
          jokesList = jokesList.sublist(0, 10);
        }
      }).whenComplete(
        () async {
          await SharedPreferencesUtils()
              .addStringList(key: jokeListPrefKey, value: jokesList)
              .whenComplete(() => {
                    emit(RefreshList()),
                    emit(ShowJokeList()),
                  });
        },
      );
    });
  }

  Future<List<String>> _fetchJokes() async {
    List<String>? data =
        await SharedPreferencesUtils().getStringList(key: jokeListPrefKey);
    if (data != null && data.isNotEmpty) {
      return data;
    } else {
      return await _fetchJokesFromApi();
    }
  }

  Future<List<String>> _fetchJokesFromApi() async {
    List<String> jokesList = [];
    await useCase.getJokes().then(
      (value) {
        value.fold(
          (l) => null,
          (JokesResponseEntity r) {
            if (r.joke != null) {
              jokesList.add(r.joke ?? '');
            }
          },
        );
      },
    );
    return jokesList;
  }
}
