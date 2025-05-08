import 'package:asyncstate/asyncstate.dart';
import 'package:example/components/global_custom_loading.dart';
import 'package:example/detail/detail_exception.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Here we cath the error and show by detail_exception_handler'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                context.showLoader(
                  loader: const GlobalCustomLoading(),
                );
                await errorCall();
                context.closeLoader();
              },
              child: const Text('Loader Error  '),
            ),
            const Divider(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[900],
              ),
              onPressed: () async {
                Navigator.of(context).pushNamed('/Home/Detail/SecondDetail');
              },
              child: const Text('Go to Second Detail Page'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> errorCall() async {
    await Future.delayed(const Duration(seconds: 2));
    throw DetailException('Error On Detail Page');
  }
}

class SecondDetailPage extends StatelessWidget {
  const SecondDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Detail Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'This page is just so you can see that browsing does not affect the handling of “Exceptions” or “Loaders”.'),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context)
                    .popUntil((route) => route.settings.name == '/Home');
              },
              child: const Text('Go back Home'),
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
              },
              child: const Text('Go back Detail Page'),
            ),
          ],
        ),
      ),
    );
  }
}
