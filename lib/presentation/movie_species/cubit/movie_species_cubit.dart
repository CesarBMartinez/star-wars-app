import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/starwars/entities/starwars_species.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_species_use_case.dart';

part 'movie_species_state.dart';

class MovieSpeciesCubit extends Cubit<MovieSpeciesState> {
  MovieSpeciesCubit({required this.getStarWarsSpeciesUseCase})
      : super(MovieSpeciesInitial());

  final GetStarWarsSpeciesUseCase getStarWarsSpeciesUseCase;

  void getStarWarsSpecies({List<String>? urls}) async {
    final result = await getStarWarsSpeciesUseCase(urls: urls);

    if (result != null && result.results.isNotEmpty) {
      emit(MovieSpeciesSuccess(starWarsSpeciesList: result));
    } else {
      emit(MovieSpeciesError());
    }
  }
}
