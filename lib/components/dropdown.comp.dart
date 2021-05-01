import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DropDownListComponent extends HookWidget {
  final void Function(String) onChanged;
  const DropDownListComponent({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gen = useState('');
    return DropdownButton<String>(
      value: gen.value == '' ? null : gen.value,
      hint: Text('Gender'),
      icon: Container(),
      isExpanded: true,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      onChanged: (value) {
        gen.value = value;
        onChanged(value);
      },
      items: <String>[
        'Male',
        'Female',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 18),
          ),
        );
      }).toList(),
    );
  }
}
