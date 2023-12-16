import 'package:asyncstate/asyncstate.dart';
import 'package:example/home_async_value/model/user_model.dart';

class HomeAsyncValueController {
  // First type of declaration
  final me = null.asyncValueN<User>();
  // Second type of declaration
  final secondMe = AsyncValue<User?>(null);
  // Third type of declaration
  final thirdMe = AsyncValue<User>(
    User(name: 'Third User'),
  );
  // Fourth type of declaration
  final fourthMe = User(name: 'Fourth User').asyncValue();

  Future<void> loadMe() async {
    // You can set the state of the AsyncValue
    me.setLoading();

    await Future.delayed(const Duration(seconds: 2));

    // You can update the value of the AsyncValue
    me.value = User(
      name: 'Async User',
    );

    // You can set the state of the AsyncValue
    me.setSuccess();
  }

  void updateInternal() {
    if (me.value != null) {
      // You can update the internal value of the AsyncValue, if your class allows it
      me.value?.name = 'Updated Async User';
      me.refresh();
    } else {
      me.setError(error: Exception('No user found - Null'));
    }
  }

  void dispose() {
    me.dispose();
    secondMe.dispose();
    thirdMe.dispose();
    fourthMe.dispose();
  }
}
