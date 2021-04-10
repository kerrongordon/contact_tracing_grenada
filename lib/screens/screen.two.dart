import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
// import 'package:contact_tracing_grenada/services/data.service.dart';
import 'package:contact_tracing_grenada/models/user.model.dart';

class ScreenTwo extends HookWidget {
  final PageController pageController;

  ScreenTwo({this.pageController});

  final _screenTwoKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final _userdata = useProvider(dataService);

    final _userData = new UserModel();
    final _firstName = useState('');
    final _lastName = useState('');
    final _age = useState('');
    final _gender = useState('');

    return Scaffold(
      appBar: AppBar(
        title: Text('COVID-19 Survey App'),
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
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            onSaved: (val) => _firstName.value = val,
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
                            onSaved: (val) => _lastName.value = val,
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
                            onSaved: (val) => _age.value = val,
                            validator: MinLengthValidator(1,
                                errorText: 'You Must add an Age'),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Age',
                            ),
                          ),
                        ),
                        DropdownButton<String>(
                          value: _gender.value == '' ? null : _gender.value,
                          hint: Text('Gender'),
                          icon: Container(),
                          isExpanded: true,
                          elevation: 16,
                          style: TextStyle(color: Colors.deepPurple),
                          underline: Container(
                            height: 2,
                            color: Colors.deepPurpleAccent,
                          ),
                          onChanged: (val) => _gender.value = val,
                          items: <String>[
                            'Male',
                            'Female',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: ElevatedButton(
                    child: Text('Go To Next Page'),
                    onPressed: () {
                      if (_screenTwoKey.currentState.validate()) {
                        _screenTwoKey.currentState.save();
                        _userData.firstName = _firstName.value;
                        _userData.lastName = _lastName.value;
                        _userData.age = _age.value;
                        _userData.gender = _gender.value;
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.linear);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
