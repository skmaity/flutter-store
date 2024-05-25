import 'package:animated_login/components/appdetailsmodel.dart';
import 'package:flutter/material.dart';

class AbouPage extends StatelessWidget {
  final List<Appdetails>? appData;
  const AbouPage({super.key,required this.appData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(appData![0].contentRating),
          Text(appData![0].releaseDate.toString()),
          Text(appData![0].version),

          Text(appData![0].supportedOs),

          Text(appData![0].permissions),
          Text(appData![0].language),
          Text(appData![0].minSdkVersion),
          Text(appData![0].contentRating),
          Text(appData![0].featured),
          Text(appData![0].category),
          Text(appData![0].developer),



        ],
      ),
    );
  }
}