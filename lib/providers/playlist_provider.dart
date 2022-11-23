import 'package:flutter/cupertino.dart';
import 'package:spotify_api_exam_yasin/models/playlist_model.dart';

import '../services/spotify_services.dart';

class PlaylistProvider extends ChangeNotifier{
  PlaylistModel response = PlaylistModel();
  String? categories_id;
  

  getSpotifyPlaylistData() async {
    await getChangeCategoriesId(categories_id);
    response = (await getSpotifyPlaylistModel(categories_id))!;
    notifyListeners();
  }

  getChangeCategoriesId(id){
    categories_id = id;
    notifyListeners();
  }

  
}