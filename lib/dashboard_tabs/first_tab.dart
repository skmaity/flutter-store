import 'dart:convert';
import 'package:animated_login/components/applist_model.dart';
import 'package:animated_login/components/applist_page.dart';
import 'package:animated_login/components/app_listview.dart';
import 'package:animated_login/components/myloading.dart';
import 'package:animated_login/components/myurl.dart';
import 'package:animated_login/components/navigation_controller.dart';
// import 'package:animated_login/components/slide_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class FirstTab extends StatefulWidget {
  final int pageIndex;
  const FirstTab({super.key, required this.pageIndex});

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
// initial variables
  List images = [];
  List<dynamic> posts = [];
  List<Applistmodel> suggestedappslist = [];
  List<Applistmodel> recommendedappslist = [];

  var controller = Get.put(Navigation());
  List<List> titles = [
    ["Suggested For You", '1'],
    ["Recomended For You", '2'],
  ];
  int _listSize = 5;

  @override
  Widget build(BuildContext context) {
    return widget.pageIndex != 2
        ? Column(
            children: [
              
              Expanded(
                child: ListView(
                  children: [
                    Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FutureBuilder(
                    future: fetchPosts(
                        '1',
                        widget.pageIndex == 0
                            ? 'app'
                            : widget.pageIndex == 1
                                ? 'game'
                                : ""),
                    builder: (context, snapShort) {
                      if (snapShort.hasData) {
                        return CarouselSlider.builder(
            options: CarouselOptions(
              enableInfiniteScroll: false,
              autoPlay: true,),
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index,
                    int pageViewIndex) =>
                GestureDetector(
                  onTap: (){
                    print(pageViewIndex);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(image: NetworkImage( Myurl.mainurl+"${Myurl.post_img}${images[index]}"),fit: BoxFit.cover,)
                    ),
                      ),
                ),
          );
                      } else {
                        return Loading();
                      }
                    }),
              ),
                FutureBuilder(
                    future: suggestedApps(widget.pageIndex == 0
                        ? 'app'
                        : widget.pageIndex == 1
                            ? 'game'
                            : ""),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            AppList(
                              listSize: _listSize,
                              nextVal: 0,
                              snapShot: snapshot,
                              header: 'Suggested For You',
                              onTapArow: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const Applistpage()));
                              },
                            ),
                            AppList(
                          nextVal: _listSize,
                          listSize: _listSize,
                          snapShot: snapshot,
                          header: 'Recommended For You',
                          onTapArow: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Applistpage()));
                          },
                        ),
                          ],
                        );
                      } else {
                        return SizedBox();
                      }
                    },
                  ),
                 
                  
                  ],
                 
                ),
              )
            ],
          )
        : const SizedBox();
  }

  Future<List<Applistmodel>> suggestedApps(String category) async {
    Map data = {
      "category": category,
    };
    suggestedappslist = [];
    var responce = await http.post(
      Uri.parse("${Myurl.fullurl}suggestedapps.php"),
      body: data,
    );
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      for (Map<String, dynamic> index in data) {
        suggestedappslist.add(
          Applistmodel.fromJson(index),
        );
      }
      return suggestedappslist;
    }
    return suggestedappslist;
  }
    Future<List<Applistmodel>> RecommendedApps(String category) async {
    Map data = {
      "category": category,
    };
    recommendedappslist = [];
    var responce = await http.post(
      Uri.parse("${Myurl.fullurl}recommendedapps.php"),
      body: data,
    );
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      for (Map<String, dynamic> index in data) {
        recommendedappslist.add(
          Applistmodel.fromJson(index),
        );
      }
      return recommendedappslist;
    }
    return recommendedappslist;
  }

  Future<List> fetchPosts(String rowid, String category) async {
    Map data = {
      "rowid": rowid,
      "category": category,
    };
    var responce = await http.post(
      Uri.parse("${Myurl.fullurl}posts.php"),
      body: data,
    );
    if (responce.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      var jsondata = jsonDecode(responce.body);
      images = jsondata['post'];
      return images;
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception('Failed to load posts');
    }
  }
}
