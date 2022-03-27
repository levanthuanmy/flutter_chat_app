import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  late String uid;
  late String name;
  late String email;
  late String? avatar;

  MyUser({
    required this.uid,
    required this.name,
    required this.email,
    required this.avatar,
  });

  MyUser.create({
    required this.name,
    required this.email,
    this.avatar,
  });

  MyUser.setInformation({
    required this.uid,
    required this.name,
    required this.email,
    required this.avatar,
  });

  MyUser.fromDoc(QueryDocumentSnapshot documentSnapshot) {
    uid = documentSnapshot.id;
    name = documentSnapshot['name'] ?? "";
    email = documentSnapshot['email'] ?? "";
    avatar = documentSnapshot['avatar'] ?? "";
  }

  Map<String, Object> toMap() {
    return {
      "uid": uid,
      "name": name,
      "avatar": avatar ?? "",
      // "friendsList": friendsList,
      "email": email
    };
  }

  Map<String, Object> getInformationJson() {
    return {"uid": uid, "name": name, "avatar": avatar ?? "", "email": email};
  }
}
