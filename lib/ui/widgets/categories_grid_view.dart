import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        padding: const EdgeInsets.only(top: 15,bottom: 32,left: 5,right: 5),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 120),
        itemBuilder: (context, index) {
          return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              child: Container(
                decoration: BoxDecoration(
                    color: itemsColor[index],
                    borderRadius: BorderRadius.circular(8)),
              ));
        },
      ),
    );
  }
}
