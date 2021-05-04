import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:contact_tracing_grenada/routes/routes.dart';
import 'package:flutter/material.dart';

class CheckupButtonComp extends StatelessWidget {
  const CheckupButtonComp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComp(
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
    );
  }
}
