import 'package:college_App/model/user.dart';

class Student extends User {
  String type = "student";
  String branch;
  String email1;
  int rollNo;
  int regNo;

  Student.data({
    String fullName,
    String displayName,
    String dateOfBirth,
    String bio,
    int phoneNo,
    String photoUrl,
    String thumbPhotoUrl,
    String sex,
    String email1,
    String deviceTokenId,
    String uid,
    int dailyBlogLimit,
    this.regNo,
    this.rollNo,
    this.branch,
  }) : super(
            fullName: fullName,
            displayName: displayName,
            dateOfBirth: dateOfBirth,
            bio: bio,
            phoneNo: phoneNo,
            photoUrl: photoUrl,
            thumbPhotoUrl: thumbPhotoUrl,
            sex: sex,
            deviceTokenId: deviceTokenId,
            dailyBlogLimit: dailyBlogLimit,
            email1: email1);

  factory Student.from(Map<String, dynamic> data) => Student.data(
      fullName: data['fullName'],
      displayName: data['displayName'],
      dateOfBirth: data['dateOfBirth'],
      bio: data['bio'],
      phoneNo: data['phoneNo'],
      photoUrl: data['photoUrl'],
      thumbPhotoUrl: data['thumbPhotoUrl'],
      sex: data['sex'],
      deviceTokenId: data['deviceTokenId'],
      regNo: data['regNo'],
      rollNo: data['rollNo'],
      branch: data['branch'],
      dailyBlogLimit: data['dailyBlogLimit'],
      email1: data['email1'],
      uid: data['uid']);

  Map<String, dynamic> toMap() {
    return {
      'type: ': 'student',
      'fullName': this.fullName,
      'displayName': this.displayName,
      'dateOfBirth': this.dateOfBirth,
      'dailyBlogLimit': this.dailyBlogLimit,
      'phoneNo': this.phoneNo,
      'photoUrl': this.photoUrl,
      'thumbPhotoUrl': this.thumbPhotoUrl,
      'sex': this.sex,
      'deviceTokenId': this.deviceTokenId,
      'regNo': this.regNo,
      'rollNo': this.rollNo,
      'branch': this.branch,
      'email1': this.email1,
      'uid': this.uid,
    };
  }
}
