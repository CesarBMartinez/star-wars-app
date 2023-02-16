import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/starwars/entities/starwars_films_list.dart';
import 'package:starwars/presentation/loader/loader.dart';
import 'package:starwars/presentation/movie_card/movie_card.dart';
import 'package:starwars/presentation/movie_characters/cubit/movie_characters_cubit.dart';
import 'package:starwars/presentation/movie_planets/cubit/movie_planets_cubit.dart';
import 'package:starwars/presentation/movie_resources_table/movie_resources_table.dart';
import 'package:starwars/presentation/movie_species/cubit/movie_species_cubit.dart';
import 'package:starwars/presentation/movie_starships/cubit/movie_starships_cubit.dart';
import 'package:starwars/presentation/movie_vehicles/cubit/movie_vehicles_cubit.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    super.key,
    required this.starWarsFilm,
    required this.movieCharactersCubit,
    required this.moviePlanetsCubit,
    required this.movieStarshipsCubit,
    required this.movieVehiclesCubit,
    required this.movieSpeciesCubit,
  });

  final StarWarsFilm starWarsFilm;
  final MovieCharactersCubit movieCharactersCubit;
  final MoviePlanetsCubit moviePlanetsCubit;
  final MovieStarshipsCubit movieStarshipsCubit;
  final MovieVehiclesCubit movieVehiclesCubit;
  final MovieSpeciesCubit movieSpeciesCubit;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Star Wars Movies'),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: ImageIcon(
                AssetImage('assets/images/icon-darth-vader.png'),
                size: 32,
              ),
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.insert_drive_file_outlined),
                text: 'Info',
              ),
              Tab(
                icon: Icon(Icons.people),
                text: 'Characters',
              ),
              Tab(
                icon: Icon(Icons.public),
                text: 'Planets',
              ),
              Tab(
                icon: Icon(Icons.rocket_rounded),
                text: 'Starships',
              ),
              Tab(
                icon: Icon(Icons.directions_car),
                text: 'Vehicles',
              ),
              Tab(
                icon: Icon(Icons.pets),
                text: 'Species',
              ),
            ],
          ),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => movieCharactersCubit
                ..getStarWarsCharacters(urls: starWarsFilm.characters.cast()),
            ),
            BlocProvider(
              create: (context) => moviePlanetsCubit
                ..getStarWarsPlanets(urls: starWarsFilm.planets.cast()),
            ),
            BlocProvider(
              create: (context) => movieStarshipsCubit
                ..getStarWarsStarships(urls: starWarsFilm.starships.cast()),
            ),
            BlocProvider(
              create: (context) => movieVehiclesCubit
                ..getStarWarsVehicles(urls: starWarsFilm.vehicles.cast()),
            ),
            BlocProvider(
              create: (context) => movieSpeciesCubit
                ..getStarWarsSpecies(urls: starWarsFilm.species.cast()),
            ),
          ],
          child: TabBarView(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      MovieCard(
                        episodeId: starWarsFilm.episodeId,
                        title: starWarsFilm.title,
                        director: starWarsFilm.director,
                        producers: starWarsFilm.producer,
                        releaseDate: starWarsFilm.releaseDate,
                        actionButton: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CupertinoButton.filled(
                            onPressed: () {},
                            child: const Text('Opening Crawl'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<MovieCharactersCubit, MovieCharactersState>(
                builder: (context, state) {
                  if (state is MovieCharactersSuccess) {
                    final rows = state.starWarsPeopleList.results.map((e) {
                      return DataRow(
                        cells: [
                          DataCell(Text(e.name)),
                          DataCell(Text(e.gender)),
                          DataCell(Text(e.birthYear)),
                        ],
                      );
                    }).toList();

                    return MovieResourcesTable(
                      labels: const ['Name', 'Gender', 'Birthyear'],
                      rows: rows,
                    );
                  } else {
                    return const Center(
                      child: Loader(),
                    );
                  }
                },
              ),
              BlocBuilder<MoviePlanetsCubit, MoviePlanetsState>(
                builder: (context, state) {
                  if (state is MoviePlanetsSuccess) {
                    final rows = state.starWarsPlanetsList.results.map((e) {
                      return DataRow(
                        cells: [
                          DataCell(Text(e.name)),
                          DataCell(Text(e.population)),
                          DataCell(Text(e.climate)),
                        ],
                      );
                    }).toList();

                    return MovieResourcesTable(
                      labels: const ['Name', 'Population', 'Climate'],
                      rows: rows,
                    );
                  } else {
                    return const Center(
                      child: Loader(),
                    );
                  }
                },
              ),
              BlocBuilder<MovieStarshipsCubit, MovieStarshipsState>(
                builder: (context, state) {
                  if (state is MovieStarshipsSuccess) {
                    final rows = state.starWarsStarshipsList.results.map((e) {
                      return DataRow(
                        cells: [
                          DataCell(Text(e.name)),
                          DataCell(Text(e.passengers)),
                          DataCell(Text(e.crew)),
                        ],
                      );
                    }).toList();

                    return MovieResourcesTable(
                      labels: const ['Name', 'Passengers', 'Crew'],
                      rows: rows,
                    );
                  } else {
                    return const Center(
                      child: Loader(),
                    );
                  }
                },
              ),
              BlocBuilder<MovieVehiclesCubit, MovieVehiclesState>(
                builder: (context, state) {
                  if (state is MovieVehiclesSuccess) {
                    final rows = state.starWarsVehiclesList.results.map((e) {
                      return DataRow(
                        cells: [
                          DataCell(Text(e.name)),
                          DataCell(Text(e.model)),
                          DataCell(Text(e.passengers)),
                        ],
                      );
                    }).toList();

                    return MovieResourcesTable(
                      labels: const ['Name', 'Model', 'Passengers'],
                      rows: rows,
                    );
                  } else {
                    return const Center(
                      child: Loader(),
                    );
                  }
                },
              ),
              BlocBuilder<MovieSpeciesCubit, MovieSpeciesState>(
                builder: (context, state) {
                  if (state is MovieSpeciesSuccess) {
                    final rows = state.starWarsSpeciesList.results.map((e) {
                      return DataRow(
                        cells: [
                          DataCell(Text(e.name)),
                          DataCell(Text(e.skinColors)),
                          DataCell(Text(e.hairColors)),
                        ],
                      );
                    }).toList();

                    return MovieResourcesTable(
                      labels: const ['Name', 'Skin', 'Hair'],
                      rows: rows,
                    );
                  } else {
                    return const Center(
                      child: Loader(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
