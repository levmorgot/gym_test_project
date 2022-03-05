import 'dart:convert';

import 'package:gym_test_project/core/error/exception.dart';
import 'package:gym_test_project/fitness_programs/data/models/fitness_program_model.dart';
import 'package:http/http.dart' as http;

abstract class IFitnessProgramRemoteDataSource {
  Future<List<FitnessProgramModel>> getFitnessPrograms();
}

class FitnessProgramRemoteDataSource
    implements IFitnessProgramRemoteDataSource {
  final http.Client client;

  FitnessProgramRemoteDataSource({required this.client});

  @override
  Future<List<FitnessProgramModel>> getFitnessPrograms() async {
    return await _getFitnessProgramsFromUrl(
        'https://run.mocky.io/v3/63e7a34b-be89-4f5a-a1af-6b2d665cd795');
  }

  Future<List<FitnessProgramModel>> _getFitnessProgramsFromUrl(
      String url) async {
    final response = await client
        .get(Uri.parse(url), headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200) {
      final filials = json.decode(response.body)['data'];
      return (filials as List)
          .map((filial) => FitnessProgramModel.fromJson(filial))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
