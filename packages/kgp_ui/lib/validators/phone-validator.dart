import 'package:form_field_validator/form_field_validator.dart';

final phoneValidator = MultiValidator([
  RequiredValidator(errorText: 'Your Phone Number is required'),
  MaxLengthValidator(
    10,
    errorText: 'Your Phone Number can not be more than 10 digits long',
  )
]);
