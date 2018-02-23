library actions;

import 'package:built_redux/built_redux.dart';
import 'package:recipe/model/models.dart';

part 'actions.g.dart';

abstract class AppActions implements ReduxActions {
  ActionDispatcher<Null> fetchRecipiesAction;
  ActionDispatcher<Result> fetchRecipiesSuccess;

  AppActions._();

  factory AppActions() => new _$AppActions();
}
