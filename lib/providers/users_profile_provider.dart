

import 'package:flutter/material.dart';
import 'package:spotify_api_exam_yasin/models/users_profile_model.dart';
import 'package:spotify_api_exam_yasin/services/spotify_services.dart';

class UsersProfileProvider extends ChangeNotifier{

    UsersProfileModel? usersProfileModel;

    getUserProfileData() async{
      usersProfileModel = await getSpotifyUsersProfileModel();
      notifyListeners();
    }

}