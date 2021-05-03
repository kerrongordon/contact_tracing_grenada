import 'package:form_field_validator/form_field_validator.dart';

final addressValidator = MultiValidator([
  RequiredValidator(errorText: 'Your Address is required'),
]);
