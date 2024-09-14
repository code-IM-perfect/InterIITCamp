import 'package:flutter/material.dart';

class NotificationEditor extends StatefulWidget {
  const NotificationEditor({super.key});

  @override
  State<NotificationEditor> createState() => _NotificationEditorState();
}

class _NotificationEditorState extends State<NotificationEditor> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: FilledButton(
          onPressed: () {},
          child: const Text("Get Notification"),
        ),
      ),
    );
  }
}
