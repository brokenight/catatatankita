import 'package:catatankita/screens/catatan_screen.dart';
import 'package:catatankita/screens/edit_catatan_screen.dart';
import 'package:catatankita/screens/tentang_screen.dart';
import 'package:catatankita/view_model/setting_view_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends SettingViewModel {
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
                child:isLoading ? Center(child: CircularProgressIndicator()) :
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontSize: 16, ),
                                text:
                                'Link APK : '),
                            TextSpan(
                              style: TextStyle(color: Colors.blue, fontSize: 18),
                              text: linkApk,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchURL(linkApk ?? '');
                                },
                            ),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                style: TextStyle(color: Colors.black, fontSize: 16, ),
                                text:
                                'Link Git : '),
                            TextSpan(
                              style: TextStyle(color: Colors.blue, fontSize: 18),
                              text: linkGit,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchURL(linkGit ?? '');
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                    Get.back();
                  },
                ),ListTile(
                  title: const Text('Tentang'),
                  onTap: () {
                    Get.to(() => TentangScreen());
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}