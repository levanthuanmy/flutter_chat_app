class User {
  late String id;
  String name;
  String email;
  late String? avatar;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  User.create({required this.name, required this.email, this.avatar});
}
