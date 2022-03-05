import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_test_project/fitness_programs/presentation/bloc/fitness_programs_list_cubit/fitness_programs_list_cubit.dart';
import 'package:gym_test_project/fitness_programs/presentation/pages/fitness_programs_screen.dart';
import 'package:gym_test_project/locator_service.dart' as di;
import 'package:gym_test_project/locator_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<FitnessProgramsListCubit>(
              create: (context) =>
                  sl<FitnessProgramsListCubit>()..loadFitnessPrograms(false)),
        ],
        child: MaterialApp(
          theme: ThemeData.dark(),
          home: const FitnessProgramsPage(),
        ));
  }
}
