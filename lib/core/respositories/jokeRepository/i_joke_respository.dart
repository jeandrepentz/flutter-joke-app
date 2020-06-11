import 'package:flutter_joke_app/core/models/joke.dart';
import 'package:injectable/injectable.dart';

abstract class IJokeRepository {
  Future<Joke> getById(String id);
  Future<Joke> getRandomJoke({bool nsfw = false});
  Future<Joke> upvoteJoke(String id);
  Future<Joke> downvoteJoke(String id);
}