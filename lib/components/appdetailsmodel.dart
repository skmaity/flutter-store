// To parse this JSON data, do
//
//     final appdetails = appdetailsFromJson(jsonString);

import 'dart:convert';

List<Appdetails> appdetailsFromJson(String str) => List<Appdetails>.from(json.decode(str).map((x) => Appdetails.fromJson(x)));

String appdetailsToJson(List<Appdetails> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Appdetails {
    String appId;
    String appName;
    String description;
    String category;
    String developer;
    String rating;
    String downloads;
    DateTime releaseDate;
    String version;
    String supportedOs;
    String fileSize;
    String iconUrl;
    List<String> screenshots;
    String permissions;
    String language;
    String minSdkVersion;
    String contentRating;
    String featured;
    String tags;
    String appLink;
    String package_name;


    Appdetails({
        required this.appId,
        required this.appName,
        required this.description,
        required this.category,
        required this.developer,
        required this.rating,
        required this.downloads,
        required this.releaseDate,
        required this.version,
        required this.supportedOs,
        required this.fileSize,
        required this.iconUrl,
        required this.screenshots,
        required this.permissions,
        required this.language,
        required this.minSdkVersion,
        required this.contentRating,
        required this.featured,
        required this.tags,
        required this.appLink,
        required this.package_name
    });

    factory Appdetails.fromJson(Map<String, dynamic> json) => Appdetails(
        appId: json["app_id"],
        appName: json["app_name"],
        description: json["description"],
        category: json["category"],
        developer: json["developer"],
        rating: json["rating"],
        downloads: json["downloads"],
        releaseDate: DateTime.parse(json["release_date"]),
        version: json["version"],
        supportedOs: json["supported_os"],
        fileSize: json["file_size"],
        iconUrl: json["icon_url"],
        screenshots: List<String>.from(json["screenshots"].map((x) => x)),
        permissions: json["permissions"],
        language: json["language"],
        minSdkVersion: json["min_sdk_version"],
        contentRating: json["content_rating"],
        featured: json["featured"],
        tags: json["tags"],
        appLink: json["appLink"],
        package_name: json["package_name"],

    );

  set downloading(bool downloading) {}

    Map<String, dynamic> toJson() => {
        "app_id": appId,
        "app_name": appName,
        "description": description,
        "category": category,
        "developer": developer,
        "rating": rating,
        "downloads": downloads,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "version": version,
        "supported_os": supportedOs,
        "file_size": fileSize,
        "icon_url": iconUrl,
        "screenshots": List<dynamic>.from(screenshots.map((x) => x)),
        "permissions": permissions,
        "language": language,
        "min_sdk_version": minSdkVersion,
        "content_rating": contentRating,
        "featured": featured,
        "tags": tags,
        "appLink": appLink,
        "package_name": package_name,

    };
}
