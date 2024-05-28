import 'dart:convert';
import 'dart:io';
import 'package:animated_login/components/myloading.dart';
import 'package:animated_login/components/topappModel.dart';
import 'package:animated_login/pages/download_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:animated_login/components/myurl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_app_installer/flutter_app_installer.dart';

class SecendTab extends StatefulWidget {
  final int pageIndex;

  const SecendTab({super.key, required this.pageIndex});

  @override
  State<SecendTab> createState() => _SecendTabState();
}

class _SecendTabState extends State<SecendTab> {
  final FlutterAppInstaller flutterAppInstaller = FlutterAppInstaller();
  Myurl ob = Myurl();
  List<Topappmodel> responseData= [];
  String filePath = "";
  int appSize = 100;
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
      return FutureBuilder(
        future: getData(widget.pageIndex == 0
                        ? 'app'
                        : widget.pageIndex == 1
                            ? 'game'
                            : ""),
        builder: (context, snapShort) {
          if (snapShort.hasData) {

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: snapShort.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                     DownloadPage(appId: snapShort.data![index].appId,)),
                          );
                        },
                        child: ListTile(
minVerticalPadding: 20,
                            leading: SizedBox(
                              height: 60,
                              width: 130,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    (index+1).toString(),
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image(
                                      image: NetworkImage(
                                             Myurl.mainurl+"${Myurl.app_icons}${snapShort.data![index].iconUrl}"),fit: BoxFit.cover,),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text("${snapShort.data![index].rating} ",style: TextStyle(fontSize: 12),),
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
                                  Text('${snapShort.data![index].rating} MB',style: TextStyle(fontSize: 12),),
                                ],
                              ),
                            ),
                            title: Text(snapShort.data![index].appName),
                           
                            ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
             return Loading();
          }
        });
  }

  Future<List<Topappmodel>> getData(String category) async {
    Map data = {
      "category": category,
    };
    final responce = await http.post(Uri.parse("${Myurl.fullurl}topapp.php") ,body: data,);

    if (responce.statusCode == 200) {
      responseData= [];
      var data = jsonDecode(responce.body);

for (Map<String, dynamic> index in data) {
        
        responseData.add(
           Topappmodel.fromJson(index),
        );
      }
      print(responseData);
      return responseData;
    }
    return [];
  }

  Future<void> downloadFile(String appLink) async {
    try {
      // Get temporary directory path
      Directory tempDir = await getTemporaryDirectory();

      // Create file path
      String filePath = '${tempDir.path}/abc.apk';

      // Make HTTP GET request to download the file
      http.Response response = await http.get(Uri.parse(appLink));

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Write file to temporary directory
        File file = File(filePath);
        await file.writeAsBytes(response.bodyBytes);

        // Check if the file exists after download
        if (await file.exists()) {
          print('File downloaded to: $filePath');

          // Perform other initialization tasks
          initPlatformState();
          initVersion();

          initIsSystemApplication();

          initTestApkFile(filePath)
              .whenComplete(() => startInstallTestApkNormal());
             
        } else {
          print('Error: File does not exist after download.');
        }
      } else {
        print('Error: Failed to download file. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error downloading file: $e');
    }
  }

  String _platformVersion = 'Unknown';
  String _versionName = 'Unknown';
  int _versionCode = 0;
  bool _isSystemApplication = false;

  late File _testInstallApk;

  Future<void> initPlatformState() async {
    String platformVersion;

    try {
      platformVersion = await flutterAppInstaller.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> initVersion() async {
    String? versionName = await flutterAppInstaller.versionName;
    int? versionCode = await flutterAppInstaller.versionCode;

    setState(() {
      _versionName = versionName ?? "Unknown Version Name";
      _versionCode = versionCode ?? 0;
    });
  }

  Future<void> initIsSystemApplication() async {
    bool isSystemApplication = await flutterAppInstaller.isSystemApplication;
    setState(() {
      _isSystemApplication = isSystemApplication;
    });
  }

  Future<void> initTestApkFile(String filePath) async {
    const filename = 'abc.apk';
    var bytes = await File(filePath).readAsBytes();
    String path =
        "${(await getExternalStorageDirectory())!.uri.toFilePath()}$filename";

    final buffer = bytes.buffer;
    _testInstallApk = await File(path).writeAsBytes(
      buffer.asUint8List(
        bytes.offsetInBytes,
        bytes.lengthInBytes,
      ),
    );
    // PackageInstaller.installApk(testInstallApk.path);
  }

  void startInstallTestApkNormal() {
    flutterAppInstaller.installApk(
      filePath: _testInstallApk.path,
    );
  }
}
