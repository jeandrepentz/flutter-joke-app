import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Invalid Route"),
        ),
      body: Center(
        child: const Text("Sorry, we can't find the page you are looking for :("),
        )
    );
  }
}