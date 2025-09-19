import 'package:breaking_bad_app/constant/my_colors.dart';
import 'package:breaking_bad_app/logic/cubit/recipes_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(65);
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool _isSearch = false;
  final TextEditingController _searchController = TextEditingController();

  void _startSearch(BuildContext context) {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(
        onRemove: () {
          // بيرجع للوضع العادي لما المستخدم يضغط Back
          _searchController.clear();
          context.read<RecipesCubit>().searchRecipe("");
          setState(() {
            _isSearch = false;
          });
        },
      ),
    );

    setState(() {
      _isSearch = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: MyColors.yellow600,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      title: _isSearch
          ? _textSearchField(context)
          : Text(
              "Recipes",
              style: TextStyle(color: MyColors.grey, fontSize: 20),
            ),

      actions: _buildAppBarActions(context),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          _isSearch ? Icons.close : Icons.search,
          color: MyColors.grey,
        ),
        onPressed: () {
          if (_isSearch) {
            Navigator.pop(context); // نفس فكرة back → يخرج من وضع البحث
          } else {
            _startSearch(context);
          }
        },
      ),
    ];
  }

  TextField _textSearchField(BuildContext context) {
    return TextField(
      controller: _searchController,
      autofocus: true,
      cursorColor: MyColors.grey,
      style: TextStyle(color: MyColors.grey, fontSize: 18),
      decoration: InputDecoration(
        hintText: "Search recipes...",
        hintStyle: TextStyle(
          color: MyColors.grey.withOpacity(0.6),
          fontSize: 18,
        ),
        border: InputBorder.none,
      ),
      onChanged: (value) {
        context.read<RecipesCubit>().searchRecipe(value);
      },
    );
  }
}
