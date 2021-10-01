import 'package:catatankita/controller/catatan_controller.dart';
import 'package:catatankita/model/catatan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditCatatanScreen extends StatelessWidget {
  final int? index;
  EditCatatanScreen({this.index});
  @override
  Widget build(BuildContext context) {
    final CatatanController nc = Get.find();
    String title = index != null ? (nc.notes[index ?? 0].title ?? '') : '';
    String content = index != null ? (nc.notes[index ?? 0].content ?? '') : '';
    String createdAt = index != null ? ('Diperbarui pada ${nc.notes[index ?? 0].createdAt ?? ''}') : '';
    final _formKey = GlobalKey<FormState>();
    final titleEditingController = new TextEditingController(text: title);
    final contentEditingController = new TextEditingController(text: content);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: index == null ? Text('Catatan baru ') : Text('Perbarui catatan'),
            ),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(createdAt,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Judul Catatan tidak boleh kosong.';
                            }
                            return null;
                          },
                          controller: titleEditingController,
                          autofocus: true,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            hintText: 'Judul Catatan',
                            labelText: ' Judul',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Isi Catatan tidak boleh kosong.';
                            }
                            return null;
                          },
                          controller: contentEditingController,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            hintText: 'Isi Catatan',
                            labelText: ' Konten',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black12),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.text,
                          maxLines: 5,
                        ),
                      ),
                      FloatingActionButton(
                        child: Icon(index == null ? Icons.add : Icons.update),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if (index == null){
                              nc.notes.add(Catatan(title: titleEditingController.text, content: contentEditingController.text));
                            }
                            else{
                              var updatenote=nc.notes[index ?? 0];
                              updatenote.title=titleEditingController.text;
                              updatenote.content=contentEditingController.text;
                              nc.notes[index ?? 0]=updatenote;
                            }

                            Get.back();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
        )
    );
  }
}