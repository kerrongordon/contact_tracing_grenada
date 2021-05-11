import 'package:contact_tracing_grenada/components/card.comp.dart';
import 'package:flutter/material.dart';

class InforCardComp extends StatelessWidget {
  final String title;
  final String date;
  final String subTitle;
  final String content;
  final void Function() onPressed;

  const InforCardComp({
    Key key,
    this.title,
    this.date,
    this.subTitle,
    this.content,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardComp(
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
                Flexible(
                  flex: 1,
                  child: CircleAvatar(
                    minRadius: 25,
                    child: const Icon(
                      Icons.assignment,
                      size: 30,
                    ),
                    backgroundColor: Colors.teal[400],
                    foregroundColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  flex: 5,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(date),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              subTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 7),
            Text(content),
            onPressed != null
                ? TextButton.icon(
                    onPressed: onPressed,
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
                  )
                : const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
