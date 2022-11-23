import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/categories_provider.dart';
import 'package:spotify_api_exam_yasin/providers/playlist_provider.dart';
import 'package:spotify_api_exam_yasin/ui/pages/search_page.dart';

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
            )
          ],
          child: const MaterialApp(
            home: SearchPage(),
            debugShowCheckedModeBanner: false,
          ),
        );
      },
    );
  }
}
