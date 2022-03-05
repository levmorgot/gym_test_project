import 'package:dartz/dartz.dart';
import 'package:gym_test_project/core/error/failure.dart';
import 'package:gym_test_project/core/usecases/usecase.dart';
import 'package:gym_test_project/features/fitness_programs/domain/entities/fitness_program_entity.dart';
import 'package:gym_test_project/features/fitness_programs/domain/repositories/fitness_program_repository.dart';

class GetAllFitnessPrograms extends UseCase<List<FitnessProgramEntity>, bool> {
  final IFitnessProgramRepository fitnessProgramRepository;

  GetAllFitnessPrograms(this.fitnessProgramRepository);

  @override
  Future<Either<Failure, List<FitnessProgramEntity>>> call(params) async {
    return await fitnessProgramRepository.getAllFitnessPrograms(params);
  }
}
