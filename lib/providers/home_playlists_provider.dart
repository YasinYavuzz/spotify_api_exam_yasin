

import 'package:flutter/material.dart';
import 'package:spotify_api_exam_yasin/services/spotify_services.dart';
import '../models/home_playlists_model.dart';

class HomePlaylistsModelsProvider extends ChangeNotifier{

    HomePlaylistsModel? homePlaylistsModel;

    getHomePlaylistsData() async{
      homePlaylistsModel = await getHomePlaylistsModel();
      print(homePlaylistsModel!.items![0].images![0]);
      notifyListeners();
    }

}