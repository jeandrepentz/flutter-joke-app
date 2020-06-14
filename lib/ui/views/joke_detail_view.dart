import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/dependencies/dependencyConfigurator.dart';
import 'package:flutter_joke_app/core/enums/view_state_enum.dart';
import 'package:flutter_joke_app/core/viewModels/joke_detail_model.dart';
import 'package:provider/provider.dart';

class JokeDetailView extends StatelessWidget {
  final String jokeId;
  const JokeDetailView({Key key, @required this.jokeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Joke Detail"),
      ),
      body: ChangeNotifierProvider(
        create: (_) {
          final model = getIt<JokeDetailModel>();
          model.getJoke(jokeId);
          return model;
        },
        child: Consumer<JokeDetailModel>(builder: (context, model, child) {
          if (model.state == ViewState.busy) {
            return CircularProgressIndicator();
          } else {
            return Text(model.joke?.content ?? "");
          }
        }),
      ),
    );
  }
}
