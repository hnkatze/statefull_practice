import 'package:flutter/material.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom(
      {super.key,
      required this.title,
      required this.onChanged,
      required this.onChanged2});

  final String title;
  final Function(int) onChanged;
  final VoidCallback onChanged2;
  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: _controller,
        onChanged: (value) {
          final intValue = int.parse(value);
          widget.onChanged(intValue);
          widget.onChanged2();
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: widget.title,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
