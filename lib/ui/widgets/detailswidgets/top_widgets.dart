import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/playlist_provider.dart';
class TopWidgets extends StatefulWidget {
  const TopWidgets({super.key});

  @override
  State<TopWidgets> createState() => _TopWidgetsState();
}

class _TopWidgetsState extends State<TopWidgets> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, PlaylistProvider value, Widget? child) { 
        return value.response.playlists != null ? SafeArea(
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start, children: [
                    GestureDetector(
                      onDoubleTap: () {
                        print('${value.response.playlists!.items![0].images![0].url}');
                      },
                      child: Container(
                        width: 40.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(
                            image: NetworkImage('${value.response.playlists!.items![value.index!].images![0].url}'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
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
                          //decoration: const BoxDecoration(color: Colors.red),
                          child: const Text('ÇALMA LİSTESİ',style: TextStyle(color: Colors.white),),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(top: 1.h),
                          width: 45.w,
                          height: 8.h,
                          //decoration: const BoxDecoration(color: Colors.red),
                          child: Text(
                            style: const TextStyle(color: Colors.white,fontSize: 28),
                            '${value.response.playlists!.items![value.index!].name}'
                          ),
                        ),
                        Container(
                          //margin: EdgeInsets.only(top: .3.h),
                          width: 45.w,
                          height: 8.h,
                          // decoration: const BoxDecoration(color: Colors.red),
                          child: Text(
                            style: const TextStyle(color: Colors.grey, fontSize: 14),
                            value.response.playlists!.items![value.index!].description.toString()),
                        ),
                      ],
                    ),
                  ]),
                ],
              ))) : Container();
      },
      
    );
  }
}