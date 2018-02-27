import 'package:flutter/material.dart';
import 'package:recipe/model/recipe.dart';

import 'dart:math' as math;

import 'package:recipe/widgets/details_screen.dart';

class RecipeItem extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  final Recipe recipe;

  RecipeItem({this.recipe});

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/details');
        },
        child: new Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    width: kMinRadius * 2.0,
                    height: kMinRadius * 2.0,
                    child: new Hero(
                        tag: recipe.title,
                        child: new RadialExpansion(
                          maxRadius: kMaxRadius * 2.0,
                          child: new Photo(
                            photo: recipe.thumbnail,
                            onTap: () {
                              Navigator.of(context).push(
                                new PageRouteBuilder<Null>(
                                  pageBuilder: (BuildContext context,
                                      Animation<double> animation,
                                      Animation<double> secondaryAnimation) {
                                    return new AnimatedBuilder(
                                        animation: animation,
                                        builder:
                                            (BuildContext context, Widget child) {
                                          return new Opacity(
                                            opacity: opacityCurve
                                                .transform(animation.value),
//                                  child: _buildPage(context, imageName, description),
                                            child: new DetailsScreen(),
                                          );
                                        });
                                  },
                                ),
                              );
                            },
                          ),
                        )),
                  ),
//                  new SizedBox(
//                    width: 48.0,
//                    child: new ClipRRect(
//                      borderRadius: new BorderRadius.circular(50.0),
//                      child: new Image.network(recipe.thumbnail),
//                    ),
//                  ),
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
                  children: _buildIngredients(recipe.ingredients),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildIngredients(String ingredients) {
    List<String> split = ingredients.split(',');
    split.removeWhere((string) => string == "");

    return split
        .map((i) => new Chip(
              label: new Text(i),
            ))
        .toList();
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  })
      : clipRectSize = 2.0 * (maxRadius / math.SQRT2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new ClipOval(
      child: new Center(
        child: new SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: new ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class Photo extends StatelessWidget {
  Photo({Key key, this.photo, this.color, this.onTap}) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return new Material(
      // Slightly opaque color appears where the image has transparency.
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: new InkWell(
        onTap: onTap,
        child: new LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            return new Image.network(
              photo,
              fit: BoxFit.contain,
            );
          },
        ),
      ),
    );
  }
}
