import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/global_custom_loading.dart';
import 'package:example/home/home_exception_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  Future<void> loginSuccess() async {
    await _functionSuccess().asyncLoader(
      success: (result) async {
        debugPrint('Login Success result: $result');
      },
      error: (error) async {
        debugPrint('Login Error: $error');
      },
      complete: () async {
        debugPrint('Login Complete!');
      },
    );
  }

  Future<String> _functionSuccess() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Success';
  }

  Future<void> loginFailure() => _functionFailure().asyncLoader(
    success: (result) async {
      debugPrint('Login Success result!');
    },
    error: (error) async {
      debugPrint('Login Error: $error');
    },
    complete: () async {
      debugPrint('Login Complete!');
    },
  );

  Future<void> loginPersonalizedLoader() async =>
      await _functionSuccess().asyncLoader(loader: const GlobalCustomLoading());

  Future<void> loadMorePersonalized() async {
    /* await _functionFailure().asyncLoader(
      customLoader: HomeCustomLoaderSnackbar(),
      loaderType: LoaderType.snackBar,
    ); */
  }

  Future<void> _functionFailure() async {
    await Future.delayed(const Duration(seconds: 2));
    throw HomeExceptionModel('Someone happens!');
  }

  Future<void> loginSuccessHandler() async {
    AsyncState.showLoader();
    await _functionSuccess().asyncLoader(
      success: (result) async {
        debugPrint('Login Success result: $result');
      },
      error: (error) async {
        debugPrint('Login Error: $error');
      },
      complete: () async {
        debugPrint('Login Complete!');
      },
    );
  }

  Future<void> loginFailureHandler() async {
    await _functionFailure().asyncLoader();
  }

  /* Future<void> testeFunction() async {
    await Future.delayed(const Duration(seconds: 2)).asyncLoaderTest(
      success: (result) => debugPrint('Success: $result'),
      error: (error) => debugPrint('Error: $error'),
      complete: (result) => debugPrint('Complete: $result'),
    );
  } */
}
