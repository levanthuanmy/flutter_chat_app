class MyUser {
  late String id;
  String name;
  String email;
  late String? avatar;

  MyUser({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  MyUser.create({required this.name, required this.email, this.avatar});
}
