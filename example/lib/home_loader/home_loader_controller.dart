import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/global_custom_loader_snackbar.dart';
import 'package:example/components/global_custom_loading.dart';
import 'package:flutter/material.dart';

sealed class HomeLoaderController {
  static bool isLogged = false;

  static Future<void> loginSuccess() async {
    final result = await _functionSuccess().asyncLoader();
    debugPrint('Login Success result: $result');
  }

  static Future<String> _functionSuccess() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Success';
  }

  static Future<void> loginFailure() => _functionFailure().asyncLoader();

  static Future<void> loginPersonalizedLoader() async =>
      await _functionSuccess().asyncLoader(
        asyncOverlay: GlobalCustomLoading(),
      );

  static Future<void> loadMorePersonalized() async {
    await _functionFailure().asyncLoader(
      asyncOverlay: HomeCustomLoaderSnackbar(),
    );
  }

  static Future<void> _functionFailure() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Someone happens!');
  }

  static Future<void> loginSuccessHandler() async {
    AsyncState.show();
    final result = await _functionSuccess();
    debugPrint('Login Success result: $result');
    AsyncState.hide();
  }

  static Future<void> loginFailureHandler() async {
    AsyncState.show();
    await _functionFailure().asyncLoader();
    AsyncState.hide();
  }
}
