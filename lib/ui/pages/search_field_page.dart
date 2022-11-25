import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/models/search_model.dart';
import 'package:spotify_api_exam_yasin/providers/search_provider.dart';
import 'package:spotify_api_exam_yasin/ui/widgets/searchwidgets/search_field.dart';

class SearchFieldPage extends StatefulWidget {
  const SearchFieldPage({super.key});

  @override
  State<SearchFieldPage> createState() => _SearchFieldPageState();
}

class _SearchFieldPageState extends State<SearchFieldPage> {
  // SearchProvider? searchProvider;
  List<Items>? itemsSearch;
  @override
  void initState() {
    SearchProvider searchProvider = Provider.of<SearchProvider>(context, listen: false);
    searchProvider.getSearchData();
    // updateList();
    //searchItemsList.addAll(searchProvider.searchModels!.artists!.items!);
    // print(itemsSearch!.length);
    super.initState();
  }

  // Future<void> updateList() async {

  //   await searchProvider?.getSearchData();
  //   setState(() {
  //     itemsSearch = searchProvider?.searchModels!.artists!.items!.where((element) => element.type == 'artist').toList();
  //   });
  //   print(itemsSearch?[0]);
  //   setState(() {
  //     // searchItemsList = items.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
  //     // items = searchItemsList.where((element) => element.)
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: FadeInRight(
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 3.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      //controller: _controller,
                      onChanged: (value) {
                        // updateList();
                      },
                      decoration: InputDecoration(
                          hintText: 'Ne dinlemek istiyorsun?',
                          // hintStyle: const TextStyle(),
                          prefixIcon: const Icon(
                            Icons.search,
                            size: 26,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.all(16),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                    ),
                  ),
                  SizedBox(height: 3.h),
                  
                       Container(
                      width: 100.w,
                      height: 80.h,
                      //decoration: BoxDecoration(color: Colors.red),
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 2,
                        itemBuilder: (context, index) {
                          return ListTile(
                            // tileColor: index.isOdd ? Colors.grey[400] : Colors.black26,
                            // enableFeedback: false,
                            // autofocus: false,
                            // shape: const Border(
                  
                            //     bottom:
                            //         BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1)),
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            title: Text(
                              'ab',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            leading:
                                CircleAvatar(radius: 35,
                                  //backgroundImage: NetworkImage('${itemsSearch![index].images![0].url}')
                                ),
                  
                            // subtitle: TextButton(
                            //   // clipBehavior: Clip.none,
                            //   style: ButtonStyle(
                            //     alignment: Alignment.centerLeft,
                            //     padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                            //     tapTargetSize: MaterialTapTargetSize.values[1],
                            //   ),
                            //   onPressed: () {},
                            //   child: const Text('Sanatçı Adı',style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.w400),),
                            // ),
                            // subtitle: Text(
                            //   'dsfdfghj',
                            //   style: const TextStyle(
                            //       color: Colors.grey,
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.w500),
                            // ),
                            // leading: Container()
                          );
                        },
                      ),
                    ),
                     
                ]),
          ),
        ),
      ),
    );
  }
}
