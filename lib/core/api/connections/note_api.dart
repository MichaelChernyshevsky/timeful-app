// import 'dart:convert';
// import 'package:app_with_apps/core/constants/models/notes/note_class.dart';
// import 'package:http/http.dart' as http;
// import 'package:app_with_apps/core/constants/uri.dart';
// import 'package:http/http.dart';

// class NoteApi {
//   Future<void> create(String title) async {
//     final body = {'title': title};
//     final Response response = await http.post(
//       Uri.parse(ConstantsUri.createNote),
//       body: jsonEncode(body),
//     );
//     return response.statusCode != 200 ? throw "error" : null;
//   }

//   Future<List<Note>> getData() async {
//     final Response response = await http.get(
//       Uri.parse(ConstantsUri.getNotes),
//     );
//     final List list = json.decode(response.body);

//     List<Note> notes = [];
//     if (list.isNotEmpty) {
//       for (final element in list) {
//         notes.add(Note(
//           id: element['id'],
//           title: element['title'],
//           description: element['description'],
//         ));
//       }
//     }
//     print(notes);
//     return response.statusCode != 200 ? throw "error" : notes;
//   }

//   Future<void> delete(int id) async {
//     final body = {'id': id};
//     final Response response = await http.delete(
//       Uri.parse(ConstantsUri.deleteNote),
//       body: jsonEncode(body),
//     );

//     return response.statusCode != 200 ? throw "error" : null;
//   }
// }
