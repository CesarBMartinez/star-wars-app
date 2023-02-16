part of 'movie_species_cubit.dart';

abstract class MovieSpeciesState {}

class MovieSpeciesSuccess extends MovieSpeciesState {
  MovieSpeciesSuccess({required this.starWarsSpeciesList});

  final StarWarsSpeciesList starWarsSpeciesList;
}

class MovieSpeciesLoading extends MovieSpeciesState {}

class MovieSpeciesInitial extends MovieSpeciesState {}

class MovieSpeciesError extends MovieSpeciesState {}
