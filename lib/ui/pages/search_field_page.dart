import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spotify_api_exam_yasin/providers/search_provider.dart';

class SearchFieldPage extends StatefulWidget {
  const SearchFieldPage({super.key});

  @override
  State<SearchFieldPage> createState() => _SearchFieldPageState();
}

class _SearchFieldPageState extends State<SearchFieldPage> {
  SearchProvider? searchProvider;
  List? searchTracks;
  List? searchArtist;
  @override
  void initState() {
    searchProvider = Provider.of<SearchProvider>(context, listen: false);
    // searchProvider!.getSearchData();
    // artistItemsSearch = searchProvider?.searchModels!.artist!.items!.where((element) => element.type == 'artists').toList();
    // print(artistItemsSearch![0]);
    
    updateList();
    // searchTracks = searchProvider!.searchModels!.tracks!.items!;
    //searchItemsList.addAll(searchProvider.searchModels!.artists!.items!);
    // print(itemsSearch!.length);
    super.initState();
  }

  Future<void> updateList() async {
    await searchProvider!.getSearchData();
   
    // for (var element in searchProvider!.searchModels!.artists!.items!) {
    //   artist!.add(element);
    // }

    // for (var element in searchProvider!.searchModels!.tracks!.items!) {
    //   tracks!.add(element);
    // }
    // print(artist.toString());
    //artistItemsSearch = searchProvider?.searchModels!.artist!.items!.where((element) => element.type == 'artists').toList();
    // .artists!.items!.where((element) => element.type == 'artist').toList();
    //print(itemsSearch = searchProvider?.searchModels!.album!.items!.where((element) => element.type == "artists").toList());
    // print(artistItemsSearch![0].name);
    // setState(() {
    //   // searchItemsList = items.where((element) => element.toLowerCase().contains(value.toLowerCase())).toList();
    //   // items = searchItemsList.where((element) => element.)
    // });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SingleChildScrollView(
        child: FadeInRight(
          child: SafeArea(
            child: Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.h,),
                  Row(
                    children: [
                      SizedBox(width: 2.h,),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(width: 5.h,height: 5.h,decoration: const BoxDecoration(color: Colors.red,shape: BoxShape.circle),child: const Center(child: Icon(Icons.chevron_left,color: Colors.white,size: 30,)),)),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Consumer(
                    builder: (BuildContext context, SearchProvider subValue, Widget? child) { 
                      return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        //controller: _controller,
                        onChanged: (value) {
                          if(value.isEmpty){
                            subValue.getQuery(query: 'Yasin');
                          }
                          else{
                            subValue.getQuery(query: value);
                          }
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
                    );
                     },
                    
                  ),
                  SizedBox(height: 3.h),
                  Container(
                      width: 100.w,
                      height: 85.h,
                      //decoration: BoxDecoration(color: Colors.red),
                      child: Consumer(
                          builder: ((context, SearchProvider value, child) {
                        return Column(
                          children: [
                            const Text("Tracks", style: TextStyle(fontSize: 16,color: Colors.grey),),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: 4,
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
                                    '${value.searchModels?.tracks?.items?[index].name}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  leading: CircleAvatar(
                                      radius: 35,
                                      backgroundImage: NetworkImage(
                                          '${value.searchModels?.tracks?.items?[index].album?.images?[0].url}')),
      
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
                          
                            const Text("Albums", style: TextStyle(fontSize: 16,color: Colors.grey),),
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 4,
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
                                    '${value.searchModels?.tracks?.items?[index].name}',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  leading: CircleAvatar(
                                      radius: 35,
                                      backgroundImage: NetworkImage(
                                          '${value.searchModels?.tracks?.items?[index].album?.images?[0].url}')),
      
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
                          ],
                        );
                      }))),
                ]),
          ),
        ),
      ),
    );
  }
}
