import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/bottom_navbar_provider.dart';
import 'package:spotify_api_exam_yasin/providers/categories_provider.dart';
import 'package:spotify_api_exam_yasin/providers/home_artists_provider.dart';
import 'package:spotify_api_exam_yasin/providers/playlist_provider.dart';
import 'package:spotify_api_exam_yasin/providers/search_provider.dart';
import 'package:spotify_api_exam_yasin/providers/users_profile_provider.dart';
import 'package:spotify_api_exam_yasin/ui/widgets/searchwidgets/bot_nav_bar.dart';
import 'providers/home_albums_provider.dart';
import 'providers/home_playlists_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<CategoriesProvider>(
              create: (_) => CategoriesProvider(),
            ),
            ChangeNotifierProvider<PlaylistProvider>(
              create: (_) => PlaylistProvider(),
            ),
            ChangeNotifierProvider<UsersProfileProvider>(
              create: (_) => UsersProfileProvider(),
            ),
            ChangeNotifierProvider<HomeAlbumsModelsProvider>(
              create: (_) => HomeAlbumsModelsProvider(),
            ),
            ChangeNotifierProvider<HomeArtistModelsProvider>(
              create: (_) => HomeArtistModelsProvider(),
            ),
            ChangeNotifierProvider<HomePlaylistsModelsProvider>(
              create: (_) => HomePlaylistsModelsProvider(),
            ),
            ChangeNotifierProvider<BottomNavbarProvider>(
              create: (_) => BottomNavbarProvider(),
            ),
            ChangeNotifierProvider<SearchProvider>(
              create: (_) => SearchProvider(),
            ),
          ],
          child: const MaterialApp(
            home: MainPage(),
            debugShowCheckedModeBanner: false,
            
          ),
        );
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, BottomNavbarProvider value, Widget? child) { 
        return Scaffold(
        extendBody: true,
        body: value.getChangePage(),
        bottomNavigationBar: const BotNavBar(),
      );
       },
      
    );
  }
}