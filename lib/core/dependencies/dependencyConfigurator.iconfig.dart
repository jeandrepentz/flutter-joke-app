// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_joke_app/core/respositories/jokeRepository/joke_repository.dart';
import 'package:flutter_joke_app/core/respositories/jokeRepository/i_joke_respository.dart';
import 'package:flutter_joke_app/core/respositories/jokeRepository/mock_joke_repository.dart';
import 'package:flutter_joke_app/core/viewModels/joke_detail_model.dart';
import 'package:flutter_joke_app/core/viewModels/home_model.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<JokeDetailModel>(
      () => JokeDetailModel(g<IJokeRepository>()));
  g.registerFactory<HomeModel>(() => HomeModel(g<IJokeRepository>()));

  //Register dev Dependencies --------
  if (environment == 'dev') {
    g.registerLazySingleton<IJokeRepository>(() => JokeRepository());
  }

  //Register test Dependencies --------
  if (environment == 'test') {
    g.registerLazySingleton<IJokeRepository>(() => MockJokeRepository());
  }
}
