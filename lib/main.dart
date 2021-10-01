import 'package:catatankita/screens/catatan_screen.dart';
// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'bloc/note_bloc.dart';
// import 'bloc/note_event.dart';
// import 'models/note_model.dart';
// import 'note_database/note_database.dart';
// import 'screens/notes_screen.dart';
// import 'package:catatankita/bloc/theme_provider.dart';
// import 'package:path_provider/path_provider.dart' as pathProvider;
// import 'package:provider/provider.dart';

// void main() async {
//   await Hive.initFlutter();
//   Hive.registerAdapter<Note>(NoteAdapter());
//   await Hive.openBox<Note>("Note");
//
//   runApp(BlocProvider(
//     create: (context) => NoteBloc(NoteDatabase()),
//     child: MyApp(),
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     BlocProvider.of<NoteBloc>(context).add(NoteInitialEvent());
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData.from(colorScheme: ColorScheme.light()),
//       themeMode: ThemeMode.light,
//       // darkTheme: ThemeData.from(colorScheme: ColorScheme.dark()),
//       home: NotesScreen(),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class Controller extends GetxController {
  final box = GetStorage();
  bool get isDark => box.read('darkmode') ?? false;
  ThemeData get theme => isDark ? ThemeData.dark() : ThemeData.light();
  void changeTheme(bool val) => box.write('darkmode', val);
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       home: CatatanScreen(),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return SimpleBuilder(builder: (_) {
      return GetMaterialApp(
        theme: controller.theme,
        home: CatatanScreen(),
        // home: Scaffold(
        //   appBar: AppBar(title: Text("Catatan Kita")),
        //   body: Center(
        //     child: SwitchListTile(
        //       value: controller.isDark,
        //       title: Text("Switch Theme"),
        //       onChanged: controller.changeTheme,
        //     ),
        //   ),
        // ),
      );
    });
  }
}