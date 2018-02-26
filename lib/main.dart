import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:built_redux/built_redux.dart';
import 'package:recipe/model/models.dart';
import 'package:recipe/reducers/reducers.dart';
import 'package:recipe/actions/actions.dart';
import 'package:recipe/middleware/store_recipies_middleware.dart';

final ThemeData kDefaultTheme = new ThemeData(
  primarySwatch: Colors.orange,
  accentColor: Colors.lightGreenAccent[400],
);

void main() => runApp(new RecipeApp());

class RecipeApp extends StatefulWidget {
  final store = new Store<AppState, AppStateBuilder, AppActions>(
    reducerBuiler.build(),
    new AppState.loading(),
    new AppActions(),
    middleware: [
      createStoreRecipiesMiddleware(),
    ],
  );

  @override
  RecipeAppState createState() => new RecipeAppState();
}

class RecipeAppState extends State<RecipeApp> {
  Store<AppState, AppStateBuilder, AppActions> store;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Recipe built value',
      home: new ReduxProvider(
        store: store,
        child: new SomeWidget(),
      ),
    );
  }

  @override
  void initState() {
    store = widget.store;
    store.actions.fetchRecipiesAction();
    super.initState();
  }
}

class SomeWidget extends StoreConnector<AppState, AppActions, AppState> {
  SomeWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, AppState state, AppActions actions) {
    Widget content;
    if (state.isLoading) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        padding: new EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int index) =>
            _buildTile(index, state),
        itemCount:
            state.result.results != null ? state.result.results.length : 0,
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Recipe'),
      ),
      body: content,
    );
  }

  @override
  AppState connect(AppState state) => state;

  Widget _buildTile(int index, AppState state) {
    Recipe recipe = state.result.results.elementAt(index);
    return new Card(
      child: new InkWell(
        onTap: () {},
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new SizedBox(
                    width: 48.0,
                    child: new ClipRRect(
                      borderRadius: new BorderRadius.circular(50.0),
                      child: new Image.network(recipe.thumbnail),
                    ),
                  ),
                  new Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: new Text(recipe.title),
                      ),
                    ],
                  ),
                ],
              ),
              new Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: _buildIngrediesnt(recipe.ingredients),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildIngrediesnt(String ingredients) {
    List<String> split = ingredients.split(',');
    split.removeWhere((string) => string == "");

    return split.map((i) => new Chip(label: new Text(i),)).toList();
  }
}
