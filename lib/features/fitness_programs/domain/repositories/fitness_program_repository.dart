import 'package:dartz/dartz.dart';
import 'package:gym_test_project/core/error/failure.dart';
import 'package:gym_test_project/features/fitness_programs/domain/entities/fitness_program_entity.dart';

abstract class IFitnessProgramRepository {
  Future<Either<Failure, List<FitnessProgramEntity>>> getAllFitnessPrograms(bool forceRefresh);


}
