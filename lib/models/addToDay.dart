//-1, selectedDay, subject, startTime, endTime, room,

class addToDay {
  int id = -1;
  String selectedDay = "";
  String subject = "-";
  DateTime startTime = null;
  DateTime endTime = null;
  String room = "";

  addToDay(int _id,String _selectedDay, String _subject, DateTime _startTime, DateTime _endTime, String _room) {
    this.id = _id;
    this.selectedDay = _selectedDay;
    this.subject = _subject;
    this.startTime = _startTime;
    this.endTime = _endTime;
    this.room = _room;
  }
}