import 'package:flutter/material.dart';
import 'package:recipe/model/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  RecipeItem({this.recipe});

  @override
  Widget build(BuildContext context) {
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
