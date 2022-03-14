class User {
  late String id;
  String name;
  String email;
  String password;
  late String? avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  User.create(
      {required this.name, required this.email, required this.password});
}
