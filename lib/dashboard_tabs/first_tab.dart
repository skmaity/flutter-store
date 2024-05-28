import 'dart:convert';
import 'package:animated_login/components/applist_model.dart';
import 'package:animated_login/components/applist_page.dart';
import 'package:animated_login/components/app_listview.dart';
import 'package:animated_login/components/myloading.dart';
import 'package:animated_login/components/myurl.dart';
import 'package:animated_login/components/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class FirstTab extends StatefulWidget {
  final int pageIndex;
  const FirstTab({super.key, required this.pageIndex});

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  List images = [];
  List<dynamic> posts = [];
  List<Applistmodel> suggestedappslist = [];
  List<Applistmodel> recommendedappslist = [];
  List<Applistmodel> allappslist = [];

  var controller = Get.put(Navigation());
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
                                  autoPlay: true,
                                ),
                                itemCount: images.length,
                                itemBuilder: (BuildContext context, int index,
                                        int pageViewIndex) =>
                                    GestureDetector(
                                  onTap: () {
                                    print(pageViewIndex);
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(Myurl.mainurl +
                                            "${Myurl.post_img}${images[index]}"),
                                        fit: BoxFit.cover,
                                      ),
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
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                               Applistpage(
title:'Suggested For You' ,
snapShot: snapshot,
                                              )));
                                },
                              ),
                              AppList(
                                nextVal: _listSize,
                                listSize: _listSize,
                                snapShot: snapshot,
                                header: 'Recommended For You',
                                onTapArow: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Applistpage(
title:'Recommended For You' ,

snapShot: snapshot,

                                              )));
                                },
                              ),
                            ],
                          );
                        } else {
                          return SizedBox();
                        }
                      },
                    ),
                    FutureBuilder(
                      future: allAppsNotInSuggested(widget.pageIndex == 0
                          ? 'app'
                          : widget.pageIndex == 1
                              ? 'game'
                              : ""),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Widget> appLists = [];
                          int totalApps = snapshot.data!.length;
                          int numLists = (totalApps / _listSize).ceil();

                          for (int i = 0; i < numLists; i++) {
                            int start = i * _listSize;
                            int end = start + _listSize;
                            if (end > totalApps) end = totalApps;

                            appLists.add(AppList(
                              listSize: end - start,
                              nextVal: 0,
                              snapShot: AsyncSnapshot.withData(ConnectionState.done, snapshot.data!.sublist(start, end)),
                              header: '',
                              onTapArow: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>  Applistpage(
                                      title: "",
snapShot: snapshot,

                                    )));
                              },
                            ));
                          }
                          return Column(children: appLists);
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
    var response = await http.post(
      Uri.parse("${Myurl.fullurl}suggestedapps.php"),
      body: data,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> index in data) {
        suggestedappslist.add(
          Applistmodel.fromJson(index),
        );
      }
      return suggestedappslist;
    }
    return suggestedappslist;
  }

  Future<List<Applistmodel>> allApps(String category) async {
    Map data = {
      "category": category,
    };
    allappslist = [];
    var response = await http.post(
      Uri.parse("${Myurl.fullurl}allapp.php"),
      body: data,
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      for (Map<String, dynamic> index in data) {
        allappslist.add(
          Applistmodel.fromJson(index),
        );
      }
      return allappslist;
    }
    return allappslist;
  }

  Future<List<Applistmodel>> allAppsNotInSuggested(String category) async {
    await suggestedApps(category);
    await allApps(category);

    // Create a set of IDs from the suggested apps for quick lookup
    Set<String> suggestedAppIds =
        suggestedappslist.map((app) => app.appId).toSet();

    // Filter all apps to exclude those that are in the suggested apps
    List<Applistmodel> filteredAllApps = allappslist
        .where((app) => !suggestedAppIds.contains(app.appId))
        .toList();

    return filteredAllApps;
  }

  Future<List> fetchPosts(String rowid, String category) async {
    Map data = {
      "rowid": rowid,
      "category": category,
    };
    var response = await http.post(
      Uri.parse("${Myurl.fullurl}posts.php"),
      body: data,
    );
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      images = jsondata['post'];
      return images;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
