import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
class TopWidgets extends StatefulWidget {
  const TopWidgets({super.key});

  @override
  State<TopWidgets> createState() => _TopWidgetsState();
}

class _TopWidgetsState extends State<TopWidgets> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            // alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 20, top: 10),
            width: 100.w,
            height: 29.h,
            // decoration: const BoxDecoration(
            //   // color: Colors.white,
            //   // border: Border(
            //   //   bottom: BorderSide(color: Color.fromARGB(255, 0, 0, 0),width: 2,)
            //   // )
            // ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 5.h,
                    width: 5.h,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 241, 76, 76), shape: BoxShape.circle),
                    child: const Icon(
                      Icons.arrow_left,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                SizedBox(
                  height: .8.h,
                ),
                Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Container(
                    width: 40.w,
                    height: 20.h,
                    decoration: const BoxDecoration(color: Colors.red),
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 2.h),
                        width: 45.w,
                        height: 2.h,
                        decoration: const BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2.h),
                        width: 45.w,
                        height: 8.h,
                        decoration: const BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 2.h),
                        width: 45.w,
                        height: 2.h,
                        decoration: const BoxDecoration(color: Colors.red),
                      ),
                    ],
                  ),
                ]),
              ],
            )));
  }
}