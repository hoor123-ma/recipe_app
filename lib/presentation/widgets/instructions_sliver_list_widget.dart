import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:flutter/material.dart';

class InstructionsSliverListWidget extends StatelessWidget {
  final RecipeModel recipe;
  const InstructionsSliverListWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              child: Text("${index + 1}"),
            ),
            title: Text(
              recipe.instructions[index],
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
        );
      }, childCount: recipe.instructions.length),
    );
  }
}
