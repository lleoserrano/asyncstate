import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

class GlobalCustomLoading extends AsyncOverlay {
  static const int idGlobalCustomLoading = 0;
  GlobalCustomLoading()
      : super(
          id: idGlobalCustomLoading,
          builder: (context) => Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width * .8,
              child: const LinearProgressIndicator(),
            ),
          ),
        );
}
