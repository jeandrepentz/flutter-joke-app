import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/dependencies/dependencyConfigurator.dart';
import 'package:flutter_joke_app/core/enums/view_state_enum.dart';
import 'package:flutter_joke_app/core/viewModels/joke_detail_model.dart';
import 'package:flutter_joke_app/ui/widgets/rounded_container_widget.dart';
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
              return _initialLoading();
          } 
          else {
            if(model.joke == null){
              return _notFound();
            }

            return _mainContent(context, model);
          }
        }),
      ),
    );
  }

  Widget _mainContent(BuildContext context, JokeDetailModel model){
    return Container(
      margin: EdgeInsets.all(5),
      child: RoundedContainerWidget(
        backgroundColor: Colors.white,
        child: Text(model.joke.content ?? ""),
      ),
    );
  }

  Widget _initialLoading(){
      return  Center(child: CircularProgressIndicator());
  }

  Widget _notFound(){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Text("Sorry, the joke you are looking for can't be found :("),
      );
  }
}
