import 'package:flutter/material.dart';

class GlobalCustomLoading extends StatelessWidget {
  const GlobalCustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * .8,
        child: const LinearProgressIndicator(),
      ),
    );
  }
}
