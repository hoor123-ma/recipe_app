import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/data/models/api_result.dart';
import 'package:breaking_bad_app/data/models/error_message_model.dart';
import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:breaking_bad_app/data/repos/recipes_repo.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'recipes_state.dart';

class RecipesCubit extends Cubit<RecipesState> {
  final RecipesRepo recipeRepo;
  late final ApiResult<List<RecipeModel>> result;

  // نخزن كل الوصفات هنا
  List<RecipeModel> allRecipes = [];

  RecipesCubit({required this.recipeRepo}) : super(RecipesInitialState());

  Future<void> getRecipes() async {
    emit(RecipesLoadingState());

    try {
      result = await recipeRepo.getRecipesList();

      if (result.data != null) {
        allRecipes = result.data!; // نخزن الوصفات الأصلية
        emit(RecipesSuccessState(recipes: result));
      } else {
        emit(RecipesFailureState(error: result.error!));
      }
    } catch (e) {
      emit(
        RecipesFailureState(
          error: ErrorMessageModel(message: e.toString(), icon: Icons.error),
        ),
      );
    }
  }

  void searchRecipe(String query) {
    if (query.isEmpty) {
      // لو مفيش بحث رجّع كل الوصفات
      emit(RecipesSuccessState(recipes: ApiResult(data: allRecipes)));
    } else {
      // فلترة بالاسم
      final filtered = allRecipes
          .where(
            (recipe) =>
                recipe.name.toLowerCase().startsWith(query.toLowerCase()),
          )
          .toList();
      if (filtered.isNotEmpty) {
        emit(RecipesSuccessState(recipes: ApiResult(data: filtered)));
      } else if (filtered.isEmpty) {
        emit(
          RecipesFailureState(
            error: ErrorMessageModel(
              message: "There is no recipe with this name",
              icon: Icons.error_outline,
            ),
          ),
        );
      }
    }
  }
}
