import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:recipe/actions/actions.dart';
import 'package:recipe/model/models.dart';
import 'package:recipe/widgets/recipe_item.dart';

class RecipeList extends StoreConnector<AppState, AppActions, AppState> {
  RecipeList({Key key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context, AppState state, AppActions actions) {
    Widget content;
    if (state.isLoading) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new RefreshIndicator(
        onRefresh: _handleRefresh,
        child: new ListView.builder(
          padding: new EdgeInsets.all(16.0),
          itemBuilder: (BuildContext context, int index) =>
              _buildTile(index, state),
          itemCount:
              state.result.results != null ? state.result.results.length : 0,
        ),
      );
    }
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('Recipe'),
      ),
      body: content,
    );
  }

  Future<Null> _handleRefresh() {
    final Completer<Null> completer = new Completer<Null>();
    new Timer(const Duration(seconds: 3), () {
      completer.complete(null);
    });
    return completer.future.then((_) {
      _scaffoldKey.currentState?.showSnackBar(new SnackBar(
          content: const Text('Refresh complete'),
          action: new SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }

  @override
  AppState connect(AppState state) => state;

  Widget _buildTile(int index, AppState state) {
    Recipe recipe = state.result.results.elementAt(index);
    return new RecipeItem(recipe: recipe, position: index,);
  }
}
