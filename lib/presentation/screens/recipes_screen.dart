import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/data/models/error_message_model.dart';
import 'package:breaking_bad_app/logic/cubit/recipes_cubit.dart';
import 'package:breaking_bad_app/presentation/widgets/custom_app_bar.dart';
import 'package:breaking_bad_app/presentation/widgets/error_message_widget.dart';
import 'package:breaking_bad_app/presentation/widgets/recipes_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  Widget buildBlocWidget() {
    return BlocBuilder<RecipesCubit, RecipesState>(
      builder: ((context, state) {
        if (state is RecipesLoadingState) {
          return Center(
            child: CircularProgressIndicator(color: MyColors.yellow800),
          );
        } else if (state is RecipesSuccessState) {
          return RecipesGridview(recipes: state.recipes);
        } else if (state is RecipesFailureState) {
          return ErrorMessageWidget(error: state.error);
        } else {
          return ErrorMessageWidget(
            error: ErrorMessageModel(
              message: "Some thing is wrong , try again letter",
              icon: Icons.error,
            ),
          );
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: CustomAppBar(),
      body: buildBlocWidget(),
    );
  }
}
