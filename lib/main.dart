import 'package:built_redux/built_redux.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:recipe/actions/actions.dart';
import 'package:recipe/config/application.dart';
import 'package:recipe/config/routes.dart';
import 'package:recipe/middleware/store_recipies_middleware.dart';
import 'package:recipe/model/models.dart';
import 'package:recipe/reducers/reducers.dart';
import 'package:recipe/widgets/details_screen.dart';
import 'package:recipe/widgets/recipe_list.dart';

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

  RecipeAppState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return new ReduxProvider(
      store: store,
      child: new MaterialApp(
        title: 'Recipe built value',
        home: new RecipeList(),
        routes: <String, WidgetBuilder>{
          '/details': (BuildContext context) => new DetailsScreen(
                recipePosition: 1,
              )
        },
      ),
    );
  }

  @override
  void initState() {
    MaterialPageRoute.debugEnableFadingRoutes = true;
    store = widget.store;
    store.actions.fetchRecipiesAction();
    super.initState();
  }
}
