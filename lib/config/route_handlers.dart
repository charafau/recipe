import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:recipe/widgets/details_screen.dart';

var detailsHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return new DetailsScreen(recipePosition: int.parse(params["position"]));
});
