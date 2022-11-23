import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/categories_provider.dart';

class CategoriesGridView extends StatefulWidget {
  const CategoriesGridView({super.key});

  @override
  State<CategoriesGridView> createState() => _CategoriesGridViewState();
}

class _CategoriesGridViewState extends State<CategoriesGridView> {
  List<Color> itemsColor = [
    Colors.red,
    Colors.blue,
    Colors.redAccent,
    Colors.green,
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.pinkAccent,
    Colors.purpleAccent,
    Colors.purpleAccent,
    Colors.purpleAccent
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 70.h,
      // decoration: const BoxDecoration(color: Colors.red),
      child: GridView.builder(
        //physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 15, bottom: 32, left: 5, right: 5),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 120),
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[800],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Consumer(
                builder: (BuildContext context, CategoriesProvider value,
                    Widget? child) {
                  return value.response.categories != null ? Container(
                    padding: const EdgeInsets.only(left: 15, top: 20),
                    decoration: BoxDecoration(
                        image:  DecorationImage(image: NetworkImage(value.response.categories!.items![index].icons![0].url.toString()),fit: BoxFit.fitWidth),
                        //color: itemsColor[index],
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      '${value.response.categories!.items![index].name}',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ): Center(child: CircularProgressIndicator());
                },
              ));
        },
      ),
    );
  }
}
