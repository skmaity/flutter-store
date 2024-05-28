import 'dart:convert';
import 'package:animated_login/components/appdetailsmodel.dart';
import 'package:animated_login/components/myloading.dart';
import 'package:animated_login/components/myurl.dart';
import 'package:animated_login/components/navigation_controller.dart';
import 'package:animated_login/pages/download_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryPage extends StatefulWidget {
  final String page;
  CategoryPage({super.key, required this.page});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<Appdetails> categoryapps = [];

  final controller = Get.put(Navigation());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.page)),
      body: Column(
        children: [
          FutureBuilder(
            future: category(
              widget.page,
              controller.currentIndex == 0
                ? 'app'
                : controller.currentIndex == 1
                  ? 'game'
                  : ""
            ),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DownloadPage(
                                appId: snapshot.data![index].appId,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          minVerticalPadding: 20,
                          leading: SizedBox(
                            height: 60,
                            width: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(fontSize: 15),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    Myurl.mainurl + "${Myurl.app_icons}${snapshot.data![index].iconUrl}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "${snapshot.data![index].rating} ",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const Icon(
                                      Icons.star_rate,
                                      size: 10,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Container(
                                  height: 15,
                                  width: 1,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  '${snapshot.data![index].rating} MB',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          title: Text(snapshot.data![index].appName),
                          trailing: SizedBox(
                            height: 60,
                            width: 50,
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: IconButton(
                                    onPressed: () {
                                      // downloadFile(snapshot.data![index].appLink);
                                    },
                                    icon: const Center(
                                      child: Icon(Icons.file_download_outlined),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                return Center(child: Loading());
              }
            }
          ),
        ],
      ),
    );
  }

  Future<List<Appdetails>> category(String tag, String category) async {
    Map<String, String> data = {
      "tag": tag,
      "category": category,
    };
    print(tag);
    print(category);

    categoryapps = [];

    try {
      var response = await http.post(
        Uri.parse("${Myurl.fullurl}categories.php"),
        body: data,
      );

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        for (Map<String, dynamic> item in jsonData) {
          categoryapps.add(Appdetails.fromJson(item));
        }
        return categoryapps;
      } else {
        print('Failed to load data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('An error occurred: $e');
      return [];
    }
  }
}
