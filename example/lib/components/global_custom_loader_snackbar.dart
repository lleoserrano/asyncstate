import 'package:flutter/material.dart';

class HomeCustomLoaderSnackbar extends SnackBar {
  HomeCustomLoaderSnackbar({
    super.key,
  }) : super(
          content: const Text('Loading...'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        );
}
