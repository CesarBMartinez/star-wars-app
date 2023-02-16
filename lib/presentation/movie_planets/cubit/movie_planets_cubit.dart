import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/starwars/entities/starwars_planets.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_planets_use_case.dart';

part 'movie_planets_state.dart';

class MoviePlanetsCubit extends Cubit<MoviePlanetsState> {
  MoviePlanetsCubit({required this.getStarWarsPlanetsUseCase})
      : super(MoviePlanetsInitial());

  final GetStarWarsPlanetsUseCase getStarWarsPlanetsUseCase;

  void getStarWarsPlanets({List<String>? urls}) async {
    final result = await getStarWarsPlanetsUseCase(urls: urls);

    if (result != null && result.results.isNotEmpty) {
      emit(MoviePlanetsSuccess(starWarsPlanetsList: result));
    } else {
      emit(MoviePlanetsError());
    }
  }
}
