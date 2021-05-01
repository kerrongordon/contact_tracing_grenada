import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BaseDropdownButton extends HookWidget {
  final Widget icon;
  final Widget hint;
  final void Function(String) onChanged;

  const BaseDropdownButton({
    Key key,
    this.icon,
    this.hint,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gen = useState('');

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: icon,
              ),
              Expanded(
                child: DropdownButton<String>(
                  dropdownColor: Theme.of(context).cardTheme.color,
                  isDense: true,
                  icon: Container(),
                  underline: Container(),
                  isExpanded: true,
                  hint: hint ?? const Text('Gender'),
                  value: gen.value == '' ? null : gen.value,
                  onChanged: (update) {
                    gen.value = update;
                    return onChanged(update);
                  },
                  items: <String>[
                    'Male',
                    'Female',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
