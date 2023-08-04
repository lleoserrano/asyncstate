import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class MyCustomLoading extends StatelessWidget {
  const MyCustomLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.hexagonDots(
      color: Colors.blue,
      size: 60,
    );
  }
}
