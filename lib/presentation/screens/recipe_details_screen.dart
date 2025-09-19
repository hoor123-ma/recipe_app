import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:breaking_bad_app/presentation/widgets/indredients_sliver_list_widget.dart';
import 'package:breaking_bad_app/presentation/widgets/build_sliver_appbar.dart';
import 'package:breaking_bad_app/presentation/widgets/instructions_sliver_list_widget.dart';
import 'package:breaking_bad_app/presentation/widgets/preptime_and_cook_time_details.dart';
import 'package:flutter/material.dart';

class RecipeDetailsScreen extends StatelessWidget {
  final RecipeModel recipe;
  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: CustomScrollView(
        slivers: [
          BuildSliverAppbar(recipe: recipe),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: const Text(
                "Ingredients",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IngredientsSliverListWidget(recipe: recipe),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: const Text(
                "Instructions",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          InstructionsSliverListWidget(recipe: recipe),
          PreptimeAndCookTimeDetails(recipe: recipe),
        ],
      ),
    );
  }
}
