import 'package:built_redux/built_redux.dart';
import 'package:recipe/actions/actions.dart';
import 'package:recipe/model/models.dart';
import 'package:recipe/data/recipe_repository.dart';
import 'package:recipe/data/web_client.dart';

Middleware<AppState, AppStateBuilder, AppActions>
createStoreRecipiesMiddleware() {
  return (new MiddlewareBuilder<AppState, AppStateBuilder, AppActions>()
    ..add(
        AppActionsNames.fetchRecipiesAction,
        createFetchRecipies(
            new RecipeRepository(webClient: new WebClient()))))
      .build();
}

MiddlewareHandler<AppState, AppStateBuilder, AppActions, Null>
createFetchRecipies(RecipeRepository recipeRepository) {
  return (MiddlewareApi<AppState, AppStateBuilder, AppActions> api,
      ActionHandler next, Action<Null> action) {
    return recipeRepository.loadRecipies().then((result) {
      return api.actions.fetchRecipiesSuccess(result);
    });
  };
}
