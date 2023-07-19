import 'package:flutter/material.dart';

class ResuableRow extends StatelessWidget {
  String title, value;
  ResuableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(title), Text(value)],
            ),
          ),
        ],
      ),
    );
  }
}
