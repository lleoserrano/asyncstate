import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/my_loadig.dart';

class HomeController with AsyncStateMixin {
  Future<bool> loginSucesso() async {
    try {
      return await Future.delayed(const Duration(seconds: 3), () {
        return true;
      }).asyncLoader(
          customLoader: const MyLoading(
        texto: 'Fazendo login!!!!',
      ));
    } on AsyncStateException catch (e) {
      print(e.exception);
      return false;
    }
  }

  Future<void> loginError() async {
    try {
      await _fakeError().asyncLoader();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _fakeError() async {
    await Future.delayed(const Duration(seconds: 3), () {
      throw ('Erro em seus dados.');
    });
  }

  Future<bool> isValidUser() async {
    return await Future.delayed(const Duration(seconds: 3), () {
      return true;
    }).asyncLoader();
  }

  Future<bool> isValidUserAndLogin() async {
    //TODO Neste casa não precisamos colocar ".asyncLoader()" pois as funções principais "isValidUser" e "loginSucesso" já possuem.
    return await isValidUser().then((value) async {
      return await loginSucesso();
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
    }).asyncLoader();
  }
}
