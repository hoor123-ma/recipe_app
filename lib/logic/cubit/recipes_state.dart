part of 'recipes_cubit.dart';

abstract class RecipesState {}

class RecipesInitialState extends RecipesState {}

class RecipesLoadingState extends RecipesState {}

class RecipesSuccessState extends RecipesState {
  ApiResult<List<RecipeModel>> recipes;
  RecipesSuccessState({required this.recipes});
}

class RecipesFailureState extends RecipesState {
  ErrorMessageModel error;
  RecipesFailureState({required this.error});
}
