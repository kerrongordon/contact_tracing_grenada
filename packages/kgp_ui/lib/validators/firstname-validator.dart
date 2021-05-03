import 'package:form_field_validator/form_field_validator.dart';

final firstnameValidator = MultiValidator([
  RequiredValidator(errorText: 'Your First Name is required'),
  MinLengthValidator(
    3,
    errorText: 'Your First Name must be at least 3 characters long',
  ),
]);
