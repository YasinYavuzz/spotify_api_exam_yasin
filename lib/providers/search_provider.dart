import 'package:flutter/material.dart';
import 'package:spotify_api_exam_yasin/models/search_model.dart';
import 'package:spotify_api_exam_yasin/services/spotify_services.dart';

class SearchProvider extends ChangeNotifier{
    SearchModels? searchModels;
    String query = "Betul";

    getSearchData() async{
      searchModels = await getSearchModel(query: query);
      notifyListeners();
    }

    getQuery({required String query}){
      this.query = query; 
      getSearchData();
      notifyListeners();
    }

}