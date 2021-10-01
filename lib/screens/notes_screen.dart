// import 'package:flutter/material.dart';
// import 'package:catatankita/bloc/note_bloc.dart';
// import 'package:catatankita/bloc/note_state.dart';
// import 'package:catatankita/widgets/alert_dialog_refactor.dart';
// import 'package:catatankita/widgets/note_card.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'edit_note.dart';
//
// class NotesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (BuildContext context) {
//                   return EditNoteScreen(
//                     newNote: true,
//                   );
//                 }));
//           },
//           child: Icon(Icons.add),
//         ),
//         backgroundColor: Colors.transparent,
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Colors.transparent,
//           title: Text(
//             'Catatan',
//             style: TextStyle(color: Colors.white),
//           ),
//           actions: [
//             // IconButton(
//             //   icon: Icon(
//             //     Icons.settings,
//             //     color: Colors.white,
//             //   ),
//             //   onPressed: () {
//             //
//             //   },
//             // )
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               // define all state and rebuild ui
//               BlocBuilder<NoteBloc, NoteState>(
//                 builder: (context, state) {
//                   if (state is NoteInitial) {
//                     return Container();
//                   }
//                   if (state is YourNotesState) {
//                     return NoteGrid(state: state);
//                   }
//                   if (state is NotesLoading) {
//                     return Container();
//                   } else {
//                     return Container();
//                   }
//                 },
//               ),
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// class NoteGrid extends StatelessWidget {
//   final YourNotesState state;
//   NoteGrid({this.state});
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       shrinkWrap: true,
//         physics: BouncingScrollPhysics(),
//         itemCount: state.notes.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.72,
//           mainAxisSpacing: 10,
//           crossAxisSpacing: 10,
//         ),
//
//         itemBuilder: (context, index) {
//           final note = state.notes[index];
//           return InkWell(
//             onTap: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (BuildContext context) {
//                     return EditNoteScreen(
//                       note: note,
//                       index: index,
//                       newNote: false,
//                     );
//                   }));
//             },
//
//             onLongPress: () {
//               showDialog(
//                   context: context,
//                   builder: (BuildContext context) => AlertDialogRefactor(index: index) );
//             },
//             child: NoteCard(
//               title: note.title,
//               content: note.content,
//               createdAt: note.createdAt,
//               noteId: note.noteId,
//             ),
//           );
//         }
//     );
//
// }}
