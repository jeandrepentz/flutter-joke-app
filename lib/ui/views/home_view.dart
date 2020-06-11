import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/dependencies/dependencyConfigurator.dart';
import 'package:flutter_joke_app/core/models/joke.dart';
import 'package:flutter_joke_app/core/viewModels/home_model.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<HomeModel>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Test"),
        ),
        body: Consumer<HomeModel>(
          builder: (context, model, child) => Column(
            children: <Widget>[
              FlatButton(
                child: Text("Get Random Joke"),
                onPressed: () {
                  model.getRandomJoke();
                },
              ),
              Text(model.jokes.length.toString()),
              _jokeHistory(model.jokes)
            ],
          ),
        ),
      ),
    );
  }

  Widget _jokeHistory(List<Joke> jokes) {
    if (jokes == null || jokes.length == 0) {
      return Container();
    } else {
      return Expanded(
              child: ListView.builder(
          itemCount: jokes.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(jokes[index].content),
          ),
        ),
      );
    }
  }
}
