import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/data/models/api_result.dart';
import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:breaking_bad_app/presentation/widgets/recipe_item_widget.dart';
import 'package:flutter/widgets.dart';

class RecipesGridview extends StatelessWidget {
  final ApiResult<List<RecipeModel>> recipes;

  const RecipesGridview({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    final List<RecipeModel> recipesList = recipes.data ?? []; // safer
    return _recipesListBuild(recipesList);
  }

  GridView _recipesListBuild(List<RecipeModel> recipesList) {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // عدد الأعمدة
        childAspectRatio: 1, // للتحكم في شكل العنصر
        mainAxisSpacing: 7,
        crossAxisSpacing: 7,
      ),
      itemCount: recipesList.length,
      itemBuilder: (context, index) {
        return RecipeItemWidget(recipe: recipesList[index]);
      },
    );
  }
}
