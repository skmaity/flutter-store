import 'dart:convert';

import 'package:animated_login/components/applist_model.dart';
import 'package:animated_login/components/myurl.dart';
import 'package:animated_login/components/search_model.dart';
import 'package:animated_login/pages/download_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class CustomSearchDelegate extends SearchDelegate {
  // Assume this function fetches data from your database asynchronously
  // Future<List<String>> fetchDataFromDatabase(String query) async {
  //   // Simulate fetching data from a database
  //   await Future.delayed(const Duration(seconds: 1)); // Simulating delay
  //   // Return some dummy data
  //   return ['apple', 'banana', 'cherry', 'guava', 'grapes']
  //       .where((fruit) => fruit.toLowerCase().contains(query.toLowerCase()))
  //       .toList();
  // }

  // List suggestedappslist=[];

Future<List<Searchlist>> searchapps(String app) async {
  Map<String, String> data = {
    "app": app,
  };
  List<Searchlist> search = [];

  try {
    var response = await http.post(
      Uri.parse("${Myurl.fullurl}searchapps.php"),
      body: data,
    );

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      for (Map<String, dynamic> item in jsonData) {
        search.add(Searchlist.fromJson(item));
      }
      return search;
    } else {
      // Handle non-200 status codes here if needed
      print('Failed to load data: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    // Handle any errors that occur during the request or parsing
    print('An error occurred: $e');
    return [];
  }
}


  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear_rounded),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // In buildResults, you can directly call fetchDataFromDatabase
    return FutureBuilder(
      future: searchapps(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              var result = snapshot.data![index].appName;
              return ListTile(
                title: Text(result),
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // In buildSuggestions, you can directly call fetchDataFromDatabase
    return FutureBuilder(
      future: searchapps(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
                           var result = snapshot.data![index].appName;

              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DownloadPage(appId: snapshot.data![index].appId),
                  ));
                },
                child: ListTile(
                  title: Text(result),
                ),
              );
            },
          );
        }
      },
    );
  }
}
