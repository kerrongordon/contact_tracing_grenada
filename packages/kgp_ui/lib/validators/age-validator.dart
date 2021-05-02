import 'package:form_field_validator/form_field_validator.dart';

final ageValidator = MultiValidator([
  RequiredValidator(errorText: 'Your Age is required'),
  LengthRangeValidator(
    max: 9,
    min: 0,
    errorText: 'Age must Contain only Numbers',
  ),
  MaxLengthValidator(
    2,
    errorText: 'Your age can not be more than 2 digits long',
  )
]);
