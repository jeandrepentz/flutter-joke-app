 import 'dart:convert';

import 'package:flutter_joke_app/core/models/joke.dart';
import 'package:flutter_joke_app/core/respositories/jokeRepository/i_joke_respository.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;



//@LazySingleton(as: IJokeRepository, env: Environment.dev)
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
    print("get random joke: nsfw - $nsfw");
    final response = await http.get("$endpoint?nsfw=$nsfw", headers: _headers);
    final parsed = json.decode(response.body);
    return Joke.fromJson(parsed);
  }

  @override
  Future<Joke> upvoteJoke(String id) async {
     final response = await http.get("$endpoint/$id/upvote", headers: _headers);
    final parsed = json.decode(response.body);
    return Joke.fromJson(parsed);
  }

    @override
  Future<Joke> downvoteJoke(String id) async {
     final response = await http.get("$endpoint/$id", headers: _headers);
    final parsed = json.decode(response.body);
    return Joke.fromJson(parsed);
  }


  static Map<String, String> _defaultHeaders(){
      final headers = new Map<String, String>();
      headers['X-RapidAPI-Key'] = apiKey;
      return headers;
  }
 }