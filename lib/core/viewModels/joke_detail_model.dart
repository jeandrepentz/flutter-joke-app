import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/enums/view_state_enum.dart';
import 'package:flutter_joke_app/core/models/joke.dart';
import 'package:flutter_joke_app/core/respositories/jokeRepository/i_joke_respository.dart';
import 'package:injectable/injectable.dart';

@injectable
class JokeDetailModel extends ChangeNotifier {
  final IJokeRepository _jokeRepository;
  ViewState _state = ViewState.idle;
  bool _upvoted = false;
  bool _downvoted = false;

  bool get upvoted => _upvoted;
  bool get downvoted => _downvoted;

  ViewState get state => _state;
  Joke joke;
  JokeDetailModel(this._jokeRepository);

  getJoke(String jokeId) async {
    _setState(ViewState.busy);
    joke = await this._jokeRepository.getById(jokeId);
    _setState(ViewState.idle);
  }

  void upvote() {
    bool previousUpvotedState = _upvoted;
    _reversePreviousDownvoteOrUpvote();

    //upvote got reversed, just update UI, dont run rest of the function
    if(previousUpvotedState){
      notifyListeners();
      return;
    }

    //increasing the upvote manually as the UI doesn't have to wait for the API call to finish
    _upvoted = true;
    joke.upvotes++;
    //TODO: if the API call does fail, reverse the upvote and show an error message to the user
    _jokeRepository.upvoteJoke(joke.id);
    notifyListeners();
  }

  void downvote() {
     bool previousDownvotedState = _downvoted;
     _reversePreviousDownvoteOrUpvote();
    //upvote got reversed, just update UI, dont run rest of the function
    if(previousDownvotedState){
      notifyListeners();
      return;
    }
    //increasing the downvote manually as the UI doesn't have to wait for the API call to finish
    _downvoted = true;
    joke.downvotes++;

    //TODO: if the API call does fail, reverse the downvote and show an error message to the user
    _jokeRepository.downvoteJoke(joke.id); 
    notifyListeners();
  }


  //this method reverses any previous upvotes.
  //If the user upvoted the jokes and then downvotes, the upvote needs to be reversed, and vice versa
  //if the user upvoted the joke, but then taps on the upvote again, it should reverse the upvote. Same for the downvote
  //the API unfortunately doesn't support reversing a downvote or upvote, so just manually decreasing the amount for demo purposes
  //This does mean that if the joke gets loaded again, it won't show correctly
  _reversePreviousDownvoteOrUpvote(){
    if (_upvoted) {
      joke.upvotes--;
      _upvoted = false;
      notifyListeners();
      return;
    }

    if (_downvoted) {
      _downvoted = false;
      joke.downvotes--;
      notifyListeners();
    }
  }

  void _setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
