import 'package:asyncstate/asyncstate.dart';
import 'package:example/profile/profile_loader.dart';
import 'package:example/profile/user_model.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _userModel = AsyncValue<UserModel?>(null);
  final _isLoading = false.asyncValue();

  @override
  void dispose() {
    _userModel.dispose();
    _isLoading.dispose();
    super.dispose();
  }

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
            const Text('User status'),
            const SizedBox(
              height: 8,
            ),
            _userModel.build(
              onSuccess: (user) => Text('User: ${user?.name}'),
              onLoading: () => const CircularProgressIndicator(),
              onError: (error, stackTrace) => Text('Error: $error'),
            ),
            const SizedBox(
              height: 16,
            ),
            _isLoading.build(
              onSuccess: (isLogged) => Text('Is loading: $isLogged'),
              onLoading: () => const CircularProgressIndicator(),
              onError: (error, stackTrace) => Text('Error: $error'),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                _isLoading.setSuccess(true);
                await Future.delayed(const Duration(seconds: 2), () {
                  _userModel.setSuccess(UserModel(name: 'Leonardo Serrano'));
                }).asyncLoader(
                  loader: const ProfileLoader(),
                );
                _isLoading.setSuccess(false);
              },
              child: const Text('Call loading'),
            ),
          ],
        ),
      ),
    );
  }
}
