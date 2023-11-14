// import 'dart:convert';

// import 'package:app_with_apps/core/constants/models/notes/folder_class.dart';
// import 'package:app_with_apps/core/constants/uri.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// class FolderApi {
//   Future<void> create(String title) async {
//     final body = {'title': title};
//     final Response response = await http.post(
//       Uri.parse(ConstantsUri.createFolder),
//       body: jsonEncode(body),
//     );
//     return response.statusCode != 200 ? throw "error" : null;
//   }

//   Future<void> delete(int id) async {
//     final body = {'id': id};
//     final Response response = await http.delete(
//       Uri.parse(ConstantsUri.deleteFolder),
//       body: jsonEncode(body),
//     );
//     return response.statusCode != 200 ? throw "error" : null;
//   }

//   Future<List<Folder>> getData() async {
//     final Response response = await http.get(
//       Uri.parse(ConstantsUri.getFolders),
//     );
//     final List list = json.decode(response.body);

//     List<Folder> folders = [];
//     if (list.isNotEmpty) {
//       for (final element in list) {
//         folders.add(Folder(id: element['id'], title: element['title']));
//       }
//     }

//     return response.statusCode != 200 ? throw "error" : folders;
//   }
// }
