import 'package:flutter/material.dart';
import 'package:gym_test_project/common/styles/app_colors.dart';
import 'package:gym_test_project/fitness_programs/domain/entities/fitness_program_entity.dart';
import 'package:gym_test_project/fitness_programs/presentation/pages/fitness_program_detail_screen.dart';
import 'package:gym_test_project/fitness_programs/presentation/widgets/fitness_program_cache_image_widget.dart';

class FitnessProgramCard extends StatelessWidget {
  final FitnessProgramEntity fitnessProgram;

  const FitnessProgramCard({Key? key, required this.fitnessProgram})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    FitnessProgramDetailPage(fitnessProgram: fitnessProgram)));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fitnessProgram.title,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FitnessProgramCacheImage(url: fitnessProgram.imageUrl),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Text(
                    fitnessProgram.body,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 15, color: AppColors.programBodyText),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
