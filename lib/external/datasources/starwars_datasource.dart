import 'package:dio/dio.dart';
import 'package:starwars/data/starwars/mappers/starwars_mapper.dart';
import 'package:starwars/domain/starwars/entities/starwars_films_list.dart';
import 'package:starwars/domain/starwars/entities/starwars_people.dart';
import 'package:starwars/domain/starwars/entities/starwars_planets.dart';
import 'package:starwars/domain/starwars/entities/starwars_species.dart';
import 'package:starwars/domain/starwars/entities/starwars_starships.dart';
import 'package:starwars/domain/starwars/entities/starwars_vehicles.dart';
import 'package:starwars/settings/app_constants.dart';

abstract class StarWarsDataSource {
  Future<StarWarsFilmsList?> getStarWarsFilms();
  Future<StarWarsPeopleList?> getStarWarsPeopleList();
  Future<StarWarsPlanetsList?> getStarWarsPlanetsList();
  Future<StarWarsStarshipsList?> getStarWarsStarshipsList();
  Future<StarWarsVehiclesList?> getStarWarsVehiclesList();
  Future<StarWarsSpeciesList?> getStarWarsSpeciesList();
}

class StarWarsDataSourceImp implements StarWarsDataSource {
  var dio = Dio();

  @override
  Future<StarWarsFilmsList?> getStarWarsFilms() async {
    try {
      var url = '${AppConstants.apiUrl}/films';
      final response = await dio.get(url);
      if (response.data != null) {
        final starWarsFilmsList =
            StarWarsMapper.starWarsFilmsFromJson(response.data);

        return starWarsFilmsList;
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }

  @override
  Future<StarWarsPeopleList?> getStarWarsPeopleList() async {
    try {
      var url = '${AppConstants.apiUrl}/people';
      final response = await dio.get(url);
      if (response.data != null) {
        final starWarsPeopleList =
            StarWarsMapper.starWarsPeopleListFromJson(response.data);

        return starWarsPeopleList;
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }

  @override
  Future<StarWarsPlanetsList?> getStarWarsPlanetsList() async {
    try {
      var url = '${AppConstants.apiUrl}/planets';
      final response = await dio.get(url);
      if (response.data != null) {
        final starWarsPlanetsList =
            StarWarsMapper.starWarsPlanetsListFromJson(response.data);

        return starWarsPlanetsList;
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }

  @override
  Future<StarWarsStarshipsList?> getStarWarsStarshipsList() async {
    try {
      var url = '${AppConstants.apiUrl}/starships';
      final response = await dio.get(url);
      if (response.data != null) {
        final starWarsStarshipsList =
            StarWarsMapper.starWarsStarshipListFromJson(response.data);

        return starWarsStarshipsList;
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }

  @override
  Future<StarWarsVehiclesList?> getStarWarsVehiclesList() async {
    try {
      var url = '${AppConstants.apiUrl}/vehicles';
      final response = await dio.get(url);
      if (response.data != null) {
        final starWarsVehiclesList =
            StarWarsMapper.starWarsVehiclesListFromJson(response.data);

        return starWarsVehiclesList;
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }

  @override
  Future<StarWarsSpeciesList?> getStarWarsSpeciesList() async {
    try {
      var url = '${AppConstants.apiUrl}/species';
      final response = await dio.get(url);
      if (response.data != null) {
        final starWarsSpeciesList =
            StarWarsMapper.starWarsSpeciesListFromJson(response.data);

        return starWarsSpeciesList;
      }
    } catch (e) {
      rethrow;
    }

    return null;
  }
}
