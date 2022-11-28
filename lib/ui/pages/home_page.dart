
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/home_albums_provider.dart';
import 'package:spotify_api_exam_yasin/providers/home_artists_provider.dart';

import '../../providers/home_playlists_provider.dart';
import '../widgets/homewidgets/albums_list_view.dart';
import '../widgets/homewidgets/artists_list_view.dart';
import '../widgets/homewidgets/playlists_list_view.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    HomeAlbumsModelsProvider homeAlbumsModelsProvider =
        Provider.of<HomeAlbumsModelsProvider>(context, listen: false);
    homeAlbumsModelsProvider.getHomeAlbumsData();

    HomeArtistModelsProvider homeArtistsModelsProvider =
        Provider.of<HomeArtistModelsProvider>(context, listen: false);
    homeArtistsModelsProvider.getHomeArtistsData();

    HomePlaylistsModelsProvider homePlaylistsModelsProvider =
        Provider.of<HomePlaylistsModelsProvider>(context, listen: false);
    homePlaylistsModelsProvider.getHomePlaylistsData();
    // print(homeAlbumsModelsProvider!.homeAlbumsModel!.albums![0]);
    // print(homeAlbumsModelsProvider!.homeAlbumsModel!.albums![0].albumType);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: Consumer(
          builder: (BuildContext context, HomeArtistModelsProvider value, Widget? child) { 
            return value.homeArtistsModel != null ? SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 60.w,
                  height: 15.h,
                  decoration: const BoxDecoration(
                    //color: Colors.red
                  ),
                  child: SvgPicture.asset('assets/ic_spotifylogo.svg'),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left:13,top: 4),
                width: 40.w,
                height: 5.3.h,
                decoration: const BoxDecoration(
                  // color: Colors.black
                ),
                child: const Text('Artists',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
              ),
              const ArtistsListView(),
              Container(
                padding: const EdgeInsets.only(left:13,top: 4),
                width: 40.w,
                height: 5.3.h,
                decoration: const BoxDecoration(
                  // color: Colors.black
                ),
                child: const Text('Albums',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
              ),
              const AlbumsListView(),
              Container(
                padding: const EdgeInsets.only(left:13,top: 4),
                width: 40.w,
                height: 5.3.h,
                decoration: const BoxDecoration(
                  // color: Colors.black
                ),
                child: const Text('Playlists',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w500),),
              ),
              const PlaylistsListView()
            ],
          )) : const Center(child: CircularProgressIndicator());
           },
          
        ),
      ),
    );
  }
}