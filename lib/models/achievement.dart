class Achievement {
  late String name;
  late String title;
  late String description;
  late double currentValue;
  late double maxValue;

  Achievement(
      {required this.name,
      required this.title,
      required this.description,
      required this.currentValue,
      required this.maxValue});

  Achievement.fromMap({required Map<String, dynamic> rowDB}) {
    name = rowDB["name"];
    title = rowDB["title"];
    description = rowDB["description"];
    currentValue = rowDB["current_value"];
    maxValue = rowDB["max_value"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "title": title,
      "description": description,
      "current_value": currentValue,
      "max_value": maxValue,
    };
  }
}
