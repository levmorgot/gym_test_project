import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_test_project/core/error/failure.dart';
import 'package:gym_test_project/features/fitness_programs/domain/usecases/get_all_fitness_programs.dart';
import 'package:gym_test_project/features/fitness_programs/presentation/bloc/fitness_programs_list_cubit/fitness_programs_list_state.dart';

class FitnessProgramsListCubit extends Cubit<FitnessProgramState> {
  final GetAllFitnessPrograms getAllFitnessPrograms;

  FitnessProgramsListCubit({
    required this.getAllFitnessPrograms,
  }) : super(FitnessProgramEmptyState());


  Future<void> loadFitnessPrograms(bool forceRefresh) async {
    if (state is FitnessProgramLoadingState) return;

    emit(FitnessProgramLoadingState());
    final failureOrFitnessPrograms = await getAllFitnessPrograms(forceRefresh);

    emit(failureOrFitnessPrograms.fold(
        (failure) =>
            FitnessProgramErrorState(message: _mapFailureMessage(failure)),
        (fitnessPrograms) {
      return FitnessProgramLoadedState(fitnessPrograms);
    }));
    return Future.value();
  }

  String _mapFailureMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server failure';
      case CacheFailure:
        return 'Cache failure';
      default:
        return 'Unexpected Error';
    }
  }
}
