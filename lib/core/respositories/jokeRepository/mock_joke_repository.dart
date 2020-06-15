
import 'package:flutter_joke_app/core/models/joke.dart';
import 'package:flutter_joke_app/core/respositories/jokeRepository/i_joke_respository.dart';
import 'package:injectable/injectable.dart';

//This is a mock of the joke repository for testing

@LazySingleton(as: IJokeRepository, env: Environment.test)
class MockJokeRepository implements IJokeRepository {
  @override
  Future<Joke> downvoteJoke(String id) {
    // TODO: implement downvoteJoke
    throw UnimplementedError();
  }

  @override
  Future<Joke> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }

  @override
  Future<Joke> getRandomJoke({bool nsfw = false}) async {
      return Joke(
        id: "1",
        content: "Someone stole my mood ring. I don't know how I feel about it.",
        downvotes: 2,
        upvotes:  100,
        nsfw: false
      );
  }

  @override
  Future<Joke> upvoteJoke(String id) {
    // TODO: implement upvoteJoke
    throw UnimplementedError();
  }
  

}