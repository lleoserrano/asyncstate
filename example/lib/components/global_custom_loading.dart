import 'package:flutter/material.dart';

class GlobalCustomLoading extends StatelessWidget {
  const GlobalCustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const CircularProgressIndicator.adaptive(
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
