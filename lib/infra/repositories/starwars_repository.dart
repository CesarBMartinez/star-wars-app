import 'package:starwars/domain/starwars/entities/starwars_films_list.dart';
import 'package:starwars/domain/starwars/entities/starwars_people.dart';
import 'package:starwars/domain/starwars/entities/starwars_species.dart';
import 'package:starwars/domain/starwars/entities/starwars_starships.dart';
import 'package:starwars/domain/starwars/entities/starwars_planets.dart';
import 'package:starwars/domain/starwars/entities/starwars_vehicles.dart';
import 'package:starwars/domain/starwars/respositories/starwars_repository.dart';
import 'package:starwars/external/datasources/starwars_datasource.dart';

class StarWarsRepositoryImp implements StarWarsRepository {
  StarWarsRepositoryImp({required this.starWarsDataSource});

  final StarWarsDataSource starWarsDataSource;

  @override
  Future<StarWarsFilmsList?> getStarWarsFilms() async {
    try {
      return starWarsDataSource.getStarWarsFilms();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StarWarsPeopleList?> getStarWarsPeople() async {
    try {
      return starWarsDataSource.getStarWarsPeopleList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StarWarsPlanetsList?> getStarWarsPlanets() async {
    try {
      return starWarsDataSource.getStarWarsPlanetsList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StarWarsStarshipsList?> getStarWarsStarships() async {
    try {
      return starWarsDataSource.getStarWarsStarshipsList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StarWarsVehiclesList?> getStarWarsVehicles() async {
    try {
      return starWarsDataSource.getStarWarsVehiclesList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<StarWarsSpeciesList?> getStarWarsSpecies() async {
    try {
      return starWarsDataSource.getStarWarsSpeciesList();
    } catch (e) {
      rethrow;
    }
  }
}
