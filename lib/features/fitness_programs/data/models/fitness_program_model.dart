import 'package:gym_test_project/features/fitness_programs/domain/entities/fitness_program_entity.dart';

class FitnessProgramModel extends FitnessProgramEntity {
  const FitnessProgramModel({
    required title,
    required body,
    required imageUrl,
  }) : super(
          title: title,
          body: body,
          imageUrl: imageUrl,
        );

  factory FitnessProgramModel.fromJson(Map<String, dynamic> json) {
    return FitnessProgramModel(
      title: json['title'],
      body: json['body'],
      imageUrl: json['image_url'] ?? json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'imageUrl': imageUrl,
    };
  }
}
