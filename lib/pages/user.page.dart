import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:contact_tracing_grenada/components/dropdown.comp.dart';
import 'package:contact_tracing_grenada/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/data.service.dart';

class UserPage extends HookWidget {
  final _screenTwoKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final snackBar = SnackBar(content: Text('Please Select a Gender!'));
    final _userData = useProvider(userData);
    final _data = useProvider(dataService);
    final _auth = useProvider(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Please Fill In The Form'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _screenTwoKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                CardComp(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            onSaved: (val) => _userData.firstName = val,
                            validator: MinLengthValidator(3,
                                errorText:
                                    'First Name must be at least 3 characters long'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'First Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            onSaved: (val) => _userData.lastName = val,
                            validator: MinLengthValidator(3,
                                errorText:
                                    'Last Name must be at least 3 characters long'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Last Name',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            onSaved: (val) => _userData.age = int.parse(val),
                            validator: MinLengthValidator(1,
                                errorText: 'You Must add an Age'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Age',
                            ),
                          ),
                        ),
                        DropDownListComponent(
                          onChanged: (val) => _userData.gender = val,
                        )
                      ],
                    ),
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 40),
                //   child: ElevatedButton(
                //     child: Text('Go To Next Page'),
                //     onPressed: () async {
                //       if (_screenTwoKey.currentState.validate()) {
                //         _screenTwoKey.currentState.save();

                //         if (_userData.gender == 'Male' ||
                //             _userData.gender == 'Female') {
                //           _data.adduser(_userData);
                //           await _auth.login();
                //           await _auth.addProfile(user: _userData);
                //           Navigator.pushReplacement(
                //             context,
                //             MaterialPageRoute(
                //               builder: (context) => CheckupPage(),
                //             ),
                //           );
                //         } else {
                //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
                //         }
                //       }
                //     },
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_screenTwoKey.currentState.validate()) {
            _screenTwoKey.currentState.save();

            if (_userData.gender == 'Male' || _userData.gender == 'Female') {
              _data.adduser(_userData);
              await _auth.login();
              await _auth.addProfile(user: _userData);
              Navigator.pop(context);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          }
        },
        label: Text('Done'),
      ),
    );
  }
}
