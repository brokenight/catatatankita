import 'package:catatankita/screens/catatan_screen.dart';
import 'package:catatankita/screens/edit_catatan_screen.dart';
import 'package:catatankita/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
class TentangScreen extends StatefulWidget {
  @override
  _TentangScreenState createState() => _TentangScreenState();
}

class _TentangScreenState extends State<TentangScreen> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  Widget _infoTile(String title, String subtitle) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle.isNotEmpty ? subtitle : 'Not set'),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text('Setting'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Get.to(EditCatatanScreen());
            },
          ),
          body: Container(
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _infoTile('App name', _packageInfo.appName),
                    _infoTile('Package name', _packageInfo.packageName),
                    _infoTile('App version', _packageInfo.version),
                    _infoTile('Build number', _packageInfo.buildNumber),
                  ],
                ),
            ),
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Catatan Kita', style: TextStyle(color: Colors.white),),
                ),
                ListTile(
                  title: const Text('Daftar Catatan'),
                  onTap: () {
                    Get.to(() => CatatanScreen());
                  },
                ),
                ListTile(
                  title: const Text('Kontak'),
                  onTap: () {
                    Get.to(() => SettingScreen());
                  },
                ),ListTile(
                  title: const Text('Tentang'),
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}