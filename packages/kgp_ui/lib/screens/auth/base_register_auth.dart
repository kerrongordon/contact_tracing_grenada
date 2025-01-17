import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kgp_ui/core/base_address_form_field.dart';
import 'package:kgp_ui/core/base_email_form_field.dart';
import 'package:kgp_ui/core/base_name_form_field.dart';
import 'package:kgp_ui/core/base_number_form_field.dart';
import 'package:kgp_ui/core/base_password_form_field.dart';
import 'package:kgp_ui/core/base_phonenumber_form_field.dart';
import 'package:kgp_ui/validators/lastname-validator.dart';

import '../../components/base_footer_auth.dart';
import '../../kgp_ui.dart';
import '../../validators/password-validator.dart';
import '../base_screen.dart';

class BaseRegisterAuth extends HookWidget {
  /// Page Text Title "Register"
  final String pageTitle;

  /// Email Text Title "Email Address"
  final String labelTextemail;

  /// Email Validator using MultiValidator
  final MultiValidator emailvalidatorFun;

  /// Name Validator using MultiValidator
  final MultiValidator namevalidatorFun;

  /// Address Validator using MultiValidator
  final MultiValidator addressValidator;

  /// Phone Number Validator using MultiValidator
  final MultiValidator phoneNumberValidator;

  /// Age Validator using MultiValidator
  final MultiValidator agevalidatorFun;

  /// Password Text Title "Password"
  final String labelTextpassword;

  /// Password Validator using MultiValidator
  final MultiValidator passwordvalidatorFun;

  /// Password Text Title "Password"
  final String labelTextpasswordConfrom;

  /// Password Validator using MultiValidator
  final MultiValidator passwordvalidatorConfromFun;

  /// Sign Up Function Button
  /// GlobalKey<FormState> loginKey,
  /// String email,
  /// String password,
  /// String passwordCon,
  /// bool rememberMe,
  /// BuildContext context,
  final void Function({
    GlobalKey<FormState> registerKey,
    String gender,
    String firstName,
    String lastName,
    String address,
    String phoneNumber,
    String age,
    String email,
    String password,
    String passwordCon,
    BuildContext context,
  }) onSignUpBtn;

  BaseRegisterAuth({
    Key key,
    this.pageTitle,
    this.labelTextemail,
    this.emailvalidatorFun,
    this.namevalidatorFun,
    this.agevalidatorFun,
    this.addressValidator,
    this.labelTextpassword,
    this.passwordvalidatorFun,
    this.labelTextpasswordConfrom,
    this.passwordvalidatorConfromFun,
    this.phoneNumberValidator,
    this.onSignUpBtn,
  }) : super(key: key);

  final _registerKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _gender = useState<String>('');
    final _firstName = useState<String>('');
    final _lastName = useState<String>('');
    final _address = useState<String>('');
    final _phoneNumber = useState<String>('');
    final _age = useState<String>('');
    final _email = useState<String>('');
    final _password = useState<String>('');
    final _passwordCon = useState<String>('');
    final _passwordOnChange = useState<String>('');

    final _fnameFoce = useFocusNode();
    final _lnameFoce = useFocusNode();
    final _addressFoce = useFocusNode();
    final _phoneNumberFoce = useFocusNode();
    final _ageFoce = useFocusNode();
    final _emailFoce = useFocusNode();
    final _passwordFoce = useFocusNode();
    final _passwordConFoce = useFocusNode();
    final _submitFoce = useFocusNode();

    return Scaffold(
      body: BaseScreen(
        title: pageTitle ?? 'Register',
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(top: 50),
          child: Form(
            key: _registerKey,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 400),
                child: Column(
                  children: [
                    BaseDropdownButton(
                      icon: const Icon(Icons.person),
                      onChanged: (val) => _gender.value = val,
                    ),
                    BaseNameFormField(
                      labelTextname: labelTextemail ?? 'First Name',
                      namevalidatorFun: namevalidatorFun,
                      onSaved: (val) => _firstName.value = val,
                      onChanged: (val) => _firstName.value = val,
                      focusNode: _fnameFoce,
                      nextFocusNode: _lnameFoce,
                    ),
                    BaseNameFormField(
                      labelTextname: labelTextemail ?? 'Last Name',
                      namevalidatorFun: lastnameValidator,
                      onSaved: (val) => _lastName.value = val,
                      onChanged: (val) => _lastName.value = val,
                      focusNode: _lnameFoce,
                      nextFocusNode: _addressFoce,
                    ),
                    BaseAddressFormField(
                      labelTextname: labelTextemail,
                      namevalidatorFun: addressValidator,
                      onSaved: (val) => _address.value = val,
                      onChanged: (val) => _address.value = val,
                      focusNode: _addressFoce,
                      nextFocusNode: _phoneNumberFoce,
                    ),
                    BasePhoneNumberFormField(
                      labelTextname: labelTextemail,
                      namevalidatorFun: phoneNumberValidator,
                      onSaved: (val) => _phoneNumber.value = val,
                      onChanged: (val) => _phoneNumber.value = val,
                      focusNode: _phoneNumberFoce,
                      nextFocusNode: _ageFoce,
                    ),
                    BaseNumberFormField(
                      labelTextname: labelTextemail,
                      namevalidatorFun: agevalidatorFun,
                      onSaved: (val) => _age.value = val,
                      onChanged: (val) => _age.value = val,
                      focusNode: _ageFoce,
                      nextFocusNode: _emailFoce,
                    ),
                    BaseEmailFormField(
                      labelTextemail: labelTextemail,
                      emailvalidatorFun: emailvalidatorFun,
                      onSaved: (val) => _email.value = val,
                      onChanged: (val) => _email.value = val,
                      focusNode: _emailFoce,
                      nextFocusNode: _passwordFoce,
                    ),
                    BasePasswordFormField(
                      labelTextpassword: labelTextpassword,
                      passwordvalidatorFun: passwordvalidatorFun,
                      onSaved: (val) => _password.value = val,
                      onChanged: (val) {
                        _password.value = val;
                        _passwordOnChange.value = val;
                      },
                      focusNode: _passwordFoce,
                      nextFocusNode: _passwordConFoce,
                    ),
                    BasePasswordFormField(
                      labelTextpassword:
                          labelTextpasswordConfrom ?? 'Password Confirmation',
                      passwordvalidatorFun: (val) =>
                          passwordCon(val, _passwordOnChange.value),
                      onSaved: (val) => _passwordCon.value = val,
                      onChanged: (val) => _passwordCon.value = val,
                      focusNode: _passwordConFoce,
                      nextFocusNode: _submitFoce,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 30),
                      child: Builder(builder: (BuildContext context) {
                        return ElevatedButton.icon(
                          focusNode: _submitFoce,
                          icon: const Icon(Icons.assignment),
                          label: const Text('Register'),
                          onPressed: () => onSignUpBtn(
                            registerKey: _registerKey,
                            gender: _gender.value,
                            firstName: _firstName.value,
                            lastName: _lastName.value,
                            address: _address.value,
                            phoneNumber: _phoneNumber.value,
                            age: _age.value,
                            email: _email.value,
                            password: _password.value,
                            passwordCon: _passwordCon.value,
                            context: context,
                          ),
                        );
                      }),
                    ),
                    FooterAuth(
                      action: 'Sign In',
                      detail: 'Already a member?',
                      onTap: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
