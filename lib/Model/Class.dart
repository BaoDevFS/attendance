class Class {
  final int id;
  final String name;
  final String description;
  final String room;
  final int isOpen;
  int statusatendace=0;
  Class({this.id, this.name, this.description, this.room, this.isOpen,this.statusatendace=0});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      room: json['room'],
      isOpen: json['is_open'],
    );
  }
}
