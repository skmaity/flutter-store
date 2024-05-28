import 'package:animated_login/components/applist_model.dart';
import 'package:animated_login/components/myurl.dart';
import 'package:animated_login/pages/download_page.dart';
// import 'package:animated_login/components/myloading.dart';
import 'package:flutter/material.dart';

class Applistpage extends StatelessWidget {
  final AsyncSnapshot<List<Applistmodel>> snapShot;
  final String title;

  const Applistpage({super.key, required this.snapShot,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: Text(title),),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: snapShot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DownloadPage(
                                appId: snapShot.data![index].appId,
                              )),
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
                              child: Image(
                                image: NetworkImage(Myurl.mainurl +
                                    "${Myurl.app_icons}${snapShot.data![index].iconUrl}"),
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
                                  "${snapShot.data![index].rating} ",
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
                              '${snapShot.data![index].rating} MB',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      title: Text(snapShot.data![index].appName),
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
                                  // downloadFile(
                                  //     snapShort.data![index].appLink);
                                },
                                icon: const Center(
                                  child: Icon(Icons.file_download_outlined),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
