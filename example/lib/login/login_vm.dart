import 'dart:math';

import 'package:asyncstate/asyncstate.dart';
import 'package:example/login/login_state.dart';
import 'package:example/login/widgets/login_loader_vm.dart';

class LoginVm {
  final status = LoginStateStatus.idle.asyncValue();

  Future<void> login() async {
    ///Change status to loading
    status.value = LoginStateStatus.loading;

    ///Fake function
    await Future.delayed(const Duration(seconds: 1), () {
      ///Random answer to change status
      final random = Random().nextInt(10);

      if (random < 4) {
        status.value = LoginStateStatus.loaded;
      } else if (random < 8) {
        status.value = LoginStateStatus.error;
      } else {
        status.value = LoginStateStatus.needActivation;
      }
    }).asyncLoader(
      autoHide: false,
      asyncOverlay: LoginLoaderVm(this),
    );

    ///Do something or wait for user action/read
    await Future.delayed(const Duration(milliseconds: 500), () {});
    AsyncState.hide(id: LoginLoaderVm.myId);
  }
}
