//-1, selectedDay, subject, startTime, endTime, room,

class SubjectEntry {
  int id = null;
  String selectedDay = "";
  String subject = "";
  String startTime = "";
  String endTime = "";
  String room = "";

  SubjectEntry(int _id,String _selectedDay, String _subject, String _startTime, String _endTime, String _room) {
    this.id = _id;
    this.selectedDay = _selectedDay;
    this.subject = _subject;
    this.startTime = _startTime.toString();
    this.endTime = _endTime.toString();
    this.room = _room;
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