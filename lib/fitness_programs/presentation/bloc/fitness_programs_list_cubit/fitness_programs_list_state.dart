import 'package:equatable/equatable.dart';
import 'package:gym_test_project/fitness_programs/domain/entities/fitness_program_entity.dart';

abstract class FitnessProgramState extends Equatable {
  const FitnessProgramState();

  @override
  List<Object> get props => [];
}

class FitnessProgramEmptyState extends FitnessProgramState {
  @override
  List<Object> get props => [];
}

class FitnessProgramLoadingState extends FitnessProgramState {
  @override
  List<Object> get props => [];
}

class FitnessProgramLoadedState extends FitnessProgramState {
  final List<FitnessProgramEntity> fitnessProgramsList;

  const FitnessProgramLoadedState(this.fitnessProgramsList);

  @override
  List<Object> get props => [fitnessProgramsList];
}

class FitnessProgramErrorState extends FitnessProgramState {
  final String message;

  const FitnessProgramErrorState({required this.message});

  @override
  List<Object> get props => [message];
}
