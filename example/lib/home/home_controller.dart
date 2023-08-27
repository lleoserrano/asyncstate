import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/global_custom_loader_snackbar.dart';
import 'package:example/components/global_custom_loading.dart';
import 'package:example/home/home_exception_model.dart';
import 'package:flutter/material.dart';

class HomeController {
  Future<void> loginSuccess() async {
    final result = await _functionSuccess().asyncLoader();
    debugPrint('Login Success result: $result');
  }

  Future<String> _functionSuccess() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Success';
  }

  Future<void> loginFailure() => _functionFailure().asyncLoader();

  Future<void> loginPersonalizedLoader() async =>
      await _functionSuccess().asyncLoader(
        customLoader: const GlobalCustomLoading(),
      );

  Future<void> loadMorePersonalized() async {
    await _functionFailure().asyncLoader(
      customLoader: HomeCustomLoaderSnackbar(),
      loaderType: LoaderType.snackBar,
    );
  }

  Future<void> _functionFailure() async {
    await Future.delayed(const Duration(seconds: 2));
    throw HomeExceptionModel('Someone happens!');
  }

  Future<void> loginSuccessHandler() async {
    final handler = AsyncLoaderHandler.start();
    final result = await _functionSuccess().asyncLoader();
    debugPrint('Login Success result: $result');
    handler.close();
  }

  Future<void> loginFailureHandler() async {
    final handler = AsyncLoaderHandler.start();
    await _functionFailure().asyncLoader();
    handler.close();
  }
}
