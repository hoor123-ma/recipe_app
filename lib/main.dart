// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:breaking_bad_app/data/repos/recipes_repo.dart';
import 'package:breaking_bad_app/data/web_service/recipes_web_service.dart';
import 'package:breaking_bad_app/logic/cubit/recipes_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:breaking_bad_app/app_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  var recipes = await RecipesRepo(
    service: RecipesWebService(dio: Dio()),
  ).getRecipesList();

  runApp(RecipesApp(appRouter: AppRouter()));
}

class RecipesApp extends StatelessWidget {
  RecipesApp({Key? key, required this.appRouter}) : super(key: key);
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
