class MyUser {
  late String uid;
  String name;
  String email;
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
    return {
      "uid": uid,
      "name": name,
      "avatar": avatar ?? "",
    };
  }
}
