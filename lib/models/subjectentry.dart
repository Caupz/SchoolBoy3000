//-1, selectedDay, subject, startTime, endTime, room,

class SubjectEntry {
  int id = null;
  String selectedDay = "";
  String subject = "";
  String startTime = "";
  String endTime = "";
  String room = "";
  String transportType = "";
  String departureTime = "";

  SubjectEntry(int _id,String _selectedDay, String _subject, String _startTime, String _endTime, String _room, String _transportType, String _departureTime) {
    this.id = _id;
    this.selectedDay = _selectedDay;
    this.subject = _subject;
    this.startTime = _startTime.toString();
    this.endTime = _endTime.toString();
    this.room = _room;
    this.transportType = _transportType;
    this.departureTime = _departureTime.toString();
  }

  SubjectEntry.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        selectedDay = json['selected_day'],
        subject = json['subject'],
        startTime = json['start_time'],
        endTime = json['end_time'],
        room = json['room'],
        transportType = json['transportType'],
        departureTime = json['departureTime'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'selected_day': selectedDay,
        'subject': subject,
        'start_time': startTime,
        'end_time': endTime,
        'room': room,
        'transportType': transportType,
        'transportType': transportType,
      };
}