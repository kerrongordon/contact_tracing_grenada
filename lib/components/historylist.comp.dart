import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:contact_tracing_grenada/routes/routes.dart';
import 'package:contact_tracing_grenada/services/auth.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:contact_tracing_grenada/core/responsive.dart';

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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Responsive.isMobile(context)
                      ? Padding(
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
                        )
                      : Container(),
                  Responsive.isMobile(context)
                      ? _buildListView(context, allQuestion)
                      : Expanded(
                          child: _buildListView(context, allQuestion),
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

  ListView _buildListView(
      BuildContext context, AsyncSnapshot<List<QuestionModel>> allQuestion) {
    return ListView.builder(
      padding: Responsive.isMobile(context)
          ? const EdgeInsets.symmetric(vertical: 0)
          : const EdgeInsets.symmetric(vertical: 20),
      physics: Responsive.isMobile(context)
          ? const NeverScrollableScrollPhysics()
          : const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: allQuestion.data.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: Responsive.isMobile(context)
              ? const EdgeInsets.symmetric(horizontal: 0)
              : const EdgeInsets.symmetric(horizontal: 20),
          child: CardComp(
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
                  formatTimestamp(allQuestion.data[index].timestamp),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.fade,
                ),
                subtitle: const Text('Self report symptoms'),
                trailing: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ),
          ),
        );
      },
    );
  }
}
