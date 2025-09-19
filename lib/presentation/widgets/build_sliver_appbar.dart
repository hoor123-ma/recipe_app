import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class BuildSliverAppbar extends StatelessWidget {
  RecipeModel recipe;
  BuildSliverAppbar({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 500,
      pinned: true,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: recipe.id,
          child: Image.network(recipe.imageUrl, fit: BoxFit.cover),
        ),
        title: Text(
          recipe.name,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
    );
    ;
  }
}
