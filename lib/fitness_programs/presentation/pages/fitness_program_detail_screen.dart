import 'package:flutter/material.dart';
import 'package:gym_test_project/common/styles/gradient.dart';
import 'package:gym_test_project/fitness_programs/domain/entities/fitness_program_entity.dart';
import 'package:gym_test_project/fitness_programs/presentation/widgets/fitness_program_info_widget.dart';

class FitnessProgramDetailPage extends StatelessWidget {
  final FitnessProgramEntity fitnessProgram;

  const FitnessProgramDetailPage({Key? key, required this.fitnessProgram})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
            decoration: appGradient
        ),
        title: Text(fitnessProgram.title),
        centerTitle: true,
      ),
      body: Container(
        decoration: appGradient,
        child: Center(
            child: FitnessProgramInfo(fitnessProgram: fitnessProgram),
        ),
      ),
    );
  }
}
