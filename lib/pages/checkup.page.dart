import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:contact_tracing_grenada/pages/base.page.dart';
import 'package:contact_tracing_grenada/routes/routes.dart';
import 'package:contact_tracing_grenada/services/auth.service.dart';
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
        title: Text('Checkups'),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.logout), onPressed: () => _auth.logout())
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CardComp(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              minRadius: 25,
                              child: const Icon(
                                Icons.assignment,
                                size: 30,
                              ),
                              backgroundColor: Colors.teal[400],
                              foregroundColor: Colors.white,
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'No Test Needed',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text('March 1, 2021'),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Today\'s Checkup Results',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                            'Based on your responses from the survey below you do not qualify for a test. Please check back daily.'),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Text(
                            'View Details',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          label: const Icon(
                            Icons.keyboard_arrow_right_rounded,
                            size: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                CardComp(
                  onTap: () {
                    Navigator.pushNamed(context, questionScreen);
                  },
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
                CardComp(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.favorite_rounded,
                        size: 40,
                        color: Colors.blue,
                      ),
                      title: const Text(
                        'New Checkup',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text('Self report symptoms'),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                ),
                CardComp(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.favorite_rounded,
                        size: 40,
                        color: Colors.blue,
                      ),
                      title: const Text(
                        'New Checkup',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text('Self report symptoms'),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                ),
                CardComp(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      leading: const Icon(
                        Icons.favorite_rounded,
                        size: 40,
                        color: Colors.blue,
                      ),
                      title: const Text(
                        'New Checkup',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: const Text('Self report symptoms'),
                      trailing: Icon(Icons.keyboard_arrow_right_rounded),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
