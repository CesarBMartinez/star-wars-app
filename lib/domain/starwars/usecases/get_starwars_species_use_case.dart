import 'package:starwars/domain/starwars/entities/starwars_species.dart';
import 'package:starwars/domain/starwars/respositories/starwars_repository.dart';

abstract class GetStarWarsSpeciesUseCase {
  Future<StarWarsSpeciesList?> call({List<String>? urls});
}

class GetStarWarsSpeciesUseCaseImp implements GetStarWarsSpeciesUseCase {
  GetStarWarsSpeciesUseCaseImp({required this.starWarsRepository});

  final StarWarsRepository starWarsRepository;

  @override
  Future<StarWarsSpeciesList?> call({List<String>? urls}) async {
    final response = await starWarsRepository.getStarWarsSpecies();
    final List<StarWarsSpecie> results = urls != null
        ? response!.results
            .where((element) => urls.contains(element.url))
            .toList()
        : [];

    return StarWarsSpeciesList(
      count: results.length,
      next: response!.next,
      previous: response.previous,
      results: results,
    );
  }
}
