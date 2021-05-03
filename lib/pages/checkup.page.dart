import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:contact_tracing_grenada/components/historylist.comp.dart';
import 'package:contact_tracing_grenada/models/question.model.dart';
import 'package:contact_tracing_grenada/routes/routes.dart';
import 'package:contact_tracing_grenada/services/auth.service.dart';
import 'package:contact_tracing_grenada/services/infor.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CheckupPage extends HookWidget {
  const CheckupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = useProvider(authProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () => _auth.logout()),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StreamBuilder(
                  stream: _auth.lastOneAnwser(),
                  initialData: <QuestionModel>[],
                  builder: (BuildContext context,
                      AsyncSnapshot<List<QuestionModel>> snapshot) {
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
                ),
                CardComp(
                  onTap: () => Navigator.pushNamed(context, questionScreen),
                  color: Colors.blue,
                  shadowColor: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.favorite_rounded,
                        size: 40,
                        color: Colors.white,
                      ),
                      title: const Text(
                        'New Checkup',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      subtitle: const Text(
                        'Self report symptoms',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: const Text(
                        'Start',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                const HistoryListComp(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, questionScreen),
        child: Icon(Icons.add),
      ),
    );
  }
}
