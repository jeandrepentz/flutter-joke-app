import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/models/joke.dart';
import 'package:flutter_joke_app/core/respositories/jokeRepository/i_joke_respository.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeModel extends ChangeNotifier {
  final IJokeRepository _jokeRepository;
  List<Joke> _jokes = [];

  UnmodifiableListView<Joke> get jokes => UnmodifiableListView(_jokes);
  HomeModel(this._jokeRepository);

  Future getRandomJoke() async {
    print("getting joke");
    final joke = await _jokeRepository.getRandomJoke();
    print("got joke");
    print(joke.content);
    _jokes.add(joke);
    notifyListeners();
  }
}
