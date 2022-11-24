import 'package:flutter/material.dart';
import 'package:spotify_api_exam_yasin/models/playlist_model.dart';
import 'package:spotify_api_exam_yasin/services/spotify_services.dart';

class PlaylistProvider extends ChangeNotifier {
  PlaylistModel response = PlaylistModel();
  String? categories_id;
  int? index;

  getSpotifyPlaylistData(
      {required String categories_id, required int index}) async {
    getChangeCategoriesId(categories_id);
    getChangeCategoriesIndex(index);
    response = (await getSpotifyPlaylistModel(categories_id: categories_id))!;
    notifyListeners();
  }

  getChangeCategoriesId(id) {
    categories_id = id;
  }

  getChangeCategoriesIndex(categoriesIndex) {
    index = categoriesIndex;
  }
}
