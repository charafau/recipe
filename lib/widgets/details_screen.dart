import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:recipe/model/recipe.dart';
import 'package:recipe/widgets/photo.dart';
import 'package:recipe/widgets/radial_expansion.dart';

class DetailsScreen extends StatelessWidget {

  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
  const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  final Recipe recipe;

  DetailsScreen({ @required this.recipe});

  static RectTween _createRectTween(Rect begin, Rect end) {
    return new MaterialRectCenterArcTween(begin: begin, end: end);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Details'),
      ),
      body: new Center(
        child: new SizedBox(
          width: kMaxRadius * 2.0,
          height: kMaxRadius * 2.0,
          child: new Hero(
            createRectTween: _createRectTween,
            tag: recipe.title,
            child: new RadialExpansion(
              maxRadius: kMaxRadius,
              child: new Photo(
                photo: recipe.thumbnail,
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
