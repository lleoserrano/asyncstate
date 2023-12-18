import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

class LoaderFetchData extends AsyncOverlay {
  static const int idLoaderFetchData = 3;

  LoaderFetchData()
      : super(
            id: idLoaderFetchData,
            builder: (context, settings, communicate) {
              return const Padding(
                padding: EdgeInsets.all(24.0),
                child: Align(
                    alignment: Alignment.topRight,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: Colors.blueAccent,
                      ),
                      child: SizedBox(
                        height: kToolbarHeight * 2,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 24,
                                child: CircularProgressIndicator.adaptive(),
                              ),
                              Text('Positioned\nFetching Data...'),
                            ],
                          ),
                        ),
                      ),
                    )),
              );
            });
}
