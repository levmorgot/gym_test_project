import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_test_project/common/widgets/empty_message_widget.dart';
import 'package:gym_test_project/common/widgets/error_message_widget.dart';
import 'package:gym_test_project/common/widgets/loading_indicator_widget.dart';
import 'package:gym_test_project/fitness_programs/domain/entities/fitness_program_entity.dart';
import 'package:gym_test_project/fitness_programs/presentation/bloc/fitness_programs_list_cubit/fitness_programs_list_cubit.dart';
import 'package:gym_test_project/fitness_programs/presentation/bloc/fitness_programs_list_cubit/fitness_programs_list_state.dart';
import 'package:gym_test_project/fitness_programs/presentation/widgets/fitness_programs_card_widget.dart';

class FitnessProgramsList extends StatelessWidget {
  const FitnessProgramsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FitnessProgramsListCubit, FitnessProgramState>(
        builder: (context, state) {
          List<FitnessProgramEntity> fitnessPrograms = [];
          if (state is FitnessProgramLoadingState) {
            return const LoadingIndicator();
          } else if (state is FitnessProgramErrorState) {
            return ErrorMessage(
              message: state.message,
            );
          } else if (state is FitnessProgramLoadedState) {
            fitnessPrograms = state.fitnessProgramsList;
          }
          if (fitnessPrograms.isNotEmpty) {
            return SizedBox(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8.0),
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 10,
                            bottom: 15,
                          ),
                          child: Text(
                            "Каталог фитнес-программ",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                        FitnessProgramCard(
                            fitnessProgram: fitnessPrograms[index]),
                      ],
                    );
                  }
                  return FitnessProgramCard(
                      fitnessProgram: fitnessPrograms[index]);
                },
                itemCount: fitnessPrograms.length,
              ),
            );
          } else {
            return const EmptyMessage(
              message: "Список транзакций пуст!",
            );
          }
        });
  }
}
