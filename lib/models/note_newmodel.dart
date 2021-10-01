// class Note_newmodel {
//   Note_newmodel({
//       String? title,
//       String? docId,
//       String? timeCreated,
//       String? content,
//       String? userId,}){
//     _title = title;
//     _docId = docId;
//     _timeCreated = timeCreated;
//     _content = content;
//     _userId = userId;
// }
//
//   Note_newmodel.fromJson(dynamic json) {
//     _title = json['title'];
//     _docId = json['doc_id'];
//     _timeCreated = json['time_created'];
//     _content = json['content'];
//     _userId = json['user_id'];
//   }
//   String? _title;
//   String? _docId;
//   String? _timeCreated;
//   String? _content;
//   String? _userId;
//
//   String? get title => _title;
//   String? get docId => _docId;
//   String? get timeCreated => _timeCreated;
//   String? get content => _content;
//   String? get userId => _userId;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['title'] = _title;
//     map['doc_id'] = _docId;
//     map['time_created'] = _timeCreated;
//     map['content'] = _content;
//     map['user_id'] = _userId;
//     return map;
//   }
//
// }