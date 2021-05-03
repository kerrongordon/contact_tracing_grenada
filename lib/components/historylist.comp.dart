import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:contact_tracing_grenada/routes/routes.dart';
import 'package:contact_tracing_grenada/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HistoryListComp extends HookWidget {
  const HistoryListComp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = useProvider(authProvider);

    return StreamBuilder(
      stream: _auth.allAnwser(),
      initialData: <QuestionModel>[],
      builder: (BuildContext context,
          AsyncSnapshot<List<QuestionModel>> allQuestion) {
        switch (allQuestion.connectionState) {
          case ConnectionState.none:
            return Container();
            break;
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
            if (allQuestion.hasData) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Text(
                      'History',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: allQuestion.data.length,
                    itemBuilder: (context, index) {
                      return CardComp(
                        onTap: () => Navigator.pushNamed(
                          context,
                          anwserPage,
                          arguments: allQuestion.data[index],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            leading: const Icon(
                              Icons.favorite_rounded,
                              size: 40,
                              color: Colors.blue,
                            ),
                            title: Text(
                              formatTimestamp(
                                  allQuestion.data[index].timestamp),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.fade,
                            ),
                            subtitle: const Text('Self report symptoms'),
                            trailing: Icon(Icons.keyboard_arrow_right_rounded),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            }
            return Container();
            break;
          case ConnectionState.done:
            return Container();
            break;
          default:
            return Container();
        }
      },
    );
  }
}
