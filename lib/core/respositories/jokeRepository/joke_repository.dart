import 'dart:convert';
import 'dart:math';

import 'package:flutter_joke_app/core/models/joke.dart';
import 'package:flutter_joke_app/core/respositories/jokeRepository/i_joke_respository.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IJokeRepository)
class JokeRepository implements IJokeRepository {
  //TODO: Move to a configruation
  static const endpoint = "https://joke3.p.rapidapi.com/v1/joke";
  static const apiKey = "f9b61d73b9msh3217838ad61fb4bp199a63jsna2cdbe5ad428";
  final Map<String, String> _headers = _defaultHeaders();

  @override
  Future<Joke> getById(String id) async {
    final response = await http.get("$endpoint/$id", headers: _headers);
    final parsed = json.decode(response.body);
    return Joke.fromJson(parsed);
  }

  @override
  Future<Joke> getRandomJoke({bool nsfw = false}) async {
    final response = await http.get("$endpoint?nsfw=$nsfw", headers: _headers);
    final parsed = json.decode(response.body);
    Joke joke = Joke.fromJson(parsed);
    joke.nsfw = _nsfw(nsfw);
    return joke;
  }

  @override
  Future<Joke> upvoteJoke(String id) async {
    final response = await http.post("$endpoint/$id/upvote", headers: _headers);
    final parsed = json.decode(response.body);
    return Joke.fromJson(parsed);
  }

  @override
  Future<Joke> downvoteJoke(String id) async {
    final response = await http.post("$endpoint/$id/downvote", headers: _headers);
    final parsed = json.decode(response.body);
    return Joke.fromJson(parsed);
  }


  //This method to give some jokes the label of being NSFW. This is only for demo purposes
  //The API supports a query parameter to allow NSFW, but I have tested multiple times
  //and I'm unable to get a nsfw joke
  static bool _nsfw(bool allowNSFW){
    if(!allowNSFW){
      return false;
    }

    Random random = new Random();
    final seed = random.nextInt(100);
    return seed >= 50;
  }

  static Map<String, String> _defaultHeaders() {
    final headers = new Map<String, String>();
    headers['X-RapidAPI-Key'] = apiKey;
    return headers;
  }
}
