import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 68.h,
      //decoration: const BoxDecoration(color: Colors.red),
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 0),
        itemCount: 5,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const ListTile(
            shape: Border(
                bottom:
                    BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1)),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            title: Text(
              'Şarkı Adı',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            leading:
                CircleAvatar(radius: 35, backgroundImage: NetworkImage('url')),
            trailing: Text(
              'Albüm Adı',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            // subtitle: TextButton(
            //   // clipBehavior: Clip.none,
            //   style: ButtonStyle(
            //     alignment: Alignment.centerLeft,
            //     padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            //     tapTargetSize: MaterialTapTargetSize.values[1],
            //   ),
            //   onPressed: () {},
            //   child: const Text('Sanatçı Adı',style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w400),),
            // ),
            subtitle: Text(
              'Sanatçı Adı',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500),
            ),
            // leading: Container()
          );
        },
      ),
    );
  }
}
