import 'package:form_field_validator/form_field_validator.dart';

final answerValidator = MultiValidator([
  RequiredValidator(errorText: 'Your Answer is required'),
]);
