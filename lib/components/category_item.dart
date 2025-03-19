import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({super.key, required this.category});

  void _selectCategory(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (_) {
    //       return CategoriesMealsScreen(category: category);
    //     },
    //   ),
    // );
     
     Navigator.of(context).pushNamed(
       AppRoutes.CATEGORIES_MEALS,
       arguments: category,
     );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(category.title, style: TextStyle(fontSize: 15, fontFamily: 'RobotoCondensed', fontWeight: FontWeight.bold)),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}