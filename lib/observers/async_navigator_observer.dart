import 'package:flutter/material.dart';
import '../asyncstate.dart';

class AsyncNavigatorObserver extends NavigatorObserver {
  //TODO essa classe observa os tipos de rotas (Push, pop etc) e atualiza o contexto do controller.

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    asyncState.setContext = navigator!.context;
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    asyncState.setContext = navigator!.context;
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    asyncState.setContext = navigator!.context;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    asyncState.setContext = navigator!.context;
  }
}
