import 'package:flutter/material.dart';

class GenericLoaderWidget extends StatelessWidget {
  const GenericLoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const SizedBox(
        width: 50,
        height: 50,
        child: Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
