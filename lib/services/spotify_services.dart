import 'dart:developer';
// import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:spotify_api_exam_yasin/models/categories_model.dart';
import 'package:spotify_api_exam_yasin/providers/categories_provider.dart';

final Dio _dio =
    Dio(BaseOptions(baseUrl: "https://api.spotify.com/v1/", headers: {
  "Authorization":
      "Bearer BQCOyqKwIv_c-7QmnJAYw1pzZniugBJ82XnewPGW17ELsCy6W7doWTVB1yUl3WTZJ8YMqfi1tjGwmYkef7L5KsI38V-hc9TCJj6GHM1KaWYmpUgakHtH8Wj4NE49P682lOBS2iq6OlJ9c-E5jdtdnZn2_toPhzolHdWUk2Y8h7m4AiCGwnJkRiWY0LEHptprHTKU8vsCXrtuLoiyEt826gK2uHHzxjaHst-jYwDwwS4B0OEx-wPcVKflnzVrUAEK3EnXONWjvhEkh681D61G67IGmKW1F57rkn64haiC_Iwb"
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
