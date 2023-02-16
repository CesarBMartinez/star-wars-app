import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/starwars/entities/starwars_starships.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_starships_use_case.dart';

part 'movie_starships_state.dart';

class MovieStarshipsCubit extends Cubit<MovieStarshipsState> {
  MovieStarshipsCubit({required this.getStarWarsStarshipsUseCase})
      : super(MovieStarshipsInitial());

  final GetStarWarsStarshipsUseCase getStarWarsStarshipsUseCase;

  void getStarWarsStarships({List<String>? urls}) async {
    final result = await getStarWarsStarshipsUseCase(urls: urls);

    if (result != null && result.results.isNotEmpty) {
      emit(MovieStarshipsSuccess(starWarsStarshipsList: result));
    } else {
      emit(MovieStarshipsError());
    }
  }
}
