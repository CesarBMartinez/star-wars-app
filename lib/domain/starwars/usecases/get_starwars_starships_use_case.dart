import 'package:starwars/domain/starwars/entities/starwars_starships.dart';
import 'package:starwars/domain/starwars/respositories/starwars_repository.dart';

abstract class GetStarWarsStarshipsUseCase {
  Future<StarWarsStarshipsList?> call({List<String>? urls});
}

class GetStarWarsStarshipsUseCaseImp implements GetStarWarsStarshipsUseCase {
  GetStarWarsStarshipsUseCaseImp({required this.starWarsRepository});

  final StarWarsRepository starWarsRepository;

  @override
  Future<StarWarsStarshipsList?> call({List<String>? urls}) async {
    final response = await starWarsRepository.getStarWarsStarships();
    final List<StarWarsStarship> results = urls != null
        ? response!.results
            .where((element) => urls.contains(element.url))
            .toList()
        : [];

    return StarWarsStarshipsList(
      count: results.length,
      next: response!.next,
      previous: response.previous,
      results: results,
    );
  }
}
