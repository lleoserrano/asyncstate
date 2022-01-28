import 'package:flutter/material.dart';

class MyLoading extends StatelessWidget {
  final String? texto;
  const MyLoading({Key? key, this.texto}) : super(key: key);

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
            texto ?? 'Carregando',
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
