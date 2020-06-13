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
        body: Consumer<HomeModel>(
          builder: (context, model, child) => CustomScrollView(
            slivers: <Widget>[
              _sliverAppBar(model),
              _sliverList(model),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sliverAppBar(HomeModel model) {
    return SliverAppBar(
      expandedHeight: 90,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
          titlePadding: EdgeInsets.all(5),
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              FlatButton(
                color: Colors.white,
                child: const Text("Get Random Joke"),
                onPressed: () {
                  model.getRandomJoke();
                },
              ),
              Row(
                children: <Widget>[
                  Text("NSFW"),
                  Switch(
                    value: model.allowNSFW,
                    onChanged: (bool value) {
                      print(value);
                      model.allowNSFW = value;
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }

  Widget _sliverList(HomeModel model) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == 0 && model.jokes.length == 0) {
            return Text("No jokes yet. Press the 'Get Random Joke Button'");
          }

          if (index >= model.jokes.length) {
            return null;
          }
          return ListTile(
            title: Text(model.jokes[index].content),
          );
        },
        // Or, uncomment the following line:
        // childCount: 3,
      ),
    );
  }

  List _buildList(int count) {
    List<Widget> listItems = List();

    for (int i = 0; i < count; i++) {
      listItems.add(new Padding(padding: new EdgeInsets.all(20.0), child: new Text('Item ${i.toString()}', style: new TextStyle(fontSize: 25.0))));
    }

    return listItems;
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
