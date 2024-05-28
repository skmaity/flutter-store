import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class AppInfoScreen extends StatelessWidget {
  final AppInfo app;

  const AppInfoScreen({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: app == null ? _buildAppInfoWithPackageName() : _buildAppInfo(app!),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(title: Text(app == null ? "App Info" : app!.name));
  }

  Widget _buildAppInfoWithPackageName() {
    return FutureBuilder<AppInfo>(
      future: InstalledApps.getAppInfo("com.google.android.gm"),
      builder: (BuildContext buildContext, AsyncSnapshot<AppInfo> snapshot) {
        return snapshot.connectionState == ConnectionState.done
            ? snapshot.hasData && snapshot.data != null
                ? _buildAppInfo(snapshot.data!)
                : _buildError()
            : _buildProgressIndicator();
      },
    );
  }

  Future<bool> _unInstallApp(String package_name) async {
    bool uninstallIsSuccessful =
        await InstalledApps.uninstallApp(package_name) ?? false;
    print(uninstallIsSuccessful);
    return uninstallIsSuccessful;
  }

  Widget _buildProgressIndicator() {
    return const Center(child: Text("Getting app info ...."));
  }

  Widget _buildError() {
    return const Center(child: Text("Error while getting app info ...."));
  }

  Widget _buildAppInfo(AppInfo app) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Center(
            child: Image.memory(
              app.icon!,
              width: 64,
            ),
          ),
        ),
        Center(
          child: Text(
            app.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // ListTile(
        //   title: const Text("Package Name"),
        //   subtitle: Text(app.packageName),
        // ),
        ListTile(
          title: const Text("Version Name"),
          subtitle: Text(app.versionName),
        ),
        // ListTile(
        //   title: const Text("Version Code"),
        //   subtitle: Text(app.versionCode.toString()),
        // ),
        ListTile(
          title: const Text("Built With"),
          subtitle: Text(app.builtWith.toString().split(".").last),
        ),
        // ListTile(
        //   title: const Text("Installed On"),
        //   subtitle: Text(app.installedTimestamp.toString()),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 0.5)),
              child: TextButton(
                  onPressed: () => InstalledApps.startApp(app.packageName),
                  child: Text("Open App")),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 0.5)),
              child: TextButton(
                  onPressed: () => _unInstallApp(app.packageName),
                  child: Text(
                    "Uninstall App",
                  )),
            ),
          ],
        ),
      ],
    );
  }
}
