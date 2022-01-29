import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/my_loadig.dart';

class HomeController with AsyncStateMixin {
  ///Method that simulates a login
  Future<bool> loginSuccess() async {
    try {
      return await Future.delayed(const Duration(seconds: 3), () {
        return true;
      }).asyncLoader(
          customLoader: const MyLoading(
        texto: 'I am a custom loader!!!!!!!\nSign in!!',
      ));
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
      rethrow;
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
    /// Neste casa não precisamos colocar ".asyncLoader()" pois as funções principais "isValidUser" e "loginSuccess" já possuem.
    return await isValidUser().then((value) async {
      return await loginSuccess();
    });
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
