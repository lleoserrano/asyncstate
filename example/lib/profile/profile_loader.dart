import 'package:flutter/material.dart';

class ProfileLoader extends StatelessWidget {
  const ProfileLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: kToolbarHeight,
        width: double.infinity,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Text(
            'Searching user...',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
