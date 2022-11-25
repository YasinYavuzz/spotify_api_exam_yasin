import 'package:flutter/material.dart';
import 'package:spotify_api_exam_yasin/models/search_model.dart';
import 'package:spotify_api_exam_yasin/services/spotify_services.dart';

class SearchProvider extends ChangeNotifier{
    SearchModels? searchModels;
    // String query = "Yasin";

    getSearchData() async{
      searchModels = await getSearchModel();
      // print(searchModels!.artists!.items![0].name);
      notifyListeners();
    }

    getQuery({required String query}){
      //this.query = query; 
      notifyListeners();
    }

}