class UserModel {
  final String uid;
  final String name;
  final String email;
  final String image;
  final DateTime lastActive;
  final bool isOnline;
  const UserModel(
      {required this.uid,
      required this.email,
      required this.image,
      required this.isOnline,
      required this.lastActive,
      required this.name});
}
