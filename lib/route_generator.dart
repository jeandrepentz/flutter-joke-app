import 'package:flutter/material.dart';
import 'package:flutter_joke_app/ui/views/views.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch(settings.name){
      case "/":
        return MaterialPageRoute(builder: (_) => HomeView());
      case "/joke":
        if(args is String){
          return MaterialPageRoute(builder: (_) => JokeDetailView(jokeId: args));
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) => ErrorView());
  }
} 