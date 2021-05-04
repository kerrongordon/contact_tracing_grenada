import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:contact_tracing_grenada/services/auth.service.dart';
import 'package:contact_tracing_grenada/services/infor.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StatusComp extends HookWidget {
  const StatusComp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = useProvider(authProvider);

    return StreamBuilder(
      stream: _auth.lastOneAnwser(),
      initialData: <QuestionModel>[],
      builder:
          (BuildContext context, AsyncSnapshot<List<QuestionModel>> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final data = snapshot.data[0];
          return buildOutPutMessage(data);
        } else {
          return Container();
        }
      },
    );
  }
}
