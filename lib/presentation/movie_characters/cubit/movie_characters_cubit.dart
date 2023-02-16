import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/starwars/entities/starwars_people.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_people_list_use_case.dart';

part 'movie_characters_state.dart';

class MovieCharactersCubit extends Cubit<MovieCharactersState> {
  MovieCharactersCubit({required this.getStarWarsPeopleUseCase})
      : super(MovieCharactersInitial());

  final GetStarWarsPeopleUseCase getStarWarsPeopleUseCase;

  void getStarWarsCharacters({List<String>? urls}) async {
    final result = await getStarWarsPeopleUseCase(urls: urls);

    if (result != null && result.results.isNotEmpty) {
      emit(MovieCharactersSuccess(starWarsPeopleList: result));
    } else {
      emit(MovieCharactersError());
    }
  }
}
