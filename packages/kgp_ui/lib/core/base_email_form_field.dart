import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../utils/field-focus-change.dart';
import '../validators/email-validator.dart';
import 'base_text_form_field.dart';

class BaseEmailFormField extends StatelessWidget {
  final String labelTextemail;
  final MultiValidator emailvalidatorFun;
  final void Function(String) onSaved;
  final void Function(String) onChanged;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  const BaseEmailFormField({
    Key key,
    @required this.labelTextemail,
    @required this.emailvalidatorFun,
    @required this.onSaved,
    @required this.focusNode,
    @required this.nextFocusNode,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      prefixIcon: const Icon(Icons.alternate_email),
      keyboardType: TextInputType.emailAddress,
      labelText: labelTextemail ?? 'Email Address',
      validator: emailvalidatorFun ?? emailValidator,
      onSaved: onSaved,
      focusNode: focusNode,
      onChanged: onChanged,
      onFieldSubmitted: (val) => fieldFocusChange(
        context,
        focusNode,
        nextFocusNode,
      ),
    );
  }
}
