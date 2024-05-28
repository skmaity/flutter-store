import 'dart:convert';
import 'package:animated_login/components/myloading.dart';
import 'package:animated_login/pages/about_page.dart';
import 'package:animated_login/pages/datasafty.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:animated_login/components/appdetailsmodel.dart';
import 'package:animated_login/components/myurl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:installed_apps/installed_apps.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_app_installer/flutter_app_installer.dart';

class DownloadPage extends StatefulWidget {
  final String appId;
  const DownloadPage({super.key, required this.appId});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  final FlutterAppInstaller flutterAppInstaller = FlutterAppInstaller();
  List<Appdetails> responseData = [];
  String status = "Not Downloaded";
  double? progress;

  Future<bool> _isAppInstalled(String package_name) async {
    bool appIsInstalled =
        await InstalledApps.isAppInstalled(package_name) ?? false;
    return appIsInstalled;
  }

  Future<bool> _unInstallApp(String package_name) async {
    bool uninstallIsSuccessful =
        await InstalledApps.uninstallApp(package_name) ?? false;
    print(uninstallIsSuccessful);
    return uninstallIsSuccessful;
  }
  showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(message),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FutureBuilder(
          builder: (context, snapShort) {
            if (snapShort.hasData) {
             
              return Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 30),
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: NetworkImage(Myurl.mainurl +
                                '${Myurl.app_icons}${snapShort.data![0].iconUrl}'),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              snapShort.data![0].appName,
                              style: const TextStyle(fontSize: 25),
                            ),
                            Text(
                              snapShort.data![0].developer,
                              style: const TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 20,)
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(snapShort.data![0].rating),
                      const SizedBox(
                        width: 2,
                      ),
                      const Icon(Icons.star_outlined, size: 12),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 1,
                        height: 20,
                        color: Colors.blueGrey[200],
                      ),
                      Text('${snapShort.data![0].fileSize} MB'),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 1,
                        height: 20,
                        color: Colors.blueGrey[200],
                      ),
                      Column(
                        children: [
                          Text(snapShort.data![0].downloads),
                          const Text('Downloads'),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        width: 1,
                        height: 20,
                        color: Colors.blueGrey[200],
                      ),
                      Column(
                        children: [
                          const Text('Rated for'),
                          Text(snapShort.data![0].contentRating),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      _downloadButtonPressed(snapShort.data![0].appLink);
                    },
                    child: Row(
                      children: [
                        FutureBuilder(
                            future: _isAppInstalled(
                                snapShort.data![0].package_name),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Expanded(
                                  child: Center(
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 20),
                                        progress == null
                                            ? snapshot.data == true
                                                ? Expanded(
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                              onTap: () {
                                                                InstalledApps.startApp(
                                                                    snapShort
                                                                        .data![
                                                                            0]
                                                                        .package_name);
                                                              },
                                                              child:Container(
        decoration: const BoxDecoration(
       border: Border.fromBorderSide(BorderSide()),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        height: 50,
        child: const Center(
          child: Text(
            'Open',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      ),
                                                                ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                              onTap: () {
                                                                _unInstallApp(
                                                                    snapShort
                                                                        .data![
                                                                            0]
                                                                        .package_name);
                                                              },
                                                              child:
                                                                  b.shimmer()),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Expanded(child: a.shimmer())
                                            : Expanded(
                                                child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      LinearProgressIndicator(
                                                        backgroundColor:
                                                            Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        minHeight: 50,
                                                        color: Colors.blue,
                                                        value: progress,
                                                      ),
                                                      Text(status,
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: progress! >
                                                                      0.55
                                                                  ? Colors.white
                                                                  : Colors
                                                                      .black))
                                                    ]),
                                              ),
                                        const SizedBox(width: 20),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            })
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  snapShort.data![0].screenshots.isEmpty
                      ? SizedBox(
                          height: 200,
                          child: Row(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      snapShort.data![0].screenshots.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      height: 100,
                                      width: 90,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(snapShort
                                                  .data![0].screenshots[index]),
                                              fit: BoxFit.cover)),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        )
                      : const SizedBox(
                          height: 200,
                          child: Center(
                              child: Text(
                            'No Screenshots Found',
                            style: TextStyle(fontSize: 20),
                          )),
                        ),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: (){
                       Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                AbouPage(appData: snapShort.data),
                          ));
                    },
                    child: SizedBox(
                      height: 40,
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                      
                             
                            
                           const Text('About this app',style: TextStyle(color: Colors.blue),),
                          
                          const Expanded(child: SizedBox()),
                          const Icon(Icons.arrow_forward_rounded),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 32),
                        Expanded(child: Text(snapShort.data![0].description)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DataSafty(),
                          ));
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          const Text('Data safety',style: TextStyle(color: Colors.blue),),
                          
                          const Expanded(child: SizedBox()),
                          const Icon(Icons.arrow_forward_rounded),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
