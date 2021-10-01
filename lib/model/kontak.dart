class Kontak {
  Kontak({
      this.linkApk, 
      this.git,});

  Kontak.fromJson(dynamic json) {
    linkApk = json['link_apk'];
    git = json['git'];
  }
  String? linkApk;
  String? git;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['link_apk'] = linkApk;
    map['git'] = git;
    return map;
  }

}