import 'package:asyncstate/asyncstate.dart';
import 'package:example/home_async_value/model/user_model.dart';
import 'package:flutter/material.dart';

class CurrentSession extends AsyncValue<User?> {
  CurrentSession(
    super.value,
  );

  Future<void> logout() async {
    setLoading();
    await Future.delayed(const Duration(seconds: 2));
    value = null;
    setSuccess();
  }

  Future<void> login() async {
    setLoading();
    await Future.delayed(const Duration(seconds: 2));
    value = User(name: 'New user name');
    setSuccess();
  }

  Widget buildForBody() {
    return build(
      onLoading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      onError: (e, s) => Center(
        child: Text(e.toString()),
      ),
      onSuccess: (me) => switch (me) {
        User(:final name) => Center(
            child: Text(name + ' - For Body'),
          ),
        null => const Center(
            child: Text('No user'),
          ),
      },
    );
  }

  Widget buildForAppBar() {
    return build(
      onLoading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      onError: (e, s) => Center(
        child: Text(e.toString()),
      ),
      onSuccess: (me) => switch (me) {
        User(:final name) => Center(
            child: Text(name + ' - For App'),
          ),
        null => const Center(
            child: Text('No user'),
          ),
      },
    );
  }
}
