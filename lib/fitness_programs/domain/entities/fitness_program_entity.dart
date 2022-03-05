import 'package:equatable/equatable.dart';

class FitnessProgramEntity extends Equatable {
  final String title;
  final String body;
  final String imageUrl;

  const FitnessProgramEntity({
    required this.title,
    required this.body,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [title, body, imageUrl];
}
