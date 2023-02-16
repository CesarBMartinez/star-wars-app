import 'package:get_it/get_it.dart';
import 'package:starwars/domain/starwars/respositories/starwars_repository.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_films_use_case.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_people_list_use_case.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_planets_use_case.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_species_use_case.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_starships_use_case.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_vehicles_use_case.dart';
import 'package:starwars/external/datasources/starwars_datasource.dart';
import 'package:starwars/infra/repositories/starwars_repository.dart';
import 'package:starwars/presentation/movie_characters/cubit/movie_characters_cubit.dart';
import 'package:starwars/presentation/movie_planets/cubit/movie_planets_cubit.dart';
import 'package:starwars/presentation/movie_species/cubit/movie_species_cubit.dart';
import 'package:starwars/presentation/movie_starships/cubit/movie_starships_cubit.dart';
import 'package:starwars/presentation/movie_vehicles/cubit/movie_vehicles_cubit.dart';
import 'package:starwars/presentation/movies/cubit/movies_page_cubit.dart';

final locator = GetIt.instance;

void registerDependencies() {
  locator.registerFactory<GetStarWarsFilmsUseCase>(
    () => GetStarWarsFilmsUseCaseImp(
      starWarsRepository: locator.get<StarWarsRepository>(),
    ),
  );

  locator.registerFactory<GetStarWarsPeopleUseCase>(
    () => GetStarWarsPeopleUseCaseImp(
      starWarsRepository: locator.get<StarWarsRepository>(),
    ),
  );

  locator.registerFactory<GetStarWarsPlanetsUseCase>(
    () => GetStarWarsPlanetsUseCaseImp(
      starWarsRepository: locator.get<StarWarsRepository>(),
    ),
  );

  locator.registerFactory<GetStarWarsStarshipsUseCase>(
    () => GetStarWarsStarshipsUseCaseImp(
      starWarsRepository: locator.get<StarWarsRepository>(),
    ),
  );

  locator.registerFactory<GetStarWarsVehiclesUseCase>(
    () => GetStarWarsVehiclesUseCaseImp(
      starWarsRepository: locator.get<StarWarsRepository>(),
    ),
  );

  locator.registerFactory<GetStarWarsSpeciesUseCase>(
    () => GetStarWarsSpeciesUseCaseImp(
      starWarsRepository: locator.get<StarWarsRepository>(),
    ),
  );

  locator.registerFactory<StarWarsDataSource>(
    () => StarWarsDataSourceImp(),
  );

  locator.registerFactory<StarWarsRepository>(
    () => StarWarsRepositoryImp(
        starWarsDataSource: locator.get<StarWarsDataSource>()),
  );

  locator.registerFactory<MoviesPageCubit>(
    () => MoviesPageCubit(
        getStarWarsFilmsUseCase: locator.get<GetStarWarsFilmsUseCase>()),
  );

  locator.registerFactory<MovieCharactersCubit>(
    () => MovieCharactersCubit(
        getStarWarsPeopleUseCase: locator.get<GetStarWarsPeopleUseCase>()),
  );

  locator.registerFactory<MoviePlanetsCubit>(
    () => MoviePlanetsCubit(
        getStarWarsPlanetsUseCase: locator.get<GetStarWarsPlanetsUseCase>()),
  );

  locator.registerFactory<MovieStarshipsCubit>(
    () => MovieStarshipsCubit(
        getStarWarsStarshipsUseCase:
            locator.get<GetStarWarsStarshipsUseCase>()),
  );

  locator.registerFactory<MovieVehiclesCubit>(
    () => MovieVehiclesCubit(
        getStarWarsVehiclesUseCase: locator.get<GetStarWarsVehiclesUseCase>()),
  );

  locator.registerFactory<MovieSpeciesCubit>(
    () => MovieSpeciesCubit(
        getStarWarsSpeciesUseCase: locator.get<GetStarWarsSpeciesUseCase>()),
  );
}
