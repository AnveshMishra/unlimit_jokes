part of 'jokes_bloc.dart';

abstract class JokesState extends Equatable {
  const JokesState();

  @override
  List<Object> get props => [];
}

final class JokesInitial extends JokesState {}

final class RefreshList extends JokesState {}

final class ShowJokeList extends JokesState {}
