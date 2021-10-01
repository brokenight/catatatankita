import 'package:catatankita/controller/catatan_controller.dart';
import 'package:catatankita/screens/edit_catatan_screen.dart';
import 'package:catatankita/screens/setting_screen.dart';
import 'package:catatankita/screens/tentang_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CatatanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CatatanController nc = Get.put(CatatanController());
    Widget getNoteList(){
      return Obx( () =>  nc.notes.length == 0 ?
      Center(child: Text('Tidak ada catatan')) :
        GridView.builder(
            itemCount: nc.notes.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.72,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index)=>
                InkWell(
                  onTap: () {
                    Get.to(EditCatatanScreen(index: index));
                  },
                  onLongPress: () {
                    Get.defaultDialog(
                        title: 'Hapus Catatan',
                        middleText: nc.notes[index].title ?? '',
                        onCancel: () => Get.back(),
                        confirmTextColor: Colors.white,
                        onConfirm: () {
                          nc.notes.removeAt(index);
                          Get.back();
                        });
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(nc.notes[index].title ?? '',
                            style: TextStyle(fontSize: 16),
                          ),
                          SizedBox(height: 15),
                          Text(nc.notes[index].content ?? '',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
        ),
      );
    }
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              title: Text('Catatan Kita'),
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
                  child:getNoteList()),
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
                      Get.back();
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