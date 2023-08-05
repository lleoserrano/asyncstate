import 'package:flutter/material.dart';

class MyLoading extends StatelessWidget {
  final String? text;
  const MyLoading({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const FlutterLogo(
          size: 40,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: Text(
            text ?? 'Loading content...',
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
