part of 'movie_planets_cubit.dart';

abstract class MoviePlanetsState {}

class MoviePlanetsSuccess extends MoviePlanetsState {
  MoviePlanetsSuccess({required this.starWarsPlanetsList});

  final StarWarsPlanetsList starWarsPlanetsList;
}

class MoviePlanetsLoading extends MoviePlanetsState {}

class MoviePlanetsInitial extends MoviePlanetsState {}

class MoviePlanetsError extends MoviePlanetsState {}
