// To parse this JSON data, do
//
//     final topappmodel = topappmodelFromJson(jsonString);

import 'dart:convert';

List<Topappmodel> topappmodelFromJson(String str) => List<Topappmodel>.from(json.decode(str).map((x) => Topappmodel.fromJson(x)));

String topappmodelToJson(List<Topappmodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Topappmodel {
    String appId;
    String appName;
    String category;
    String rating;
    String fileSize;
    String iconUrl;
    String appLink;

    Topappmodel({
        required this.appId,
        required this.appName,
        required this.category,
        required this.rating,
        required this.fileSize,
        required this.iconUrl,
        required this.appLink,
    });

    factory Topappmodel.fromJson(Map<String, dynamic> json) => Topappmodel(
        appId: json["app_id"],
        appName: json["app_name"],
        category: json["category"],
        rating: json["rating"],
        fileSize: json["file_size"],
        iconUrl: json["icon_url"],
        appLink: json["appLink"],
    );

    Map<String, dynamic> toJson() => {
        "app_id": appId,
        "app_name": appName,
        "category": category,
        "rating": rating,
        "file_size": fileSize,
        "icon_url": iconUrl,
        "appLink": appLink,
    };
}
