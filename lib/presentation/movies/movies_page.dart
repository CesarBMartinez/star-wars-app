import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/presentation/loader/loader.dart';
import 'package:starwars/presentation/movie_card/movie_card.dart';
import 'package:starwars/presentation/movies/cubit/movies_page_cubit.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: BlocBuilder<MoviesPageCubit, MoviesPageState>(
        builder: (context, state) {
          if (state is MoviesPageSuccess) {
            var movies = state.starWarsFilmsList.results;
            var movieCards = movies
                .map((movie) => MovieCard(
                      episodeId: movie.episodeId,
                      title: movie.title,
                      director: movie.director,
                      producers: movie.producer,
                      releaseDate: movie.releaseDate,
                      actionButton: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          '/movie-details-page',
                          arguments: movie,
                        ),
                        child: const Text('See Details'),
                      ),
                    ))
                .toList();

            return Container(
              padding: const EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Column(
                  children: movieCards,
                ),
              ),
            );
          } else {
            return const Center(
              child: Loader(),
            );
          }
        },
      ),
    );
  }
}
