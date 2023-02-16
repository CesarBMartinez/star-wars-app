part of 'movie_characters_cubit.dart';

abstract class MovieCharactersState {}

class MovieCharactersSuccess extends MovieCharactersState {
  MovieCharactersSuccess({required this.starWarsPeopleList});

  final StarWarsPeopleList starWarsPeopleList;
}

class MovieCharactersLoading extends MovieCharactersState {}

class MovieCharactersInitial extends MovieCharactersState {}

class MovieCharactersError extends MovieCharactersState {}
