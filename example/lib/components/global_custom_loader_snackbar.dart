import 'package:flutter/material.dart';

class GlobalCustomLoaderSnackbar extends StatelessWidget {
  const GlobalCustomLoaderSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: kToolbarHeight,
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(.8),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text('Loading...'),
        ),
      ),
    );
  }
}
