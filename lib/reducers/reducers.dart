import 'package:built_redux/built_redux.dart';
import 'package:recipe/actions/actions.dart';
import 'package:recipe/model/models.dart';

var reducerBuiler = new ReducerBuilder<AppState, AppStateBuilder>()
  ..add(AppActionsNames.fetchRecipiesSuccess, fetchedRecipiesSuccess);

void fetchedRecipiesSuccess(
    AppState state, Action<Result> action, AppStateBuilder builder) {
  print('result is loaded' + action.payload.toString());
  builder
      ..result = action.payload.toBuilder()
      ..isLoading = false;
}
