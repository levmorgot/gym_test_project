import 'package:dartz/dartz.dart';
import 'package:gym_test_project/core/error/exception.dart';
import 'package:gym_test_project/core/error/failure.dart';
import 'package:gym_test_project/features/fitness_programs/data/datasources/fitness_program_local_data_sources.dart';
import 'package:gym_test_project/features/fitness_programs/data/datasources/fitness_program_remote_data_sources.dart';
import 'package:gym_test_project/features/fitness_programs/data/models/fitness_program_model.dart';
import 'package:gym_test_project/features/fitness_programs/domain/entities/fitness_program_entity.dart';
import 'package:gym_test_project/features/fitness_programs/domain/repositories/fitness_program_repository.dart';

class FitnessProgramRepository implements IFitnessProgramRepository {
  final IFitnessProgramRemoteDataSource remoteDataSource;
  final IFitnessProgramLocalDataSource localDataSource;

  FitnessProgramRepository(
      {required this.remoteDataSource, required this.localDataSource});

  @override
  Future<Either<Failure, List<FitnessProgramEntity>>> getAllFitnessPrograms(
      bool forceRefresh) async {
    if (forceRefresh) {
      final allFitnessPrograms = await _refreshFitnessPrograms();
      return allFitnessPrograms.fold((failure) => Left(failure),
              (fitnessPrograms) => Right(fitnessPrograms));
    } else {
      final allFitnessPrograms = await _getFitnessPrograms();
      return allFitnessPrograms.fold((failure) => Left(failure),
              (fitnessPrograms) => Right(fitnessPrograms));
    }

  }

  Future<Either<Failure, List<FitnessProgramModel>>>
      _refreshFitnessPrograms() async {
    try {
      var remoteFitnessPrograms = await remoteDataSource.getFitnessPrograms();
      localDataSource
          .lastEditToCache(DateTime.now().toString().substring(0, 10));
      await localDataSource.addFitnessProgramsToCache(remoteFitnessPrograms);
      return Right(remoteFitnessPrograms);
    } on CacheException {
      return Left(CacheFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, String>> _getLastEdit() async {
    try {
      final lastEdit = await localDataSource.getLastEdit();
      return Right(lastEdit);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  Future<Either<Failure, List<FitnessProgramModel>>>
      _getFitnessPrograms() async {
    final lastEdit = await _getLastEdit();
    return lastEdit.fold((failure) => Left(failure), (date) async {
      if (date != DateTime.now().toString().substring(0, 10)) {
        final fitnessProgramsOrFailure = await _refreshFitnessPrograms();
        return fitnessProgramsOrFailure.fold((failure) => Left(failure),
            (fitnessPrograms) => Right(fitnessPrograms));
      } else {
        try {
          final localFitnessPrograms =
              await localDataSource.getFitnessProgramsFromCache();
          return Right(localFitnessPrograms);
        } on CacheException {
          return Left(CacheFailure());
        }
      }
    });
  }
}
