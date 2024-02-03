import 'package:flutter/material.dart';

class CategorModel {
  String name;
  String iconPath;
  Color boxColor;

  CategorModel(
      {required this.name, required this.iconPath, required this.boxColor});

  static List<CategorModel> getCategories() {
    List<CategorModel> categories = [];

    categories.add(
      CategorModel(
        name: 'Salad',
        iconPath: 'assets/icons/plate.svg',
        boxColor: Color(0xff92A3FD),
      ),
    );

    categories.add(
      CategorModel(
        name: 'Cake',
        iconPath: 'assets/icons/pancakes.svg',
        boxColor: Color(0xffC58BF2),
      ),
    );

    categories.add(
      CategorModel(
        name: 'Pie',
        iconPath: 'assets/icons/pie.svg',
        boxColor: Color(0xff92A3FD),
      ),
    );

    categories.add(
      CategorModel(
        name: 'Smothies',
        iconPath: 'assets/icons/orange-snacks.svg',
        boxColor: Color(0xffC58BF2),
      ),
    );

    return categories;
  }
}
