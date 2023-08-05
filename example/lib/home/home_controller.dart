import 'package:asyncstate/asyncstate.dart';
<<<<<<< Updated upstream
import 'package:asyncstate/class/async_value.dart';
import 'package:example/components/my_loadig.dart';

import '../model/user_model.dart';
=======
import 'package:example/components/my_custom_loading.dart';
import 'package:flutter/material.dart';
>>>>>>> Stashed changes

class HomeController with AsyncStateMixin {
  final myUser = User().asyncValue();
  final userNull = AsyncValue<User?>(null);

  Future<void> userSuccess() async {
    myUser.setLoading();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        myUser.setSuccess(
          User(name: 'Dash Flutter bird'),
        );
      },
    );
  }

  Future<void> userError() async {
    myUser.setLoading();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        myUser.setError('Error on get User');
      },
    );
  }

  ///Method that simulates a login
  Future<bool> loginSuccess() async {
    try {
      return await Future.delayed(const Duration(seconds: 3), () {
        return true;
      }).asyncLoader(
<<<<<<< Updated upstream
          customLoader: const MyLoading(
        texto: 'I am a custom loader!!!!!!!\nSign in!!',
      ));
=======
        customLoader: const MyCustomLoading(),
      );
>>>>>>> Stashed changes
    } catch (e) {
      // debugPrint(e.toString());
      return false;
    }
  }

  ///Method that simulates a login error
  Future<void> loginError() async {
    try {
      await _fakeError().asyncLoader();
    } catch (e) {
      showMaterialBanner(
        materialBanner: MaterialBanner(
          actions: const [
            SizedBox.shrink(),
          ],
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  Future<void> _fakeError() async {
    await Future.delayed(const Duration(seconds: 3), () {
      throw ('Check your user or passowrd and try again!');
    });
  }

  ///Check if the user is valid
  Future<bool> isValidUser() async {
    return await Future.delayed(const Duration(seconds: 3), () {
      return true;
    }).asyncLoader();
  }

  /// Use 2 methods valid and login
  Future<bool> isValidUserAndLogin() async {
    ///In this case we don't need to put ".asyncLoader()" because the main functions "isValidUser" and "loginSuccess" already have.
    return await isValidUser().then((value) async {
      return await loginSuccess();
    });
  }

  /// Use 2 methods valid and login
  Future<void> loadMoreSnackBar() async {
    await Future.delayed(const Duration(seconds: 10)).asyncLoader(
      loaderType: LoaderType.snackBar,
      customLoader: const SnackBar(
        content: Text('Loading more...'),
        duration: Duration(seconds: 90),
      ),
    );
  }

  /// Use 2 methods valid and login
  Future<void> loadMoreMaterialBanner() async {
    await Future.delayed(const Duration(seconds: 10)).asyncLoader(
      loaderType: LoaderType.materialBanner,
      customLoader: const MaterialBanner(
        content: Text('Loading more...'),
        actions: [SizedBox.shrink()],
      ),
    );
  }

  Future<void> isValidUserAndLoginError() async {
    return await isValidUser().then((value) async {
      await loginError();
    });
  }

  Future goBack(Function callback) async {
    return await Future.delayed(const Duration(seconds: 3), () {
      callback();
    });
  }
}
