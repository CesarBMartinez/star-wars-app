import 'package:starwars/domain/starwars/entities/starwars_films_list.dart';
import 'package:starwars/domain/starwars/entities/starwars_people.dart';
import 'package:starwars/domain/starwars/entities/starwars_planets.dart';
import 'package:starwars/domain/starwars/entities/starwars_species.dart';
import 'package:starwars/domain/starwars/entities/starwars_starships.dart';
import 'package:starwars/domain/starwars/entities/starwars_vehicles.dart';

abstract class StarWarsRepository {
  Future<StarWarsFilmsList?> getStarWarsFilms();
  Future<StarWarsPeopleList?> getStarWarsPeople();
  Future<StarWarsPlanetsList?> getStarWarsPlanets();
  Future<StarWarsStarshipsList?> getStarWarsStarships();
  Future<StarWarsVehiclesList?> getStarWarsVehicles();
  Future<StarWarsSpeciesList?> getStarWarsSpecies();
}
