import 'package:starwars/domain/starwars/entities/starwars_films_list.dart';
import 'package:starwars/domain/starwars/respositories/starwars_repository.dart';

abstract class GetStarWarsFilmsUseCase {
  Future<StarWarsFilmsList?> call();
}

class GetStarWarsFilmsUseCaseImp implements GetStarWarsFilmsUseCase {
  GetStarWarsFilmsUseCaseImp({required this.starWarsRepository});

  final StarWarsRepository starWarsRepository;

  @override
  Future<StarWarsFilmsList?> call() async {
    final result = await starWarsRepository.getStarWarsFilms();

    return StarWarsFilmsList(
      count: result!.count,
      next: result.next,
      previous: result.previous,
      results: result.results,
    );
  }
}
