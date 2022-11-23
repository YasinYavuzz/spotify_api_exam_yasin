import 'package:flutter/cupertino.dart';
import 'package:spotify_api_exam_yasin/models/playlist_model.dart';

class PlaylistProvider extends ChangeNotifier{
  PlaylistModel response = PlaylistModel();
  

  getSpotifyPlaylistData() async {
    response = (await getSpotifyPlaylistData())!;
    notifyListeners();
  }
}