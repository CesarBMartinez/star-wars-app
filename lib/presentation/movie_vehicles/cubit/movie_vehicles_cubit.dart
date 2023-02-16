import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starwars/domain/starwars/entities/starwars_vehicles.dart';
import 'package:starwars/domain/starwars/usecases/get_starwars_vehicles_use_case.dart';

part 'movie_vehicles_state.dart';

class MovieVehiclesCubit extends Cubit<MovieVehiclesState> {
  MovieVehiclesCubit({required this.getStarWarsVehiclesUseCase})
      : super(MovieVehiclesInitial());

  final GetStarWarsVehiclesUseCase getStarWarsVehiclesUseCase;

  void getStarWarsVehicles({List<String>? urls}) async {
    final result = await getStarWarsVehiclesUseCase(urls: urls);

    if (result != null && result.results.isNotEmpty) {
      emit(MovieVehiclesSuccess(starWarsVehiclesList: result));
    } else {
      emit(MovieVehiclesError());
    }
  }
}
