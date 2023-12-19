import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

class LoaderFetchData extends AsyncOverlay {
  static const int idLoaderFetchData = 3;

  LoaderFetchData()
      : super(
          id: idLoaderFetchData,
          builder: (context, settings) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Align(
                alignment: Alignment.topRight,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Colors.blueAccent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 24,
                          child: CircularProgressIndicator.adaptive(),
                        ),
                        const Text('\nCurrent Data...'),
                        const SizedBox(
                          height: 24,
                        ),
                        ValueListenableBuilder(
                          valueListenable: settings,
                          builder: (context, settings, widget) => Text(
                            settings.arguments?.toString() ?? 'Empty',
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Text('\nFetching new data...'),
                        const SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        );
}
