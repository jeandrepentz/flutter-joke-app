import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/models/joke.dart';
import 'package:flutter_joke_app/core/respositories/jokeRepository/i_joke_respository.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeModel extends ChangeNotifier {
  final IJokeRepository _jokeRepository;
  List<Joke> _jokes = [];
  bool _allowNSFW = false;

  bool get allowNSFW => _allowNSFW;
  set allowNSFW(bool value){
    _allowNSFW = value;
    notifyListeners();
  }

  UnmodifiableListView<Joke> get jokes => UnmodifiableListView(_jokes);
  HomeModel(this._jokeRepository);

  Future getRandomJoke() async {
    final joke = await _jokeRepository.getRandomJoke(nsfw: _allowNSFW);
    _jokes.insert(0, joke); //used instead of add so the newest joke is always at the top 
    notifyListeners();
  }
}
