part of 'movie_starships_cubit.dart';

abstract class MovieStarshipsState {}

class MovieStarshipsSuccess extends MovieStarshipsState {
  MovieStarshipsSuccess({required this.starWarsStarshipsList});

  final StarWarsStarshipsList starWarsStarshipsList;
}

class MovieStarshipsLoading extends MovieStarshipsState {}

class MovieStarshipsInitial extends MovieStarshipsState {}

class MovieStarshipsError extends MovieStarshipsState {}
