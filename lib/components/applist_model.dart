// To parse this JSON data, do
//
//     final applistmodel = applistmodelFromJson(jsonString);

import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

List<Applistmodel> applistmodelFromJson(String str) => List<Applistmodel>.from(json.decode(str).map((x) => Applistmodel.fromJson(x)));

String applistmodelToJson(List<Applistmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Applistmodel extends GetxController {
    String appId;
    String appName;
    String rating;
    String iconUrl;

    Applistmodel({
        required this.appId,
        required this.appName,
        required this.rating,
        required this.iconUrl,
    });

    factory Applistmodel.fromJson(Map<String, dynamic> json) => Applistmodel(
        appId: json["app_id"],
        appName: json["app_name"],
        rating: json["rating"],
        iconUrl: json["icon_url"],
    );

    Map<String, dynamic> toJson() => {
        "app_id": appId,
        "app_name": appName,
        "rating": rating,
        "icon_url": iconUrl,
    };
}
