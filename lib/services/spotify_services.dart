import 'dart:developer';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:spotify_api_exam_yasin/models/categories_model.dart';
import 'package:spotify_api_exam_yasin/providers/categories_provider.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
  "Authorization":
      "Bearer BQAG_w4gxvP6UMn0Vr37mYQUove1BFkSmwMvOgHaD4CB1JkH3OmUR1hKpfVeqYFRrhmLhqXGPRT0xOD728v9SIHaSYLIWhVmlDQ2q9ljVclIdcLmIoGuLP2pvhrovQtj55YLol4Ryhp-6ZljqNGUqo9rTFJHJ4mxKgf1q_pDxWQZ-xWFNCbONBGSsHQaIFn6K-5vtObsIQiRLbDOvZ_IrvmuE6qvt1cYKW6rL19L-Ah8DmSqIvFoilR2EBdA02ZxW6ZEIlYksx3hyX_P7ntHwsmGO58-VmLTWDBdA441lSxf"
}));

Future<CategoriesModel?> getSpotifyModel() async {
  CategoriesModel searchModel;
  CategoriesProvider? categoriesProvider;
  try {
    // final response = await http.get(Uri.parse(
    //     "https://api.openweathermap.org/data/2.5/weather?lat=41.025152&lon=29.019159&appid=cd2a806afdcc70e043cc8c61241ab5e3&units=metric"));
    try {
      final response = await _dio
          .get("browse/categories?country=TR&locale=tr_TR&limit=10&offset=5");

      searchModel = CategoriesModel.fromJson(response.data);
      print(searchModel.categories);
      if (response.statusCode == 200) {
        print("Çalışıyor");
      } else {
        print("Çalışmıyor");
      }
      return searchModel;
    } catch (e) {
      print(e);
    }
  } catch (e) {
    log(e.toString());
  }
  return null;
}
