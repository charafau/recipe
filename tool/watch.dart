import 'dart:async';

import 'package:build_runner/build_runner.dart';
import 'package:built_value_generator/built_value_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:built_redux/generator.dart';

Future main(List<String> args) async {
  await watch([
    new BuildAction(
        new PartBuilder([
          new BuiltValueGenerator(),
          new BuiltReduxGenerator(),
        ]),
        'recipe',
        inputs: const ['lib/**/*.dart'])
  ], deleteFilesByDefault: true);
}