import 'package:starwars/domain/starwars/entities/starwars_planets.dart';
import 'package:starwars/domain/starwars/respositories/starwars_repository.dart';

abstract class GetStarWarsPlanetsUseCase {
  Future<StarWarsPlanetsList?> call({List<String>? urls});
}

class GetStarWarsPlanetsUseCaseImp implements GetStarWarsPlanetsUseCase {
  GetStarWarsPlanetsUseCaseImp({required this.starWarsRepository});

  final StarWarsRepository starWarsRepository;

  @override
  Future<StarWarsPlanetsList?> call({List<String>? urls}) async {
    final response = await starWarsRepository.getStarWarsPlanets();
    final List<StarWarsPlanet> results = urls != null
        ? response!.results
            .where((element) => urls.contains(element.url))
            .toList()
        : [];

    return StarWarsPlanetsList(
      count: results.length,
      next: response!.next,
      previous: response.previous,
      results: results,
    );
  }
}
