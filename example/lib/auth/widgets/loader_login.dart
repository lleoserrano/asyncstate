import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';

class LoaderLogin extends AsyncOverlay {
  static final _myKey = GlobalKey(debugLabel: 'LoaderLogin');
  static final tooltipController = OverlayPortalController();
  static const int idLoaderLogin = 2;
  LoaderLogin()
      : super(
          id: idLoaderLogin,
          builder: (context, settings, communicate) => OverlayPortal(
            controller: tooltipController,
            overlayChildBuilder: (context) {
              RenderBox box =
                  _myKey.currentContext?.findRenderObject() as RenderBox;
              Offset position = box.localToGlobal(Offset.zero);
              return Positioned(
                top: position.dy + kToolbarHeight,
                left: position.dx,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    color: Colors.blueGrey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                        'Wait more some seconds... 😖 \nReceived Argument:\n\n${settings?.arguments}'),
                  ),
                ),
              );
            },
            child: Center(
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                  color: Colors.red,
                ),
                child: SizedBox(
                  key: _myKey,
                  width: 100,
                  height: kToolbarHeight,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24,
                        child: CircularProgressIndicator.adaptive(),
                      ),
                      Text('Login...'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
}
