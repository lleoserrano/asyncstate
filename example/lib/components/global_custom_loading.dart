import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

class GlobalCustomLoading extends AsyncOverlay {
  static const int idGlobalCustomLoading = 0;
  GlobalCustomLoading()
      : super(
          id: idGlobalCustomLoading,
          builder: (context, settings) => Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * .5,
              child: const LinearProgressIndicator(),
            ),
          ),
        );
}
