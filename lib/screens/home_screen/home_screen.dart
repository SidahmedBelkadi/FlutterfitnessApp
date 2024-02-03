import 'package:fitness/models/category_model.dart';
import 'package:fitness/models/diet_model.dart';
import 'package:fitness/screens/home_screen/components/categories_section.dart';
import 'package:fitness/screens/home_screen/components/custom_app_bar.dart';
import 'package:fitness/screens/home_screen/components/diest_section.dart';
import 'package:fitness/screens/home_screen/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../models/popular_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  List<CategorModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> populars = [];

  void getInitialInfo() {
    categories = CategorModel.getCategories();
    diets = DietModel.getDiets();
    populars = PopularDietsModel.getPopularDiets();
  }

  @override
  Widget build(BuildContext context) {
    getInitialInfo();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          const SearchField(),
          const SizedBox(
            height: 40,
          ),
          CategoriesSection(categories: categories),
          const SizedBox(
            height: 40,
          ),
          dietSection(diets: diets),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'popular',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: populars[index].boxIsSelected
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(16)),
                        boxShadow: populars[index].boxIsSelected
                            ? [
                                BoxShadow(
                                  color:
                                      const Color(0xff1D1617).withOpacity(.7),
                                  offset: const Offset(0, 10),
                                  blurRadius: 40,
                                  spreadRadius: 0,
                                )
                              ]
                            : [],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0, left: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              populars[index].iconPath,
                              width: 65,
                              height: 65,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  populars[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '${populars[index].name} | ${populars[index].duration} | ${populars[index].calorie}',
                                  style: const TextStyle(
                                    color: Color(0xff7B6F72),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                'assets/icons/button.svg',
                                height: 30,
                                width: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 25,
                    );
                  },
                  itemCount: populars.length,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
