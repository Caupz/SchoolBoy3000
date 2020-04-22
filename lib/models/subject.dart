
class Subject {
  int id = -1;
  String semester = "";
  String subject = "-";
  String teacher = "";
  String info = "";

  Subject(int _id, String _semester, String _name, String _teacher, String _info) {
    this.id = _id;
    this.semester = _semester;
    this.subject = _name;
    this.teacher = _teacher;
    this.info = _info;
  }

  Subject.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        semester = json['semester'],
        subject = json['subject'],
        teacher = json['teacher'],
        info = json['info'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'semester': semester,
        'subject': subject,
        'teacher': teacher,
        'info': info,
      };
}