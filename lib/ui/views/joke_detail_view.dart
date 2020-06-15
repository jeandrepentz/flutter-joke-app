import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/dependencies/dependencyConfigurator.dart';
import 'package:flutter_joke_app/core/enums/view_state_enum.dart';
import 'package:flutter_joke_app/core/viewModels/joke_detail_model.dart';
import 'package:flutter_joke_app/ui/widgets/icon_button_with_label_widget.dart';
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
          } else {
            if (model.joke == null) {
              return _notFound();
            }

            return _mainContent(context, model);
          }
        }),
      ),
    );
  }

  Widget _mainContent(BuildContext context, JokeDetailModel model) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          RoundedContainerWidget(
            backgroundColor: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("Not Safe For Work? ", ),
                    Text(model.joke.nsfw ? "Yes": "No", style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(thickness: 1),
                ),
                Text(model.joke.content ?? ""),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Divider(thickness: 1),
                ),
                _jokeActionButtons(context, model)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _jokeActionButtons(BuildContext context, JokeDetailModel model){
    final defaultColor = Colors.grey.shade600;
    final actionedColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
          IconButtonWithLabelWidget(
            iconData: Icons.thumb_up,
            label: model.joke.upvotes.toString(),
            iconColor: model.upvoted ? actionedColor : defaultColor,
            labelColor: defaultColor,
            onPressed: () {
              model.upvote();
            },
          ),
            IconButtonWithLabelWidget(
            iconData: Icons.thumb_down,
            label: model.joke.downvotes.toString(),
            iconColor: model.downvoted ? actionedColor : defaultColor,
            labelColor: defaultColor,
            onPressed: () {
              model.downvote();
            },
          ),
           IconButtonWithLabelWidget(
            iconData: Icons.share,
            label: "Share",
            iconColor: defaultColor,
            labelColor: defaultColor,
            onPressed: () {
                Scaffold.of(context).showSnackBar(SnackBar(content: Text("To be implemented")));

            },
          ),
    ],);
  }

  Widget _initialLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _notFound() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Text("Sorry, the joke you are looking for can't be found :("),
    );
  }
}
