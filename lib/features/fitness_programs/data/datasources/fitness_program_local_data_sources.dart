import 'dart:convert';

import 'package:gym_test_project/core/error/exception.dart';
import 'package:gym_test_project/features/fitness_programs/data/models/fitness_program_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class IFitnessProgramLocalDataSource {
  Future<List<FitnessProgramModel>> getFitnessProgramsFromCache();

  Future<void> addFitnessProgramsToCache(List<FitnessProgramModel> fitnessPrograms);

  Future<String> getLastEdit();

  Future<void> lastEditToCache(String lastEdit);
}

const cacheFitnessProgramsList = 'CACHE_FITNESS_PROGRAM_LIST';

const cacheFitnessProgramsLastEdit = 'CACHE_FITNESS_PROGRAM_LAST_EDIT';

class FitnessProgramLocalDataSource implements IFitnessProgramLocalDataSource {
  final SharedPreferences sharedPreferences;

  FitnessProgramLocalDataSource({required this.sharedPreferences});

  @override
  Future<void> addFitnessProgramsToCache(List<FitnessProgramModel> fitnessPrograms) async {
    final List<String> jsonFitnessProgramList = fitnessPrograms
        .map((transaction) => json.encode(transaction.toJson()))
        .toList();
    sharedPreferences.setStringList(
        cacheFitnessProgramsList, jsonFitnessProgramList);
    return Future.value();
  }

  @override
  Future<List<FitnessProgramModel>> getFitnessProgramsFromCache() async {
    final jsonFitnessProgramList = sharedPreferences.getStringList(cacheFitnessProgramsList);
    if (jsonFitnessProgramList != null && jsonFitnessProgramList.isNotEmpty) {
      try {
        return Future.value(jsonFitnessProgramList
            .map((fitnessProgram) =>
            FitnessProgramModel.fromJson(json.decode(fitnessProgram)))
            .toList());
      } catch (e) {
        throw CacheException();
      }
    } else {
      return Future.value([]);
    }
  }

  @override
  Future<String> getLastEdit() {
    final jsonDoctorLastEdit = sharedPreferences.getString(cacheFitnessProgramsLastEdit);
    if (jsonDoctorLastEdit != null && jsonDoctorLastEdit.isNotEmpty) {
      try {
        return Future.value(jsonDoctorLastEdit);
      } catch (e) {
        throw CacheException();
      }
    } else {
      return Future.value("");
    }
  }

  @override
  Future<void> lastEditToCache(String lastEdit) {
    sharedPreferences.setString(cacheFitnessProgramsLastEdit, lastEdit);
    return Future.value();
  }
}
