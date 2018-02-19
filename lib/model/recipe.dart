library recipe;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'recipe.g.dart';

abstract class Recipe implements Built<Recipe, RecipeBuilder> {

  static Serializer<Recipe> get serializer => _$recipeSerializer;

  Recipe._();

  @BuiltValueField(wireName: 'title')
  String get title;

  @BuiltValueField(wireName: 'href')
  String get link;

  @BuiltValueField(wireName: 'ingredients')
  String get ingredients;

  @BuiltValueField(wireName: 'thumbnail')
  String get thumbnail;

  factory Recipe([updates(RecipeBuilder b)]) = _$Recipe;
}