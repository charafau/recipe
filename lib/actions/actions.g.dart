// GENERATED CODE - DO NOT MODIFY BY HAND

part of actions;

// **************************************************************************
// Generator: BuiltReduxGenerator
// **************************************************************************

class _$AppActions extends AppActions {
  factory _$AppActions() => new _$AppActions._();
  _$AppActions._() : super._();

  final ActionDispatcher<Null> fetchRecipiesAction =
      new ActionDispatcher<Null>('AppActions-fetchRecipiesAction');
  final ActionDispatcher<Result> fetchRecipiesSuccess =
      new ActionDispatcher<Result>('AppActions-fetchRecipiesSuccess');

  @override
  void setDispatcher(Dispatcher dispatcher) {
    fetchRecipiesAction.setDispatcher(dispatcher);
    fetchRecipiesSuccess.setDispatcher(dispatcher);
  }
}

class AppActionsNames {
  static final ActionName<Null> fetchRecipiesAction =
      new ActionName<Null>('AppActions-fetchRecipiesAction');
  static final ActionName<Result> fetchRecipiesSuccess =
      new ActionName<Result>('AppActions-fetchRecipiesSuccess');
}
