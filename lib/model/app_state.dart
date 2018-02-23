library app_state;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:recipe/model/models.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  static Serializer<AppState> get serializer => _$appStateSerializer;

  Result get result;

  bool get isLoading;

  AppState._();

  factory AppState.loading() => new AppState((b) => b..isLoading = true);

  factory AppState([updates(AppStateBuilder b)]) = _$AppState;
}
