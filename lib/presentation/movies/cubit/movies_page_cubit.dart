import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/starwars/entities/starwars_films_list.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_films_use_case.dart';

part 'movies_page_state.dart';

class MoviesPageCubit extends Cubit<MoviesPageState> {
  MoviesPageCubit({required this.getStarWarsFilmsUseCase})
      : super(MoviesPageInitial());

  final GetStarWarsFilmsUseCase getStarWarsFilmsUseCase;

  void getStarWarsFilms() async {
    final result = await getStarWarsFilmsUseCase();

    if (result != null && result.results.isNotEmpty) {
      emit(MoviesPageSuccess(starWarsFilmsList: result));
    } else {
      emit(MoviesPageError());
    }
  }
}
