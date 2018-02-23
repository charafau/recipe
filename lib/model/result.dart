library result;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:recipe/model/recipe.dart';

part 'result.g.dart';

abstract class Result implements Built<Result, ResultBuilder> {

  static Serializer<Result> get serializer => _$resultSerializer;

  Result._();

  @BuiltValueField(wireName: 'title')
  @nullable
  String get title;

  @BuiltValueField(wireName: 'version')
  @nullable
  double get version;

  @BuiltValueField(wireName: 'href')
  @nullable
  String get link;

  @BuiltValueField(wireName: 'results')
  @nullable
  BuiltList<Recipe> get results;

  factory Result([updates(ResultBuilder b)]) = _$Result;
}