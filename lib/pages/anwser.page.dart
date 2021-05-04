import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:contact_tracing_grenada/core/responsive.dart';
import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:contact_tracing_grenada/services/infor.service.dart';
import 'package:flutter/material.dart';

class AnwserPage extends StatelessWidget {
  final QuestionModel data;
  const AnwserPage({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Self Report Symptoms'),
        centerTitle: true,
      ),
      body: Responsive(
        mobile: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: buildOutPutMessage(data),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    bottom: 20,
                    left: 30,
                    right: 30,
                  ),
                  child: Divider(),
                ),
                _buildAnswerListView(context),
              ],
            ),
          ),
        ),
        tablet: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        buildOutPutMessage(data),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: _buildAnswerListView(context),
                ),
              ],
            ),
          ),
        ),
        desktop: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        buildOutPutMessage(data),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: _buildAnswerListView(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  ListView _buildAnswerListView(BuildContext context) {
    return ListView.builder(
      padding: Responsive.isMobile(context)
          ? const EdgeInsets.symmetric(vertical: 0)
          : const EdgeInsets.symmetric(vertical: 20),
      physics: Responsive.isMobile(context)
          ? const NeverScrollableScrollPhysics()
          : const AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.questions.length,
      itemBuilder: (context, index) {
        final item = data.questions[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildCardAnswer(item),
        );
      },
    );
  }

  CardComp _buildCardAnswer(Question item) {
    return CardComp(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              child: Text(
                'Question: ${item.id}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Text(item.question),
            const SizedBox(height: 20),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, ind) => Divider(),
              itemCount: item.list.length,
              itemBuilder: (context, ind) {
                final list = item.list[ind];
                return Text(list);
              },
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                const Text(
                  'Your Answer:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(width: 7),
                Text(
                  item.answer.toUpperCase(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
