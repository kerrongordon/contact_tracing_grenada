import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final questionProvider = Provider.autoDispose((_) => QuestionData());

class QuestionData extends StateNotifier<QuestionModel> {
  QuestionData() : super(QuestionModel());
  final List<Question> _items = [];

  List<Question> get question => _items;

  QuestionModel addQuestion(Question question) {
    _items.add(question);
    return QuestionModel(
      timestamp: DateTime.now().millisecondsSinceEpoch,
      questions: _items,
    );
  }
}
