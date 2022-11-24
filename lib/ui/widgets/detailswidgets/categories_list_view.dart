import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/playlist_provider.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, PlaylistProvider value, Widget? child) { 
        return value.response.playlists != null ? SizedBox(
        width: 100.w,
        height: 68.h,
        //decoration: const BoxDecoration(color: Colors.red),
        child: ListView.builder(
          // primary: true,
          // dragStartBehavior: DragStartBehavior.down,
          // physics: const NeverScrollableScrollPhysics(),
          
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 0),
          itemCount: value.response.playlists!.items!.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return ListTile(
              // tileColor: index.isOdd ? Colors.grey[400] : Colors.black26,    
              // enableFeedback: false,
              // autofocus: false,
              // shape: const Border(

              //     bottom:
              //         BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1)),
              contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              title: Text(
                '${value.response.playlists!.items![index].name}',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              leading:
                  CircleAvatar(radius: 35, 
                    backgroundImage: NetworkImage('${value.response.playlists!.items![index].images![0].url}')
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
                '${value.response.playlists!.items![index].description}',
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 10,
                    fontWeight: FontWeight.w500),
              ),
              // leading: Container()
            );
          },
        ),
      ) : Container(
        alignment: Alignment.center,
        child: const CircularProgressIndicator());
      },
      
    );
  }
}
