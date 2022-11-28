import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:flutter/material.dart';
import 'package:spotify_api_exam_yasin/providers/home_artists_provider.dart';

class ArtistsListView extends StatefulWidget {
  const ArtistsListView({super.key});

  @override
  State<ArtistsListView> createState() => _ArtistsListViewState();
}

class _ArtistsListViewState extends State<ArtistsListView> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, HomeArtistModelsProvider value,
          Widget? child) {
        return value.homeArtistsModel != null
            ? Container(
                width: 100.w,
                height: 22.h,
                decoration: const BoxDecoration(
                    //color: Colors.yellow
                    ),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.homeArtistsModel!.artists!.length,
                  // padding: const EdgeInsets.only(right: 10),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GridTile(
                        child: Container(
                            margin: const EdgeInsets.all(5),
                            child: Image.network(
                              '${value.homeArtistsModel!.artists![index].images![0].url}',
                              scale: 1,
                            )));
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
