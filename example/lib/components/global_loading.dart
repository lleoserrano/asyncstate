import 'package:flutter/material.dart';

class GlobalLoading extends StatelessWidget {
  const GlobalLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: FlutterLogo(
            size: 100,
            style: FlutterLogoStyle.stacked,
          ),
        ),
      ),
    );
  }
}
