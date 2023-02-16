part of 'movie_vehicles_cubit.dart';

abstract class MovieVehiclesState {}

class MovieVehiclesSuccess extends MovieVehiclesState {
  MovieVehiclesSuccess({required this.starWarsVehiclesList});

  final StarWarsVehiclesList starWarsVehiclesList;
}

class MovieVehiclesLoading extends MovieVehiclesState {}

class MovieVehiclesInitial extends MovieVehiclesState {}

class MovieVehiclesError extends MovieVehiclesState {}
