class Semester {
  int id = 0;
  String semesterName = "";
  int semesterOrder = 0;
  String semesterSeason = "";

  Semester(int _id, String _semesterName, int _semesterOrder, String _semesterSeason) {
    this.id = _id;
    this.semesterName = _semesterName;
    this.semesterOrder = _semesterOrder;
    this.semesterSeason = _semesterSeason;
  }

  Semester.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        semesterName = json['semester_name'],
        semesterOrder = json['semester_order'],
        semesterSeason = json['semester_season'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'semester_name': semesterName,
        'semester_order': semesterOrder,
        'semester_season': semesterSeason,
      };
}