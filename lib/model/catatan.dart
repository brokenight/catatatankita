class Catatan{
  String? title, content, createdAt, noteId;
  Catatan({this.title, this.content, this.createdAt, this.noteId});

  factory Catatan.fromJson(Map<String,dynamic> json)=>Catatan(
      title : json['title'],
      content : json['content'],
      createdAt : json['createdAt'],
      noteId : json['noteId'],
  );

  Map<String,dynamic> toJson()=>{
    'title':title,
    'content':content,
    'createdAt':createdAt,
    'noteId':noteId
  };
}

// class Catatan {
//   Catatan({
//       String? title,
//       String? docId,
//       String? timeCreated,
//       String? content,}){
//     _title = title;
//     _docId = docId;
//     _timeCreated = timeCreated;
//     _content = content;
// }
//
//   Catatan.fromJson(dynamic json) {
//     _title = json['title'];
//     _docId = json['doc_id'];
//     _timeCreated = json['time_created'];
//     _content = json['content'];
//   }
//   String? _title;
//   String? _docId;
//   String? _timeCreated;
//   String? _content;
//
//   String? get title => _title;
//   String? get docId => _docId;
//   String? get timeCreated => _timeCreated;
//   String? get content => _content;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['title'] = _title;
//     map['doc_id'] = _docId;
//     map['time_created'] = _timeCreated;
//     map['content'] = _content;
//     return map;
//   }
//
// }