showMessage('Ratings and reviews are not available yet, but stay tuned for future updates!');
                    },
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          Text('Ratings and reviews',style: TextStyle(color: Colors.blue),),
                          
                          const Expanded(child: SizedBox()),
                          const Icon(Icons.arrow_forward_rounded),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Loading();
            }
          },
          future: appdetails(widget.appId),
        ),
      ),
    );
  }
  

  Future<List<Appdetails>> appdetails(String appId) async {
    Map data = {
      "app_id": appId,
    };
    var responce = await http.post(Uri.parse("${Myurl.fullurl}appdetails.php"),
        body: data);

    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);

      for (Map<String, dynamic> index in data) {
        responseData.add(
          Appdetails.fromJson(index),
        );
      }
      return responseData;
    }
    return responseData;
  }

  Animate get a => box
      .animate(onPlay: (controller) => controller.repeat())
      .effect(duration: 3000.ms) // this "pads out" the total duration
      .effect(delay: 750.ms, duration: 1500.ms); // set defaults
  Animate get b => Ubox.animate(onPlay: (controller) => controller.repeat())
      .effect(duration: 3000.ms) // this "pads out" the total duration
      .effect(delay: 750.ms, duration: 1500.ms); // set defaults

  // simple square box with a gradient to use as the target for animations.
  Widget get box => Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        height: 50,
        child: const Center(
          child: Text(
            'install',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );
  Widget get Ubox => Container(
        decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        height: 50,
        child: const Center(
          child: Text(
            'Uninstall',
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
      );

  void _downloadButtonPressed(String url) async {
    try {
      setState(() {
        progress = null;
      });

      final request = Request('GET', Uri.parse(url));
      final StreamedResponse response = await Client().send(request);
      final contentLength = response.contentLength;

      setState(() {
        progress = 0.000001;
        status = "Download Started";
      });

      List<int> bytes = [];
      final file = await _getFile('app.apk');

      response.stream.listen(
        (List<int> newBytes) {
          bytes.addAll(newBytes);
          final downloadedLength = bytes.length;
          setState(() {
            progress = downloadedLength.toDouble() / (contentLength ?? 1);
            status = "${((progress ?? 0) * 100).toStringAsFixed(0)} %";
          });
        },
        onDone: () async {
          try {
            await file.writeAsBytes(bytes);
            setState(() {
              progress = 1;
              status = "Download Finished";
            });

            if (await file.exists()) {
              print('File downloaded to: $file');

              initPlatformState();
              initVersion();
              initIsSystemApplication();
              await initTestApkFile(file.path)
                  .whenComplete(() => startInstallTestApkNormal());
            } else {
              print('Error: File does not exist after download.');
            }
          } catch (e) {
            print('Error during file handling or initialization: $e');
          }
        },
        onError: (e) {
          debugPrint('Download error: $e');
          setState(() {
            status = "Download Failed";
          });
        },
        cancelOnError: true,
      );
    } catch (e) {
      debugPrint('Error initiating download: $e');
      showMessage("Hello! 🌟 Our app is currently in a testing phase and isn't available for download at the moment. We appreciate your patience and can't wait to share it with you soon! Thank you for your understanding! 😊");
      setState(() {
        status = "Download Failed";
      });
    }
  }

  /// Finds an appropriate place on the user’s device to put the file.
  /// In this case we are choosing to use the temp directory.
  /// You could also chose the documents directory or somewhere else.
  /// This method is using the path_provider package to get that location.
  Future<File> _getFile(String filename) async {
    final dir = await getTemporaryDirectory();
    // final dir = await getApplicationDocumentsDirectory();
    return File("${dir.path}/$filename");
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
  }

  void startInstallTestApkNormal() {
    flutterAppInstaller.installApk(
      filePath: _testInstallApk.path,
    );
  }
}
