
class Subject {
  int id = -1;
  String weekday = "";
  String semester = "";
  String name = "-";
  String teacher = "";
  String info = "";

  Subject(int _id, String _weekday, String _semester, String _name, String _teacher, String _info) {
    this.id = _id;
    this.weekday = _weekday;
    this.semester = _semester;
    this.name = _name;
    this.teacher = _teacher;
    this.info = _info;
  }
}