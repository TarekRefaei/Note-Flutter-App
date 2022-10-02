import 'package:equatable/equatable.dart';

// List<Note> employeeFromJson(String str) => List<Note>.from(
//       json.decode(str).map(
//             (x) => Note.fromMap(x),
//           ),
//     );
//
// String employeeToJson(List<Note> data) => json.encode(
//       List<dynamic>.from(
//         data.map(
//           (x) => x.toMap(),
//         ),
//       ),
//     );

class Note extends Equatable {
  final String? text;
  final String? noteId;
  final DateTime? placeDateTime;
  final String? userId;
  final int? id;

  const Note({
    this.text,
    this.noteId,
    this.placeDateTime,
    this.userId,
    this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Note &&
          runtimeType == other.runtimeType &&
          text == other.text &&
          noteId == other.noteId &&
          placeDateTime == other.placeDateTime &&
          userId == other.userId &&
          id == other.id);

  @override
  int get hashCode =>
      text.hashCode ^
      noteId.hashCode ^
      placeDateTime.hashCode ^
      userId.hashCode ^
      id.hashCode;

  @override
  String toString() {
    return 'Note{ text: $text, noteId: $noteId, placeDateTime: $placeDateTime, userId: $userId, id: $id,}';
  }

  Note copyWith({
    String? text,
    String? noteId,
    DateTime? placeDateTime,
    String? userId,
    int? id,
  }) {
    return Note(
      text: text ?? this.text,
      noteId: noteId ?? this.noteId,
      placeDateTime: placeDateTime ?? this.placeDateTime,
      userId: userId ?? this.userId,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'noteId': noteId,
      'placeDateTime': placeDateTime?.toIso8601String(),
      'userId': userId,
      //'id': id,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      text: map['text'] ?? 'Text',
      noteId: map['noteId'] ?? '',
      placeDateTime: DateTime.parse(map['placeDateTime']),
      userId: map['userId'] ?? '',
      id: map['_id'],
    );
  }

  @override
  List<Object?> get props => [id, text, noteId, userId, placeDateTime];

  static List<Note> notes = [
    Note(
        text: 'test1',
        noteId: 'id1',
        userId: '2',
        id: 0,
        placeDateTime:DateTime.now(),),
    Note(
        text: 'test2',
        noteId: 'id1',
        userId: '2',
        id: 1,
        placeDateTime: DateTime.now()),
    Note(
        text: 'test3',
        noteId: 'id1',
        userId: '2',
        id: 2,
        placeDateTime: DateTime.now()),
    Note(
        text: 'test4',
        noteId: 'id1',
        userId: '2',
        id: 3,
        placeDateTime: DateTime.now()),
  ];
}
