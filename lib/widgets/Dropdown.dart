// import 'package:flutter/material.dart';
//
// class Dropdown extends StatefulWidget {
//   const Dropdown({super.key, required this.selectedImage, required this.imageMap,});
//
//   final String? selectedImage;
//   final Map<String, String> imageMap;
//
//   @override
//   _Dropdown createState() => _Dropdown();
// }
//
// class _Dropdown extends State<Dropdown> {
//   String? selectedImage;
//   late final Map<String, String> imageMap;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedImage = widget.selectedImage;
//     imageMap = widget.imageMap;
//   }
//
//   String? getSelectedImage() {
//     return selectedImage;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container (
//       height: 30,
//       width: 50,
//       // color: const Color.fromARGB(255, 200, 155, 250),
//       child: DropdownButton<String>(
//         value: selectedImage,
//         icon: const Icon(Icons.keyboard_arrow_right_outlined),
//         elevation: 18,
//         isExpanded: true,
//         iconSize: 24,
//         style: const TextStyle(color: Colors.black ,fontSize: 20.0),
//         onChanged: (String? newValue) {
//           setState(() {
//             selectedImage = newValue!;
//           });
//         },
//         items: imageMap.keys.map<DropdownMenuItem<String>>((String value) {
//           return DropdownMenuItem<String>(
//             value: value,
//             child: Text(value),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }