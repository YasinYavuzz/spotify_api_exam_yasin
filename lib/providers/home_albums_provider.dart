

import 'package:flutter/material.dart';
import 'package:spotify_api_exam_yasin/models/home_albums_model.dart';
import 'package:spotify_api_exam_yasin/services/spotify_services.dart';

class HomeAlbumsModelsProvider extends ChangeNotifier{

    HomeAlbumsModel? homeAlbumsModel;

    getHomeAlbumsData() async{
      homeAlbumsModel = await getHomeAlbumsModel();
      // print(homeAlbumsModel!.albums![0].id);
      notifyListeners();
    }

}