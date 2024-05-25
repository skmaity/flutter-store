// To parse this JSON data, do
//
//     final searchlist = searchlistFromJson(jsonString);

import 'dart:convert';

List<Searchlist> searchlistFromJson(String str) => List<Searchlist>.from(json.decode(str).map((x) => Searchlist.fromJson(x)));

String searchlistToJson(List<Searchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Searchlist {
    String appId;
    String appName;

    Searchlist({
        required this.appId,
        required this.appName,
    });

    factory Searchlist.fromJson(Map<String, dynamic> json) => Searchlist(
        appId: json["app_id"],
        appName: json["app_name"],
    );

    Map<String, dynamic> toJson() => {
        "app_id": appId,
        "app_name": appName,
    };
}
