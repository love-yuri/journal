import 'package:flutter/material.dart';

class JournalInput extends StatefulWidget {
  const JournalInput({super.key});

  @override
  State<StatefulWidget> createState() {
    return _JournalInputState();
  }
}

class _JournalInputState extends State<JournalInput> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_onTextChanged);
  }

  _onTextChanged() {
    debugPrint("Text field value: ${_controller.text}");
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: null,
      decoration: const InputDecoration(
        border: null,
        hintStyle: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        ),
        hintText: '请输入内容...',
      ),
      style: const TextStyle(
        fontSize: 18.0,
        color: Colors.black,
      ),
    );
  }
}
