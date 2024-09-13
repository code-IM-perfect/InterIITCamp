import 'package:flutter/material.dart';

class StaticData extends StatefulWidget {
  const StaticData({super.key});

  @override
  State<StaticData> createState() => _StaticDataState();
}

class _StaticDataState extends State<StaticData> {
  @override
  Widget build(BuildContext context) {
    return const Text("static");
  }
}
