import 'package:get_it/get_it.dart';
import 'package:gym_test_project/fitness_programs/data/datasources/fitness_program_local_data_sources.dart';
import 'package:gym_test_project/fitness_programs/data/datasources/fitness_program_remote_data_sources.dart';
import 'package:gym_test_project/fitness_programs/data/repositories/fitness_program_repository.dart';
import 'package:gym_test_project/fitness_programs/domain/repositories/fitness_program_repository.dart';
import 'package:gym_test_project/fitness_programs/domain/usecases/get_all_fitness_programs.dart';
import 'package:gym_test_project/fitness_programs/presentation/bloc/fitness_programs_list_cubit/fitness_programs_list_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BloC / Cubit
  sl.registerFactory(
    () => FitnessProgramsListCubit(getAllFitnessPrograms: sl()),
  );

  // UseCases
  sl.registerLazySingleton(() => GetAllFitnessPrograms(sl()));

  // Repository fitness program
  sl.registerLazySingleton<IFitnessProgramRepository>(
    () => FitnessProgramRepository(
      remoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<IFitnessProgramRemoteDataSource>(
    () => FitnessProgramRemoteDataSource(
      client: http.Client(),
    ),
  );

  sl.registerLazySingleton<IFitnessProgramLocalDataSource>(
    () => FitnessProgramLocalDataSource(sharedPreferences: sl()),
  );

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
