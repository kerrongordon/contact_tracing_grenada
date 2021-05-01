// import 'package:flutter/material.dart';

// import '../models/user.model.dart';

// class ScreenFive extends StatelessWidget {
//   final UserModel userData;
//   const ScreenFive({Key key, this.userData}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('COVID-19 Survey App'),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 if (userData.optionOne ||
//                     userData.optionTwo ||
//                     userData.optionThree)
//                   Text(
//                     'There is an 85% chance you are a carrier of SARS-CoV-2, popularly known as COVID-19/The Corona Virus. Please self-quarantine for 14 days, then go to your local testing site and get tested or call the COVID-19 hotline @ (473)-438-4787 or (473) 538-4787. Thank you for using our app!',
//                     style: TextStyle(fontSize: 25),
//                     textAlign: TextAlign.center,
//                   ),
//                 if (!userData.optionOne &&
//                     !userData.optionTwo &&
//                     !userData.optionThree)
//                   Text(
//                     'You are most likely catching the common cold and should rest and drink heavy fluids. However, to be certain, contact the COVID-19 hotline @ (473)-438-4787 or (473) 538-4787. Thank you for using our app!',
//                     style: TextStyle(fontSize: 25),
//                     textAlign: TextAlign.center,
//                   ),
//                 SizedBox(
//                   height: 150,
//                 ),
//                 ElevatedButton(
//                   child: Text('Done'),
//                   onPressed: () => Navigator.of(context).pop(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
