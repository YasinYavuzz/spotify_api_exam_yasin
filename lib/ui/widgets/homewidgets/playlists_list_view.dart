import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/home_playlists_provider.dart';

class PlaylistsListView extends StatefulWidget {
  const PlaylistsListView({super.key});

  @override
  State<PlaylistsListView> createState() => _PlaylistsListViewState();
}

class _PlaylistsListViewState extends State<PlaylistsListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, HomePlaylistsModelsProvider value, Widget? child) { 
        return value.homePlaylistsModel != null ? Container(
        width: 100.w,
        height: 22.h,
        decoration: const BoxDecoration(
            // color: Colors.orange
            ),
        child: ListView.builder(
          itemCount: value.homePlaylistsModel!.items!.length,
          // padding: const EdgeInsets.only(right: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GridTile(
                child: Container(
                    margin: const EdgeInsets.all(5),
                    child: Image.network(
                        '${value.homePlaylistsModel!.items![index].images![0].url}')));
          },
        ),
      ): Container(); },
      
    );
  }
}
