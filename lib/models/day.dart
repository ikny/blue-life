class Day {
  late DateTime date;
  bool closed = false; //for update
  bool changed = false;

  late double hrsSleep;
  late double hrsMovement;
  late double hrsProcrastination;
  late bool porn;
  late int sex;

  Day({
    required this.date,
    required this.hrsSleep,
    required this.hrsMovement,
    required this.hrsProcrastination,
    required this.porn,
    required this.sex,
  });

  Day.fromMap({required Map<String, dynamic> rowDB}) {
    //#forupdate: add some form of validation (enums?)
    date = rowDB["date"].runtimeType == String
        ? DateTime.parse(rowDB["date"])
        : rowDB["date"];
    hrsSleep = rowDB["hrs_sleep"];
    hrsMovement = rowDB["hrs_movement"];
    hrsProcrastination = rowDB["hrs_procrastination"];
    porn = rowDB["porn"] == 0 ? false : true;
    sex = rowDB["sex"];
  }

  Map<String, dynamic> toMap() {
    return {
      "date": date.toIso8601String(),
      "hrs_sleep": hrsSleep,
      "hrs_movement": hrsMovement,
      "hrs_procrastination": hrsProcrastination,
      "porn": porn == false ? 0 : 1,
      "sex": sex,
    };
  }
}
