import 'package:starwars/domain/starwars/entities/starwars_people.dart';
import 'package:starwars/domain/starwars/respositories/starwars_repository.dart';

abstract class GetStarWarsPeopleUseCase {
  Future<StarWarsPeopleList?> call({List<String>? urls});
}

class GetStarWarsPeopleUseCaseImp implements GetStarWarsPeopleUseCase {
  GetStarWarsPeopleUseCaseImp({required this.starWarsRepository});

  final StarWarsRepository starWarsRepository;

  @override
  Future<StarWarsPeopleList?> call({List<String>? urls}) async {
    final response = await starWarsRepository.getStarWarsPeople();
    final List<StarWarsPeople> results = urls != null
        ? response!.results
            .where((element) => urls.contains(element.url))
            .toList()
        : [];

    return StarWarsPeopleList(
      count: results.length,
      next: response!.next,
      previous: response.previous,
      results: results,
    );
  }
}
