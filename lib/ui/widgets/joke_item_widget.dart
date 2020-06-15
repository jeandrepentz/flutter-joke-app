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
    return _nsfwBlurFilter(
        useFilter: !this.allowNSFW && joke.nsfw,
        child: Column(
          children: <Widget>[
            Divider(
              color: joke.nsfw ? Colors.red : Colors.green,
              thickness: 3,
            ),
            Text(joke.content ?? ""),
          ],
        ));
  }

  Widget _nsfwBlurFilter({@required Widget child, @required bool useFilter}) {
    if (useFilter) {
      return BackdropFilter(filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), child: child);
    } else {
      return child;
    }
  }

  void _onTap(BuildContext context) {
    Navigator.pushNamed(context, '/joke', arguments: joke.id);
  }
}
