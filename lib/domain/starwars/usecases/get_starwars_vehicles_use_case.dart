import 'package:starwars/domain/starwars/entities/starwars_vehicles.dart';
import 'package:starwars/domain/starwars/respositories/starwars_repository.dart';

abstract class GetStarWarsVehiclesUseCase {
  Future<StarWarsVehiclesList?> call({List<String>? urls});
}

class GetStarWarsVehiclesUseCaseImp implements GetStarWarsVehiclesUseCase {
  GetStarWarsVehiclesUseCaseImp({required this.starWarsRepository});

  final StarWarsRepository starWarsRepository;

  @override
  Future<StarWarsVehiclesList?> call({List<String>? urls}) async {
    final response = await starWarsRepository.getStarWarsVehicles();
    final List<StarWarsVehicle> results = urls != null
        ? response!.results
            .where((element) => urls.contains(element.url))
            .toList()
        : [];

    return StarWarsVehiclesList(
      count: results.length,
      next: response!.next,
      previous: response.previous,
      results: results,
    );
  }
}
