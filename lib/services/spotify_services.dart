import 'dart:developer';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:spotify_api_exam_yasin/models/categories_model.dart';
import 'package:spotify_api_exam_yasin/providers/categories_provider.dart';

import '../models/playlist_model.dart';
import '../providers/playlist_provider.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
  "Authorization":
      "Bearer BQDzZVp9PkizmNVV-S_xMnmdBjiOXeSsr-AXrG92oNuPknhFbH2QaquujkAWpg_8gBZDiucEkf0L6BBcLUENRByqbRbXJSt9Lt192VB8voKphYt_uVzk-TkuLgqJapJJPB9_HD9lHD-6hQBVNfstWBnm8IFMfi9HQWuft4LasbOHCyM7GS05xrwPiCeA-BpB-BQAXGvO8cRSpggbkrndFUZ2MBNu00NvYir1JibUpAX4S2OHG_icDauobRh-AlXxNQe-xZvQmf6YtMKznLMz7MlMsUwbDgNC_AC-J9xatLrB"
}));

Future<CategoriesModel?> getSpotifyCategoriesModel() async {
  CategoriesModel categoriesModel;
  CategoriesProvider? categoriesProvider;
  try {
    // final response = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    try {
      final response = await _dio
          .get("browse/categories?country=TR&locale=tr_TR&limit=10&offset=5");

      categoriesModel = CategoriesModel.fromJson(response.data);
      print(categoriesModel.categories);
      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return categoriesModel;
    } catch (e) {
      print(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<PlaylistModel?> getSpotifyPlaylistModel() async {
  PlaylistModel playlistModel;
  PlaylistProvider? playlistProvider;
  String categoryId = "";
  try {
    // final response = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    try {
      final response = await _dio
          .get("browse/categories/$categoryId/playlists?country=TR&limit=10&offset=5");

      playlistModel = PlaylistModel.fromJson(response.data);
      print(playlistModel.playlists);
      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return playlistModel;
    } catch (e) {
      print(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}
