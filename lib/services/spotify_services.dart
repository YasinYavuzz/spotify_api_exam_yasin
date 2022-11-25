import 'dart:developer';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:spotify_api_exam_yasin/models/categories_model.dart';
import 'package:spotify_api_exam_yasin/models/home_albums_model.dart';
import 'package:spotify_api_exam_yasin/models/home_artist_model.dart';
import 'package:spotify_api_exam_yasin/models/search_model.dart';
import 'package:spotify_api_exam_yasin/models/users_profile_model.dart';
import '../models/home_playlists_model.dart';
import '../models/playlist_model.dart';


final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
  "Authorization":
      "Bearer BQDxanm1mu3id5MreRnK0r0AQuvA7nHI4-mX7_cJYOkKdbhVvYKmmYOOWcFEaXbPxXQQ67ZTZ2OTYX8TAmB7rJLd18R_Rz90n3QGqO3B4-dJJ3dE8mv1grQeoicJYSYGcP9TLpINf3t2hEW-ipuxk7lglPdyMhqjxJa0FOZWbIkhzb6TmkeyHJaPq4G9BgfMKpnFEGs-TtH5e9fNvQjcTqF9Ewrc3XrBYSQf5w8oZ4WPuFqbZrppZ3dPb3fUKOlBXA6_1SVJemDTWKBW9BscyhgKyNFtZptajX4evmDAPFmcp2NWmqfZVEsrcFoGlO9HL_SOEFG7bYsB"
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

Future<HomeArtistsModel?> getHomeArtistModel() async {
  HomeArtistsModel homeArtistsModel;
  // PlaylistProvider? playlistProvider;
  // String categoryId = "";
  try {
    // final response = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    try {
      final response = await _dio
          .get("artists?ids=2CIMQHirSU0MQqyYHq0eOx%2C57dN52uHvrHOxijzpIgu3E%2C1vCWHaC5f2uS3yhpwWbIA6");

      homeArtistsModel = HomeArtistsModel.fromJson(response.data);
      print(homeArtistsModel.artists!.length);
      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return homeArtistsModel;
    } catch (e) {
      print(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<HomeAlbumsModel?> getHomeAlbumsModel() async {
  HomeAlbumsModel homeAlbumsModel;
  // PlaylistProvider? playlistProvider;
  // String categoryId = "";
  try {
    // final response = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    try {
      final response = await _dio
          .get("albums?ids=382ObEPsp2rxGrnsizN5TX%2C1A2GTWGtFfWp7KSQTwWOyo%2C2noRn2Aes5aoNVsU6iWThc&market=TR");

      homeAlbumsModel = HomeAlbumsModel.fromJson(response.data);
      // print(homeAlbumsModel.albums![0].albumType![0]);
      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return homeAlbumsModel;
    } catch (e) {
      print(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<HomePlaylistsModel?> getHomePlaylistsModel() async {
  HomePlaylistsModel homePlaylistsModel;
  // PlaylistProvider? playlistProvider;
  // String categoryId = "";
  try {
    // final response = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    try {
      final response = await _dio
          .get("users/smedjan/playlists?limit=3&offset=0");

      homePlaylistsModel = HomePlaylistsModel.fromJson(response.data);
      // print(homeAlbumsModel.albums![0].albumType![0]);
      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return homePlaylistsModel;
    } catch (e) {
      print(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<SearchModels?> getSearchModel() async {
  SearchModels searchModels;
  // PlaylistProvider? playlistProvider;
  // String categoryId = "";
  try {
    // final response = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    try {
      final response = await _dio
          .get("search?q=Yasin&type=track%2Cartist&market=TR&limit=10&offset=0");

      searchModels = SearchModels.fromJson(response.data);
      // print(homeAlbumsModel.albums![0].albumType![0]);
      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return searchModels;
    } catch (e) {
      print(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}

