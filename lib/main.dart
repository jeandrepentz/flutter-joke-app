import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/dependencies/dependencyConfigurator.dart';
import 'package:flutter_joke_app/route_generator.dart';
import 'package:injectable/injectable.dart';


void main() {
  configureDependencies(Environment.dev);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Joke Demo App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.grey.shade200,
        accentColor: Colors.amberAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}