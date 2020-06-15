import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/models/joke.dart';

class JokeItemWidget extends StatelessWidget {
  final Joke joke;
  final bool allowNSFW;
  const JokeItemWidget({Key key, @required this.joke, this.allowNSFW = false}) : super(key: key);

  static const double topPadding = 5;
  static const double bottomPadding = 20;
  static const double leftRightPadding = 10;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.only(left: leftRightPadding, right: leftRightPadding, top: topPadding, bottom: bottomPadding),
          child: _mainContent(),
        ),
      ),
      onTap: () => _onTap(context),
    );
  }

  Widget _mainContent() {
    return Column(
      children: <Widget>[
        Divider(
          color: joke.nsfw ? Colors.red : Colors.green,
          thickness: 3,
        ),
        _nsfwFilter(child: Text(joke.content ?? ""), useFilter: !allowJoke()),
      ],
    );
  }

  Widget _nsfwFilter({@required Widget child, @required bool useFilter}) {
    if (useFilter) {
      return Text(
        "Sensitive Content. You currently have NSFW jokes disabled",
        style: TextStyle(fontStyle: FontStyle.italic),
      );
    } else {
      return child;
    }
  }

  bool allowJoke() {
    return this.allowNSFW || !joke.nsfw;
  }

  void _onTap(BuildContext context) {
    if (allowJoke()) {
      Navigator.pushNamed(context, '/joke', arguments: joke.id);
    }
  }
}
