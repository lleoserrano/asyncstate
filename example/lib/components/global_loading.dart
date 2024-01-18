import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

class GlobalLoading extends AsyncOverlay {
  static const idGlobalLoader = 0;
  GlobalLoading()
      : super(
          id: idGlobalLoader,
          builder: (context, settings) {
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
          },
        );
}
