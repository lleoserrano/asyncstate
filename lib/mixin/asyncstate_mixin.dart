import 'package:flutter/material.dart';
import '../asyncstate.dart';

/// Just a mixing class to call the async loader
mixin AsyncStateMixin<T> {
  Future<T> callAsyncLoader(
    Future<T> futureFunction, {
    Widget? customLoader,
    LoaderType loaderType = LoaderType.alertDialog,
  }) async {
    return await asyncState.callAsyncLoader(
      futureFunction,
      customLoader: customLoader,
    );
  }

  Future<ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason>>
      showMaterialBanner({required MaterialBanner materialBanner}) async {
    return ScaffoldMessenger.of(asyncState.context!)
        .showMaterialBanner(materialBanner);
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
      {required SnackBar snackBar}) {
    return ScaffoldMessenger.of(asyncState.context!).showSnackBar(snackBar);
  }

  Future<T?> showDialog({
    required Widget child,
    bool barrierDismissible = false,
  }) async {
    return await showDialog(
      barrierDismissible: barrierDismissible,
      child: child,
    );
  }

  Future<T?> showBottomSheet({
    required Widget child,
    Color? backgroundColor,
    double? elevation,
    ShapeBorder? shape,
    Clip? clipBehavior,
    Color? barrierColor,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
    bool useRootNavigator = false,
    Offset? anchorPoint,
    AnimationController? transitionAnimationController,
    RouteSettings? routeSettings,
    BoxConstraints? constraints,
    bool? showDragHandle,
    bool useSafeArea = false,
  }) async {
    return await showModalBottomSheet(
      context: asyncState.context!,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      transitionAnimationController: transitionAnimationController,
      routeSettings: routeSettings,
      anchorPoint: anchorPoint,
      constraints: constraints,
      showDragHandle: showDragHandle,
      useSafeArea: useSafeArea,
      builder: (_) => child,
    );
  }
}
