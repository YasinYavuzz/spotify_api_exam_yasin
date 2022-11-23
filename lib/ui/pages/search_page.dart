import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/categories_provider.dart';
import 'package:spotify_api_exam_yasin/ui/widgets/searchwidgets/bot_nav_bar.dart';
import 'package:spotify_api_exam_yasin/ui/widgets/searchwidgets/categories_grid_view.dart';
import 'package:spotify_api_exam_yasin/ui/widgets/searchwidgets/search_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {
  CategoriesProvider? categoriesProvider;
  // CategoriesModel? categoriesModel;
  @override
  void initState() {
    categoriesProvider = Provider.of<CategoriesProvider>(context, listen: false);
    categoriesProvider!.getSpotifyCategoriesData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.grey[800],
      bottomNavigationBar: const BotNavBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Container(
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                'Ara',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 4.h,
            ),
            FadeInDownBig(child: const SearchField()),
            SizedBox(
              height: 3.3.h,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                'Hepsine göz at',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 1.h,),
            FadeInLeft(child: const CategoriesGridView())
          ],
        ),
      ),
    );
  }
}
