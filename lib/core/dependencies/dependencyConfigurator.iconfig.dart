// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_joke_app/core/respositories/jokeRepository/joke_repository.dart';
import 'package:flutter_joke_app/core/respositories/jokeRepository/i_joke_respository.dart';
import 'package:flutter_joke_app/core/viewModels/home_model.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<IJokeRepository>(() => JokeRepository());
  g.registerFactory<HomeModel>(() => HomeModel(g<IJokeRepository>()));
}
