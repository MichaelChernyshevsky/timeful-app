// import 'package:app_with_apps/core/exports/exports.dart';
// import 'package:app_with_apps/core/localization/app_localization.dart';
// import 'package:app_with_apps/core/manager/bloc/economy_bloc.dart';
// import 'package:app_with_apps/core/models/enum/state_enum.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class Screen extends StatefulWidget {
//   const Screen({super.key});

//   @override
//   State<Screen> createState() => _ScreenState();
// }

// class _ScreenState extends State<Screen> {
//   AppState state = AppState.loading;
//   Bloc? _bloc;
//   String newFolder_title = '';

//   @override
//   void initState() {
//     _bloc = BlocProvider.of<Bloc>(context);
//     // _bloc!.add(GetFoldersEvent());
//     super.initState();
//   }

//   // void getData(List<Folder> arr) {
//   //   if (arr.isNotEmpty) {
//   //     elements = arr;
//   //     state = AppState.loaded;
//   //   } else {
//   //     state = AppState.empty;
//   //   }
//   // }

//   // void createFolder(String title) => _bloc!.add(CreateFolderEvent(title: title));

//   // Future<void> _displayTextInputDialog(BuildContext context) async {
//   //   String valueText = '';
//   //   return showDialog(
//   //       context: context,
//   //       builder: (context) {
//   //         return AlertDialog(
//   //           title: Text(AppLocalizations.current.appName),
//   //           content: TextField(
//   //             onChanged: (value) {
//   //               setState(() {
//   //                 valueText = value;
//   //               });
//   //             },
//   //             // decoration: InputDecoration(hintText: "Text Field in Dialog"),
//   //           ),
//   //           actions: <Widget>[
//   //             MaterialButton(
//   //               child: Text(AppLocalizations.current.appName),
//   //               onPressed: () => setState(() {
//   //                 createFolder(valueText);
//   //                 newFolder_title = valueText;
//   //                 Navigator.pop(context);
//   //               }),
//   //             ),
//   //           ],
//   //         );
//   //       });
//   // }

//   // showCreation() => _displayTextInputDialog(context);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: const [
//           // ElevatedButton(
//           //   onPressed: showCreation,
//           //   child: Text(AppLocalizations.current.appName),
//           // ),
//         ],
//       ),
//       body: const CircularProgressIndicator(),
//       // BlocListener<SomeBloc, BlocState>(
//       //   listener: (context, state) {
//       //     if (state is BlocError) {
//       //       // print('error');
//       //     } else if (state is DeleteSucess) {
//       //       setState(() {});
//       //     }
//       //   },
//       //   child: Text(AppLocalizations.current.empty),
//       // ),
//     );
//   }
// }
