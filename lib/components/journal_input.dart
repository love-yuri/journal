import 'package:flutter/material.dart';

class JournalInput extends StatefulWidget {
  JournalInput({super.key, this.onChanged});
  final _controller = TextEditingController();
  final void Function(String)? onChanged;

  @override
  State<StatefulWidget> createState() {
    return _JournalInputState();
  }

  String? get text => _controller.text;
  set text (text) => _controller.text = text;
}

class _JournalInputState extends State<JournalInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      controller: widget._controller,
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

class JournalInputModel extends ChangeNotifier {
  String _text = '';
  String get text => _text;

  void onChanged(String value) {
    _text = value;
    notifyListeners();
  }
}
