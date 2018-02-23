import 'dart:async';
import 'dart:core';

import 'package:recipe/data/web_client.dart';
import 'package:recipe/model/models.dart';

class RecipeRepository {
  final WebClient webClient;

  RecipeRepository({this.webClient});

  Future<Result> loadRecipies() async => webClient.fetchResult();

}