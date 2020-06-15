import 'package:flutter/material.dart';
import 'package:flutter_joke_app/core/dependencies/dependencyConfigurator.dart';
import 'package:flutter_joke_app/core/viewModels/home_model.dart';
import 'package:flutter_joke_app/ui/widgets/joke_item_widget.dart';
import 'package:flutter_joke_app/ui/widgets/loader_button_widget.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<HomeModel>(),
      child: Scaffold(
        body: Consumer<HomeModel>(
          builder: (context, model, child) => CustomScrollView(
            slivers: <Widget>[
              _sliverAppBar(context, model),
              _sliverList(context, model),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sliverAppBar(BuildContext context, HomeModel model) {
    return SliverAppBar(
      expandedHeight: 90,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(5),
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              LoaderButtonWidget(
                color: Colors.white,
                child: const Text("Get a joke"),
                onPressed: () async {
                  await model.getRandomJoke();
                },
              ),
              Row(
                children: <Widget>[
                  const Text("NSFW"),
                  Switch(
                    value: model.allowNSFW,
                    onChanged: (bool value) {
                      model.allowNSFW = value;
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }

  Widget _sliverList(BuildContext context, HomeModel model) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == 0 && model.jokes.length == 0) {
            return Container(
              margin: EdgeInsets.only(top:10),
              child: Center(child: Text("No jokes yet. Press the 'Get a Joke' Button")));
          }
          if (index >= model.jokes.length) {
            return null;
          }
          return JokeItemWidget(joke: model.jokes[index], allowNSFW: model.allowNSFW,);
        },
        // Or, uncomment the following line:
        // childCount: 3,
      ),
    );
  }
}
