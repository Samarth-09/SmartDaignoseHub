// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class outcome extends StatefulWidget {
  static int? result;
  const outcome({super.key});

  @override
  State<outcome> createState() => _outcomeState();
}

class _outcomeState extends State<outcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('${outcome.result}'));
  }
}

