//
// import 'package:equatable/equatable.dart';
// import 'package:flutter/cupertino.dart';
//
// abstract class NoteEvent extends Equatable {
//   @override
//   List<Object> get props => [];
// }
//
// // initial event
// class NoteInitialEvent extends NoteEvent {
//
// }
// // add event
// class NoteAddEvent extends NoteEvent {
//   final String title, content, createdAt, noteId;
//
//   NoteAddEvent({@required this.title, @required this.content, @required this.createdAt, @required this.noteId});
// }
// // edit event
// class NoteEditEvent extends NoteEvent {
//   final String title, content, createdAt, noteId;
//   final int index;
//
//   NoteEditEvent(
//       {@required this.title, @required this.content, @required this.createdAt, @required this.noteId, @required this.index});
// }
// // delete event
// class NoteDeleteEvent extends NoteEvent {
//   final int index;
//   final String noteId;
//
//   NoteDeleteEvent({@required this.index, @required this.noteId});
// }