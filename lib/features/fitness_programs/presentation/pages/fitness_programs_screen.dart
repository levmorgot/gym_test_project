import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_test_project/common/styles/gradient.dart';
import 'package:gym_test_project/features/fitness_programs/presentation/bloc/fitness_programs_list_cubit/fitness_programs_list_cubit.dart';
import 'package:gym_test_project/features/fitness_programs/presentation/widgets/fitness_programs_list_widget.dart';
import 'package:gym_test_project/features/profile/presentation/pages/profile_detail_screen.dart';

class FitnessProgramsPage extends StatelessWidget {
  const FitnessProgramsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: appGradient
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ProfileDetailPage()));
            },
            icon: const Icon(
              Icons.account_circle_outlined,
              size: 30,
            ),
          ),
        ],
        title: const Text(
          'GymTeam',
          style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Container(
          decoration: appGradient,
          child: RefreshIndicator(
              onRefresh: () {
                return context
                    .read<FitnessProgramsListCubit>()
                    .loadFitnessPrograms(true);
              },
              child: const FitnessProgramsList())),
    );
  }
}
