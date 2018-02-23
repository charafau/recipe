import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipe/model/models.dart';
import 'package:recipe/model/serializers.dart';

const String _baseUrl = 'http://www.recipepuppy.com/api/';

class WebClient {
  Future<Result> fetchResult() async {
    final endpoint = '';
    final response = await http.get(_baseUrl);

    final Result result = serializers.deserializeWith(
        Result.serializer, JSON.decode(response.body));

    print('result ' + response.body.toString());
    return result;
  }
}
