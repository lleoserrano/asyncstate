import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

class HomeCustomLoaderSnackbar extends AsyncOverlay {
  static const int idHomeCustomLoaderSnackbar = 1;

  HomeCustomLoaderSnackbar()
      : super(
          id: idHomeCustomLoaderSnackbar,
          builder: (context) => Scaffold(
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
          ),
        );
}
