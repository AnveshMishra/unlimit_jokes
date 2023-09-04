part of 'jokes_bloc.dart';

abstract class JokesEvent extends Equatable {
  const JokesEvent();

  @override
  List<Object> get props => [];
}

class JokesInit extends JokesEvent {}

class GetJokeFromApi extends JokesEvent {}
