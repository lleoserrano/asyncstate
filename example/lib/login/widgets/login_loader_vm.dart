import 'package:asyncstate/asyncstate.dart';
import 'package:example/login/login_state.dart';
import 'package:example/login/login_vm.dart';
import 'package:flutter/material.dart';

class LoginLoaderVm extends AsyncOverlay {
  static const int myId = 123;
  LoginLoaderVm(LoginVm vm)
      : super(
          id: myId,
          builder: (context, settings) => ValueListenableBuilder(
              valueListenable: vm.status,
              builder: (context, status, widget) {
                return switch (status) {
                  LoginStateStatus.loading => const Center(
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  _ => Center(
                      child: Card(
                        color: switch (status) {
                          LoginStateStatus.error => Colors.red[900],
                          LoginStateStatus.loaded => Colors.green[900],
                          LoginStateStatus.needActivation => Colors.yellow[900],
                          _ => Colors.white,
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            switch (vm.status.value) {
                              LoginStateStatus.loading => 'Loading..',
                              LoginStateStatus.error => 'Ops, error.',
                              LoginStateStatus.loaded => 'Login Success',
                              LoginStateStatus.needActivation =>
                                'Need Activation...',
                              LoginStateStatus.idle => ''
                            },
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                };
              }),
        );
}
