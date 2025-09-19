import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/constant/strings.dart';
import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class RecipeItemWidget extends StatelessWidget {
  final RecipeModel recipe;

  const RecipeItemWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, recipeDetailsScreen, arguments: recipe);
      },
      child: GridTile(
        child: Hero(
          tag: recipe.id,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(recipe.imageUrl, fit: BoxFit.cover),
          ),
        ),
        footer: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: MyColors.yellow400,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Text(
            recipe.name,
            style: TextStyle(color: MyColors.grey, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
