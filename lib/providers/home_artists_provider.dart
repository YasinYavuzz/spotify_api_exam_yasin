
import 'package:flutter/material.dart';
import 'package:spotify_api_exam_yasin/models/home_artist_model.dart';
import 'package:spotify_api_exam_yasin/services/spotify_services.dart';

class HomeArtistModelsProvider extends ChangeNotifier{

    HomeArtistsModel? homeArtistsModel;

    getHomeArtistsData() async{
      homeArtistsModel = await getHomeArtistModel();
      print(homeArtistsModel!.artists![0].images![0].url);
      notifyListeners();
    }

}