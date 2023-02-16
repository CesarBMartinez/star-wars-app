import 'package:starwars/domain/starwars/entities/starwars_films_list.dart';
import 'package:starwars/domain/starwars/entities/starwars_people.dart';
import 'package:starwars/domain/starwars/entities/starwars_planets.dart';
import 'package:starwars/domain/starwars/entities/starwars_species.dart';
import 'package:starwars/domain/starwars/entities/starwars_starships.dart';
import 'package:starwars/domain/starwars/entities/starwars_vehicles.dart';

abstract class StarWarsMapper {
  static StarWarsFilmsList starWarsFilmsFromJson(Map<String, dynamic> json) {
    return StarWarsFilmsList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List.from(json['results'])
          .map((e) => starWarsFilmFromJson(e))
          .toList(),
    );
  }

  static StarWarsFilm starWarsFilmFromJson(Map<String, dynamic> json) {
    return StarWarsFilm(
      title: json['title'],
      episodeId: json['episode_id'],
      openingCrawl: json['opening_crawl'],
      director: json['director'],
      producer: json['producer'],
      releaseDate: json['release_date'],
      characters: json['characters'],
      planets: json['planets'],
      starships: json['starships'],
      vehicles: json['vehicles'],
      species: json['species'],
      url: json['url'],
    );
  }

  static StarWarsPeopleList starWarsPeopleListFromJson(
      Map<String, dynamic> json) {
    return StarWarsPeopleList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List.from(json['results'])
          .map((e) => starWarsPeopleFromJson(e))
          .toList(),
    );
  }

  static StarWarsPeople starWarsPeopleFromJson(Map<String, dynamic> json) {
    return StarWarsPeople(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
      eyeColor: json['eye_color'],
      birthYear: json['birth_year'],
      gender: json['gender'],
      homeworld: json['homeworld'],
      films: List.castFrom<dynamic, String>(json['films']),
      species: List.castFrom<dynamic, dynamic>(json['species']),
      vehicles: List.castFrom<dynamic, String>(json['vehicles']),
      starships: List.castFrom<dynamic, String>(json['starships']),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }

  static StarWarsPlanetsList starWarsPlanetsListFromJson(
      Map<String, dynamic> json) {
    return StarWarsPlanetsList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List.from(json['results'])
          .map((e) => starWarsPlanetFromJson(e))
          .toList(),
    );
  }

  static StarWarsPlanet starWarsPlanetFromJson(Map<String, dynamic> json) {
    return StarWarsPlanet(
      name: json['name'],
      rotationPeriod: json['rotation_period'],
      orbitalPeriod: json['orbital_period'],
      diameter: json['diameter'],
      climate: json['climate'],
      gravity: json['gravity'],
      terrain: json['terrain'],
      surfaceWater: json['surface_water'],
      population: json['population'],
      residents: List.castFrom<dynamic, String>(json['residents']),
      films: List.castFrom<dynamic, String>(json['films']),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }

  static StarWarsStarshipsList starWarsStarshipListFromJson(
      Map<String, dynamic> json) {
    return StarWarsStarshipsList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List.from(json['results'])
          .map((e) => starWarsStarshipFromJson(e))
          .toList(),
    );
  }

  static StarWarsStarship starWarsStarshipFromJson(Map<String, dynamic> json) {
    return StarWarsStarship(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      costInCredits: json['cost_in_credits'],
      length: json['length'],
      maxAtmospheringSpeed: json['max_atmosphering_speed'],
      crew: json['crew'],
      passengers: json['passengers'],
      cargoCapacity: json['cargo_capacity'],
      consumables: json['consumables'],
      hyperdriveRating: json['hyperdrive_rating'],
      starshipClass: json['starship_class'],
      pilots: List.castFrom<dynamic, dynamic>(json['pilots']),
      films: List.castFrom<dynamic, String>(json['films']),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }

  static StarWarsVehiclesList starWarsVehiclesListFromJson(
      Map<String, dynamic> json) {
    return StarWarsVehiclesList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List.from(json['results'])
          .map((e) => starWarsVehicleFromJson(e))
          .toList(),
    );
  }

  static StarWarsVehicle starWarsVehicleFromJson(Map<String, dynamic> json) {
    return StarWarsVehicle(
      name: json['name'],
      model: json['model'],
      manufacturer: json['manufacturer'],
      costInCredits: json['cost_in_credits'],
      length: json['length'],
      maxAtmospheringSpeed: json['max_atmosphering_speed'],
      crew: json['crew'],
      passengers: json['passengers'],
      cargoCapacity: json['cargo_capacity'],
      consumables: json['consumables'],
      vehicleClass: json['vehicle_class'],
      pilots: List.castFrom<dynamic, dynamic>(json['pilots']),
      films: List.castFrom<dynamic, String>(json['films']),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }

  static StarWarsSpeciesList starWarsSpeciesListFromJson(
      Map<String, dynamic> json) {
    return StarWarsSpeciesList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List.from(json['results'])
          .map((e) => starWarsSpecieFromJson(e))
          .toList(),
    );
  }

  static StarWarsSpecie starWarsSpecieFromJson(Map<String, dynamic> json) {
    return StarWarsSpecie(
      name: json['name'],
      classification: json['classification'],
      designation: json['designation'],
      averageHeight: json['average_height'],
      skinColors: json['skin_colors'],
      hairColors: json['hair_colors'],
      eyeColors: json['eye_colors'],
      averageLifespan: json['average_lifespan'],
      homeworld: json['homeworld'] ?? 'n/a',
      language: json['language'],
      people: List.castFrom<dynamic, String>(json['people']),
      films: List.castFrom<dynamic, String>(json['films']),
      created: json['created'],
      edited: json['edited'],
      url: json['url'],
    );
  }
}
