import 'package:flutter/cupertino.dart';
import 'package:spotify_api_exam_yasin/models/categories_model.dart';
import 'package:spotify_api_exam_yasin/services/spotify_services.dart';

class CategoriesProvider extends ChangeNotifier{
  CategoriesModel response = CategoriesModel();
  

  getSpotifyData() async {
    response = (await getSpotifyModel())!;
    notifyListeners();
  }
} 