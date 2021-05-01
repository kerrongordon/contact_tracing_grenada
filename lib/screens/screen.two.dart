// import 'package:contact_tracing_grenada/components/dropdown.comp.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:form_field_validator/form_field_validator.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../services/data.service.dart';

// class ScreenTwo extends HookWidget {
//   final PageController pageController;

//   ScreenTwo({this.pageController});

//   final _screenTwoKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final snackBar = SnackBar(content: Text('Please Select a Gender!'));
//     final _userData = useProvider(userData);
//     final _data = useProvider(dataService);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('COVID-19 Survey App'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _screenTwoKey,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             child: Column(
//               children: [
//                 Card(
//                   elevation: 5.0,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: ListView(
//                       physics: const NeverScrollableScrollPhysics(),
//                       shrinkWrap: true,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: TextFormField(
//                             onSaved: (val) => _userData.firstName = val,
//                             validator: MinLengthValidator(3,
//                                 errorText:
//                                     'First Name must be at least 3 characters long'),
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'First Name',
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: TextFormField(
//                             onSaved: (val) => _userData.lastName = val,
//                             validator: MinLengthValidator(3,
//                                 errorText:
//                                     'Last Name must be at least 3 characters long'),
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'Last Name',
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 10),
//                           child: TextFormField(
//                             onSaved: (val) => _userData.age = int.parse(val),
//                             validator: MinLengthValidator(1,
//                                 errorText: 'You Must add an Age'),
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(),
//                               labelText: 'Age',
//                             ),
//                           ),
//                         ),
//                         DropDownListComponent(
//                           onChanged: (val) => _userData.gender = val,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 40),
//                   child: ElevatedButton(
//                     child: Text('Go To Next Page'),
//                     onPressed: () {
//                       if (_screenTwoKey.currentState.validate()) {
//                         _screenTwoKey.currentState.save();

//                         if (_userData.gender == 'Male' ||
//                             _userData.gender == 'Female') {
//                           _data.adduser(_userData);
//                           pageController.nextPage(
//                             duration: const Duration(milliseconds: 400),
//                             curve: Curves.linear,
//                           );
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                         }
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
