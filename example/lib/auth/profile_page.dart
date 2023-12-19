import 'package:asyncstate/asyncstate.dart';
import 'package:example/auth/widgets/loader_fetch_data.dart';
import 'package:example/auth/widgets/loader_login.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tap to see 2 loaders running'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                AsyncState.show(asyncOverlay: LoaderLogin());
                await Future.delayed(const Duration(seconds: 3));
                LoaderLogin.tooltipController.show();
                await Future.delayed(const Duration(seconds: 3));
                AsyncState.hide(id: LoaderLogin.idLoaderLogin);
              },
              child: const Text('Loader Fetch Data and Login'),
            ),
            const Text('Tap to see an positioned loader'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                AsyncState.show(asyncOverlay: LoaderFetchData());
                await Future.delayed(const Duration(seconds: 3));
                AsyncState.hide(id: LoaderFetchData.idLoaderFetchData);
              },
              child: const Text('Loader Fetch Data and Login'),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text('Both and Communicate'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                // AsyncState.show(asyncOverlay: LoaderLogin());
                //or
                await Future.delayed(
                  const Duration(seconds: 2),
                  () {
                    return {
                      'email': 'emailWrong.com',
                      'pass': 'abc123',
                    };
                  },
                ).asyncLoader(
                  asyncOverlay: LoaderLogin(),
                  autoHide: false,
                );

                ///--///--///
                await Future.delayed(
                  const Duration(seconds: 3),
                  () {
                    return {
                      'email': 'EmailCorrect.com',
                      'pass': 'abc123',
                    };
                  },
                ).asyncLoader(
                  asyncOverlay: LoaderFetchData(),
                );

                ///--///--///
                LoaderLogin.tooltipController.show();
                await Future.delayed(const Duration(seconds: 3));
                AsyncState.hide(id: LoaderLogin.idLoaderLogin);
              },
              child: const Text('Both loaders'),
            ),
          ],
        ),
      ),
    );
  }
}
