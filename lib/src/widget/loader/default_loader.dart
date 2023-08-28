import 'package:flutter/material.dart';

class DefaultLoader extends StatelessWidget {
  const DefaultLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 50,
      height: 50,
      child: Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
