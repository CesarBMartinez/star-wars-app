import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/starwars/entities/starwars_films_list.dart';
import 'package:starwars/locator.dart';
import 'package:starwars/presentation/movie_characters/cubit/movie_characters_cubit.dart';
import 'package:starwars/presentation/movie_details/movie_details_page.dart';
import 'package:starwars/presentation/movie_planets/cubit/movie_planets_cubit.dart';
import 'package:starwars/presentation/movie_species/cubit/movie_species_cubit.dart';
import 'package:starwars/presentation/movie_starships/cubit/movie_starships_cubit.dart';
import 'package:starwars/presentation/movie_vehicles/cubit/movie_vehicles_cubit.dart';
import 'package:starwars/presentation/movies/cubit/movies_page_cubit.dart';
import '/presentation/movies/movies_page.dart';

void main() {
  registerDependencies();
  runApp(const StarWarsApp());
}

class StarWarsApp extends StatelessWidget {
  const StarWarsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Star Wars Movies',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        "/": (context) => BlocProvider(
              create: (context) =>
                  locator.get<MoviesPageCubit>()..getStarWarsFilms(),
              child: const MoviesPage(),
            ),
        "/movie-details-page": (context) => MovieDetailsPage(
              movieCharactersCubit: locator.get<MovieCharactersCubit>(),
              moviePlanetsCubit: locator.get<MoviePlanetsCubit>(),
              movieStarshipsCubit: locator.get<MovieStarshipsCubit>(),
              movieVehiclesCubit: locator.get<MovieVehiclesCubit>(),
              movieSpeciesCubit: locator.get<MovieSpeciesCubit>(),
              starWarsFilm:
                  ModalRoute.of(context)!.settings.arguments as StarWarsFilm,
            ),
      },
    );
  }
}
