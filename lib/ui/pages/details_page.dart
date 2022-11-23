import 'package:flutter/material.dart';
import 'package:spotify_api_exam_yasin/ui/widgets/detailswidgets/categories_list_view.dart';
import 'package:spotify_api_exam_yasin/ui/widgets/detailswidgets/top_widgets.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({super.key, required this.categories_id});
  String categories_id;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  void initState() {
    print(widget.categories_id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //extendBody: true,
        backgroundColor: Colors.grey[800],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            TopWidgets(),
            CategoriesListView()
          ],
        ));
  }
}
