import 'dart:convert';

import 'package:recipe/model/serializers.dart';
import 'package:recipe/model/models.dart';
import 'package:test/test.dart';

void main() {
  final String json = """
  {
   "title":"Recipe Puppy",
   "version":0.1,
   "href":"http:\/\/www.recipepuppy.com\/",
   "results":[
      {
         "title":"Ginger Champagne",
         "href":"http:\/\/allrecipes.com\/Recipe\/Ginger-Champagne\/Detail.aspx",
         "ingredients":"champagne, ginger, ice, vodka",
         "thumbnail":"http:\/\/img.recipepuppy.com\/1.jpg"
      }
   ]
}
  """;
  
  
  test('should serialize json', () {
    final Result result = serializers.deserializeWith(Result.serializer, JSON.decode(json));

    print(result.toString());
  });
  
}
