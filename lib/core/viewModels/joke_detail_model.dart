import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/enums/view_state_enum.dart';
import 'package:flutter_joke_app/core/models/joke.dart';
import 'package:flutter_joke_app/core/respositories/jokeRepository/i_joke_respository.dart';
import 'package:injectable/injectable.dart';

@injectable
class JokeDetailModel extends ChangeNotifier {
  final IJokeRepository _jokeRepository;
  ViewState _state = ViewState.idle;

  ViewState get state => _state;
  Joke joke;
  JokeDetailModel(this._jokeRepository);

  getJoke(String jokeId) async {
    _setState(ViewState.busy);
    joke = await this._jokeRepository.getById(jokeId);
    _setState(ViewState.idle);
  }

  void _setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
