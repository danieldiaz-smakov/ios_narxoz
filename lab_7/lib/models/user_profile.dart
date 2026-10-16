class UserProfile {
  String name;
  String email;
  String city;
  bool notifications;

  UserProfile({
    required this.name,
    required this.email,
    this.city = 'Алматы',
    this.notifications = true,
  });
}