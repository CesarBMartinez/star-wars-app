part of 'movies_page_cubit.dart';

abstract class MoviesPageState {}

class MoviesPageSuccess extends MoviesPageState {
  MoviesPageSuccess({required this.starWarsFilmsList});

  final StarWarsFilmsList starWarsFilmsList;
}

class MoviesPageInitial extends MoviesPageState {}

class MoviesPageLoading extends MoviesPageState {}

class MoviesPageError extends MoviesPageState {}
