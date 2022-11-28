
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/home_albums_provider.dart';
class AlbumsListView extends StatefulWidget {
  const AlbumsListView({super.key});

  @override
  State<AlbumsListView> createState() => _AlbumsListViewState();
}

class _AlbumsListViewState extends State<AlbumsListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, HomeAlbumsModelsProvider value, Widget? child) { 
        return value.homeAlbumsModel != null ? Container(
        width: 100.w,
        height: 22.h,
        decoration: const BoxDecoration(
            // color: Colors.blue
            ),
        child: ListView.builder(
          itemCount: value.homeAlbumsModel?.albums?.length,
          // padding: const EdgeInsets.only(right: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GridTile(
                child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Image.network(
                        '${value.homeAlbumsModel?.albums?[index].images?[0].url}')));
          },
        ),
      ) : const CircularProgressIndicator();
       },
      
    );
  }
}
