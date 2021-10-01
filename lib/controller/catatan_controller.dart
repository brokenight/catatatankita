import 'package:catatankita/model/catatan.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CatatanController extends GetxController{
  var notes=<Catatan>[].obs;
  void add(Catatan n) {
    notes.add(n);
  }
  @override
  void onInit() {
    List? storedNotes=GetStorage().read<List>('notes');
    if(storedNotes!.isNotEmpty){
      notes=storedNotes.map((e) => Catatan.fromJson(e)).toList().obs;
    }
    ever(notes, (_){
      GetStorage().write('notes',notes.toList());
    });
    super.onInit();
  }
}