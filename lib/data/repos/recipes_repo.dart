import 'package:breaking_bad_app/data/models/api_result.dart';
import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:breaking_bad_app/data/web_service/recipes_web_service.dart';
import 'package:dio/dio.dart';

class RecipesRepo {
  final RecipesWebService service;
  RecipesRepo({required this.service});

  Future<ApiResult<List<RecipeModel>>> getRecipesList() async {
    ApiResult result = await service.getRecipesResponse();

    if (result.data != null) {
      final recipesJson = result.data["recipes"] as List;
      final recipes = recipesJson.map((e) => RecipeModel.fromJson(e)).toList();
      print(recipes);
      return ApiResult<List<RecipeModel>>(
        data: recipes,
      ); // بيرجع List<RecipeModel>
    } else {
      print(result);
      return ApiResult<List<RecipeModel>>(
        error: result.error,
      ); // غالبًا ErrorMessageModel
    }
  }
}
