import '../database/db_helper.dart';
import '../models/note_model.dart';

class NotesRepository {
  final DBHelper _dbHelper = DBHelper();

  Future<List<Note>> getAllNotes() async => await _dbHelper.readAllNotes();

  Future<void> closeDB() async => await _dbHelper.closeDatabase();

  Future<bool> deleteAllNotes() async => await _dbHelper.deleteNotes();

  Future<Note> getNoteById(int id) async => await _dbHelper.readNote(id);

  Future<Note> createNote(Note note) async => await _dbHelper.insertNote(note);

  // Future<List<Note>> insertAllNotes() async => await _dbHelper.insertAllNotes();

  Future<bool> deleteNoteById(int id) async => await _dbHelper.deleteNote(id);

  Future<bool> updateNoteById(Note note) async =>
      await _dbHelper.updateNote(note);
}
