import 'package:asyncstate/asyncstate.dart';
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
                await errorCall().asyncLoader();
              },
              child: const Text('Loader Error  '),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> errorCall() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Error On Detail Page');
  }
}
