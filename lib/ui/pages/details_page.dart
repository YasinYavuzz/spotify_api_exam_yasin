import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_api_exam_yasin/providers/playlist_provider.dart';
import 'package:spotify_api_exam_yasin/ui/widgets/detailswidgets/categories_list_view.dart';
import 'package:spotify_api_exam_yasin/ui/widgets/detailswidgets/top_widgets.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, required this.categories_id, required this.index});
  String categories_id;
  int index;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  void initState() {
    //playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
    //playlistProvider = Provider.of<PlaylistProvider>(context, listen: true);
    //print(playlistProvider!.response.playlists!.href);

    // print(playlistProvider!.categories_id);
    
    PlaylistProvider? playlistProvider = Provider.of<PlaylistProvider>(context, listen:false);
    playlistProvider.getSpotifyPlaylistData(
        categories_id: widget.categories_id, index: widget.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //extendBody: true,
        backgroundColor: Colors.grey[800],
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [TopWidgets(), CategoriesListView()],
          ),
        ));
  }
}
