import 'package:animated_login/components/applist_model.dart';
import 'package:animated_login/components/myurl.dart';
import 'package:animated_login/pages/download_page.dart';
import 'package:flutter/material.dart';

class AppList extends StatelessWidget {

  final AsyncSnapshot<List<Applistmodel>> snapShot;
  final String header;
final int listSize;
final int nextVal;
  final Function()? onTapArow;
  const AppList(
      {super.key,
      required this.header,
      required this.onTapArow,
      required this.listSize,
      required this.snapShot,
      required this.nextVal});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 30,
            ),
            Expanded(child: Text(header)),
            IconButton(
                onPressed: onTapArow,
                icon: const Icon(Icons.arrow_forward_rounded)),
            const SizedBox(
              width: 30,
            ),
          ],
        ),
        SizedBox(
          height: 170,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listSize,
            itemBuilder: (context,index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => DownloadPage(appId: snapShot.data![index+nextVal].appId),));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15.0),
                            child: Image(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                Myurl.mainurl+"${Myurl.app_icons}${snapShot.data![index+nextVal].iconUrl}",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            height: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                        
                              children: [
                                Text(snapShot.data![index+nextVal].appName,maxLines: 2,),
                                const SizedBox(height: 2,),
                                Text(snapShot.data![index+nextVal].rating),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
