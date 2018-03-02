import 'package:flutter/material.dart';
import 'package:flutter_built_redux/flutter_built_redux.dart';
import 'package:meta/meta.dart';
import 'package:recipe/actions/actions.dart';
import 'package:recipe/model/models.dart';
import 'package:recipe/model/recipe.dart';
import 'package:recipe/widgets/photo.dart';
import 'package:recipe/widgets/radial_expansion.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

class DetailsScreen extends StoreConnector<AppState, AppActions, Recipe> {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  final int recipePosition;

  DetailsScreen({@required this.recipePosition});

  static RectTween _createRectTween(Rect begin, Rect end) {
    return new MaterialRectCenterArcTween(begin: begin, end: end);
  }

  @override
  Recipe connect(AppState state) => state.result.results[recipePosition];

  final double _appBarHeight = 256.0;
  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  @override
  Widget build(BuildContext context, Recipe state, AppActions actions) {
    return new Scaffold(
        body: new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          expandedHeight: _appBarHeight,
          pinned: _appBarBehavior == AppBarBehavior.pinned,
          floating: _appBarBehavior == AppBarBehavior.floating ||
              _appBarBehavior == AppBarBehavior.snapping,
          snap: _appBarBehavior == AppBarBehavior.snapping,
          flexibleSpace: new FlexibleSpaceBar(
            title: new Text(state.title),
            background: new Stack(
              fit: StackFit.expand,
              children: <Widget>[
                new Hero(
                  createRectTween: _createRectTween,
                  tag: state.title,
                  child: new Image.network(
                    state.thumbnail,
                    fit: BoxFit.cover,
                    height: _appBarHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
        new SliverList(
            delegate: new SliverChildListDelegate(<Widget>[
          new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text('Igredients',
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: _buildIngredients(state.ingredients),
          ),
        ])),
      ],
    ));
  }

  Widget _buildIngredients(String ingredients) {
    List<String> split = ingredients.replaceAll(' ', '').split(',');
    final reduce = split.reduce((value, element) => value + "\n" + element);
    return new Text('' + reduce);
  }
}
