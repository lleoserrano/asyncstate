import 'package:example/login/login_vm.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _loginVm = LoginVm();

  @override
  Widget build(BuildContext context) {
    final LoginVm(:login) = _loginVm;
    /* switch (status) {
      case AsyncValueStatus.idle:
        print('idle');
      case AsyncValueStatus.loading:
        print('loading');
      case AsyncValueStatus.error:
        print('error');
      case AsyncValueStatus.data:
        print('data');
    } */
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: login,
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
