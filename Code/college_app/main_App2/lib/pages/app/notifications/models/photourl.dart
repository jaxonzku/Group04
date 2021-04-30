class photoU {
  String name;
  String emailId;
  String photoUrl;
  String uid;

  photoU({this.photoUrl});

  Map toMap(photoU) {
    var data = Map<String, String>();

    data['photoUrl'] = photoU.photoUrl;

    return data;
  }

  photoU.fromMap(Map<String, String> mapData) {
    this.photoUrl = mapData['photoUrl'];
  }

  String get _photoUrl => photoUrl;

  set _photoUrl(String photoUrl) {
    this.photoUrl = photoUrl;
  }
}
