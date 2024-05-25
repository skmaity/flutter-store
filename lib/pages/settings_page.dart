// import 'package:animated_login/components/app_listview.dart';
import 'package:animated_login/components/myloading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:animated_login/pages/appinfo_page.dart';
import 'package:installed_apps/app_info.dart';
import 'package:animated_login/components/non_system_app_model.dart';
import 'package:installed_apps/installed_apps.dart';  

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<String> _apps = [];

  void signUserOut() async {
    FirebaseAuth.instance.signOut();
  }
  @override
  void initState() {
        _fetchApps();
    super.initState();
  }
    void _fetchApps() async {
    List<String> apps = await NonSystemAppList.getNonSystemApps();
    setState(() {
      _apps = apps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      child: FutureBuilder<List<AppInfo>>(
        future: InstalledApps.getInstalledApps(true, true),
        builder: (
          BuildContext buildContext,
          AsyncSnapshot<List<AppInfo>> snapshot,
        ) {
          return snapshot.connectionState == ConnectionState.done
              ?snapshot.hasData
                 ? _buildListView(snapshot.requireData)
                  : _buildError()
              : _buildProgressIndicator();
        },
      ),
    );
  }
Widget _buildListView(List<AppInfo> apps) {
  return ListView.builder(
    itemCount: apps.length,
    itemBuilder: (context, index) {
      AppInfo app = apps[index];

      if (_apps.contains(app.packageName)) {
        return _buildListItem(context, app); // Build list item if app is in _apps list.
      } else {
        return Container(); // Return empty container if app is not in _apps list.
      }
    },
  );
}


Widget _buildListItem(BuildContext context, AppInfo app) {
  return ListTile(
    minVerticalPadding: 20,
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: Image.memory(app.icon!),
      ),
      title: Text(app.name),
      // subtitle: Text(app.getVersionInfo()),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AppInfoScreen(app: app)),
      ),
    );
}


Widget _buildProgressIndicator() {
  return Loading(); // Display a circular progress indicator.
}

Widget _buildError() {
  return const Center(
    child: Text("Error occurred while getting installed apps ...."),
  ); // Display an error message when fetching apps fails.
}
}


// LogOut code dont delete

  // SafeArea(
  //       child: Center(
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Text('logedin as ${user.email}'),
  //             IconButton(
  //                 onPressed: signUserOut, icon: const Icon(Icons.logout_rounded)),
      
  //                 IconButton(onPressed: (){
  //                   Navigator.push(
  //             context,
  //             MaterialPageRoute(builder: (context) => const AppListScreen()),
  //           );
  //                 }, icon: const Icon(Icons.arrow_back_rounded))
  //           ],
  //         ),
  //       ),
  //     ),
