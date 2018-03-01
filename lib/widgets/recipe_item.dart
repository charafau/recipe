import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:recipe/config/application.dart';
import 'package:recipe/model/recipe.dart';
import 'package:recipe/widgets/details_screen.dart';
import 'package:recipe/widgets/photo.dart';
import 'package:recipe/widgets/radial_expansion.dart';

class RecipeItem extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  final Recipe recipe;
  final int position;

  RecipeItem({@required this.recipe, @required this.position});

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new InkWell(
        onTap: () {
          Application.router.navigateTo(context, "/details/$position");
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
                                        builder: (BuildContext context,
                                            Widget child) {
                                          return new Opacity(
                                            opacity: opacityCurve
                                                .transform(animation.value),
                                            child: new DetailsScreen(
                                                recipePosition: position),
                                          );
                                        });
                                  },
                                ),
                              );
                            },
                          ),
                        )),
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
