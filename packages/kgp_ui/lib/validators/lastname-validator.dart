import 'package:form_field_validator/form_field_validator.dart';

final lastnameValidator = MultiValidator([
  RequiredValidator(errorText: 'Your Last Name is required'),
  MinLengthValidator(
    3,
    errorText: 'Your Last Name must be at least 3 character long',
  ),
]);
