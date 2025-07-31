class AppModel {
  final String name;
  final String iconPath;
  bool isBlocked;

  AppModel({
    required this.name,
    required this.iconPath,
    this.isBlocked = false,
  });
}
