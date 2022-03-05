import 'package:flutter/material.dart';
import 'package:gym_test_project/features/fitness_programs/domain/entities/fitness_program_entity.dart';

class FitnessProgramInfo extends StatelessWidget {
  final FitnessProgramEntity fitnessProgram;

  const FitnessProgramInfo({Key? key, required this.fitnessProgram})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Привет, мир!");
  }
}
