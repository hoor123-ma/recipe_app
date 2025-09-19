import 'package:breaking_bad_app/constant/strings.dart';
import 'package:breaking_bad_app/data/models/recipe_model.dart';
import 'package:breaking_bad_app/data/repos/recipes_repo.dart';
import 'package:breaking_bad_app/data/web_service/recipes_web_service.dart';
import 'package:breaking_bad_app/logic/cubit/recipes_cubit.dart';
import 'package:breaking_bad_app/presentation/screens/onboarding/on_boarding_screen.dart';
import 'package:breaking_bad_app/presentation/screens/recipe_details_screen.dart';
import 'package:breaking_bad_app/presentation/screens/recipes_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  late RecipesRepo recipesRepo;
  late RecipesWebService recipesWebService;

  AppRouter() {
    recipesWebService = RecipesWebService(dio: Dio());
    recipesRepo = RecipesRepo(service: recipesWebService);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case recipesScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) {
              return RecipesCubit(recipeRepo: recipesRepo)..getRecipes();
            },
            child: RecipesScreen(),
          ),
        );
      case recipeDetailsScreen:
        final recipe = settings.arguments as RecipeModel;
        return MaterialPageRoute(
          builder: (_) => RecipeDetailsScreen(recipe: recipe),
        );
    }
  }
}
