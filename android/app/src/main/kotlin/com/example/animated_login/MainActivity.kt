package com.example.animated_login


import android.content.pm.ApplicationInfo
import android.content.pm.PackageInfo
import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "app_list"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getNonSystemApps") {
                result.success(getNonSystemApps())
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getNonSystemApps(): List<String> {
        val nonSystemApps = mutableListOf<String>()
        val pm: PackageManager = packageManager
        val packages: List<PackageInfo> = pm.getInstalledPackages(PackageManager.GET_META_DATA)

        for (packageInfo in packages) {
            if ((packageInfo.applicationInfo.flags and ApplicationInfo.FLAG_SYSTEM) == 0) {
                nonSystemApps.add(packageInfo.packageName)
            }
        }
        return nonSystemApps
    }
}
