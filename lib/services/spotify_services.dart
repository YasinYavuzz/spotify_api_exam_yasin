import 'dart:developer';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:spotify_api_exam_yasin/models/categories_model.dart';
import 'package:spotify_api_exam_yasin/models/users_profile_model.dart';
import '../models/playlist_model.dart';


final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
  "Authorization":
      "Bearer BQBnc29cuZhaNTig0ySwQcSSWoLlJlYOqoPmcnpi9CVFm2nvIrIcNcPJb4zmGzwmbW2gsvzj6-FaOTjD9RG9Ry4xLePYTiZW6wGu6e3EvL7lbHkzDYvrz0XUfuTrwoCTd2P-mRzv_CIC0kSIiaaqqTsRAmZS3kCon2mj469cJeE-kehbSWVLytbACJbu2Q68LNv5c7g8sPjl7BkiJ0Dz59MASLQnBr81-ivLTRNXg4wypmA_19nZ-V9pMN8Rjm_M9tnS59ZeEaKtxi9prtsEMU3JdBiyJ1GgKxyTslrMpHbAnUF68b629xU"
}));

Future<CategoriesModel?> getSpotifyCategoriesModel() async {
  CategoriesModel categoriesModel;
  // CategoriesProvider? categoriesProvider;
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

Future<PlaylistModel?> getSpotifyPlaylistModel({required String? categories_id}) async {
  PlaylistModel playlistModel;
  // PlaylistProvider? playlistProvider;
  // String categoryId = "";
  try {
    // final response = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    try {
      final response = await _dio
          .get("browse/categories/$categories_id/playlists?country=TR&limit=10&offset=5");

      playlistModel = PlaylistModel.fromJson(response.data);
      print(playlistModel.playlists!.total);
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

Future<UsersProfileModel?> getSpotifyUsersProfileModel() async {
  UsersProfileModel usersProfileModel;
  // PlaylistProvider? playlistProvider;
  // String categoryId = "";
  try {
    // final response = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    try {
      final response = await _dio
          .get("me");

      usersProfileModel = UsersProfileModel.fromJson(response.data);
      print(usersProfileModel.images![0].url);
      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return usersProfileModel;
    } catch (e) {
      print(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}
