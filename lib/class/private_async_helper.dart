import 'package:flutter/material.dart';

@protected
final class PrivateAsyncHelper {
  static late BuildContext context;
  static late BuildContext internalDialogContext;
  static late String currentRouteName;
}

 
/* 
class MyPopEntry extends PopEntry {
  @override
  ValueListenable<bool> get canPopNotifier {
    print('Call canPopNotifier');
    return ValueNotifier(false);
  }

  @override
  PopInvokedCallback? get onPopInvoked => (canPop) {
        print('Pop Invoked');
      };
} */
