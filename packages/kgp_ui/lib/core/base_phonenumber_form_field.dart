import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kgp_ui/validators/phone-validator.dart';

import '../utils/field-focus-change.dart';
import 'base_text_form_field.dart';

class BasePhoneNumberFormField extends StatelessWidget {
  final String labelTextname;
  final MultiValidator namevalidatorFun;
  final void Function(String) onSaved;
  final void Function(String) onChanged;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  const BasePhoneNumberFormField({
    Key key,
    @required this.labelTextname,
    @required this.namevalidatorFun,
    @required this.onSaved,
    @required this.focusNode,
    @required this.nextFocusNode,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      prefixIcon: const Icon(Icons.phone),
      keyboardType: TextInputType.number,
      labelText: labelTextname ?? 'Phone Number',
      validator: namevalidatorFun ?? phoneValidator,
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
