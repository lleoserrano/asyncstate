import 'package:example/home/home_controller.dart';
import 'package:example/home/second_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              await controller.userSuccess();
            },
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () async {
              await controller.userError();
            },
            backgroundColor: Colors.red,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
          ),
          controller.myUser.build(
            loading: () => const CircularProgressIndicator(),
            error: (e) => Text('$e <= Este é o Erro'),
            success: (user) => Text('${user.name!} <= Este é o User'),
          ),
          Divider(),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                if (await controller.loginSuccess()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondPage(
                              controller: controller,
                            )),
                  );
                }
              },
              child: const Text('Sign in with redirect page'),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                await controller.loginError();
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Failed to login! try again alter'),
                        Text(e.toString()),
                      ],
                    ),
                  ),
                );
              }
            },
            child: const Text('Login fail test'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (await controller.isValidUser()) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Success'),
                    Text('This is a valid user'),
                  ],
                )));
              }
            },
            child: const Text('Success sign in'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (await controller.isValidUserAndLogin()) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondPage(
                            controller: controller,
                          )),
                );
              }
            },
            child: const Text('Validate user and redirect page'),
          ),
          ElevatedButton(
            onPressed: () async {
              await controller.loadMoreSnackBar();
            },
            child: const Text('LoadMore SnackBar'),
          ),
          ElevatedButton(
            onPressed: () async {
              await controller.loadMoreMaterialBanner();
            },
            child: const Text('LoadMore MaterialBanner'),
          ),
        ],
      ),
    );
  }
}
