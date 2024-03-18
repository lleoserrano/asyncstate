<h1 align="center">Async State</h1>

<p align="center">
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
      alt="Platform" />
  </a>
</p><br>
<p align="center">
  <a href="">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=iOS"
      alt="iOS" />
  </a>
  <a href="">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=Android"
      alt="Android" />
  </a>
  <a href="">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=macOS"
      alt="Mac" />
  </a><a href="">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=Linux"
      alt="Linux" />
  </a>
   </a><a href="">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=Windows"
      alt="Windows" />
  </a>
</p><br>

<!-- # Where this package works!
 [x] **Android** <br>
 [x] **IOS**<br>
 [x] **Web**<br>
 [x] **Macos**<br>
 [-] **Linux** (not tested yet)<br> 
 [-] **Windows** (not tested yet)<br>-->

 
# Importante
 <body>
  1 - The package uses the application's main navigator, so commands like "dart Navigator.of(context).pop()" can close the loader.<br />
  2 - The "Asyncvalue" class extends "ValueNotifier" and adds some extra functions, so the same precautions must be taken when using, such as calling "dispose".<br />
  3 - Don't worry if you call a "loade"r with another "loader" already open, the "asyncState" will just update the internal widget if necessary.<br />
  - 3.1 - This means there will be no impact from opening and closing, and you can pass a custom "loader" to change, indicating another type of wait.<br /> 
 </body>
 
# Usage 
 <body>
  1 - Wrap your MaterialApp Or CurpertinoApp with the AsyncStateBuilder.<br />
  2 - Get the "navigatorObserver" from the builder function and add it to your component's "navigatorObservers".<br />
  3 - If you want, you can add a widget to "loader", or do something in "onError" function.<br /> 
 </body>

-------------------------------------------------------------------------------------
```dart
@override
  Widget build(BuildContext context) {
    /// Here you need to wrap your MaterialApp with the AsyncStateBuilder
    return AsyncStateBuilder(
      /// Here you can customize your default loading that will show every transaction
      /// Leave it and it will show a simple CircularProgress.adaptive indicator
      loader: const GlobalLoading(),
      onError: (error, stackTrace, context, routeSettings) {
        /// Here you can handle your exceptions
        switch (routeSettings?.name ?? '') {
          case '/Detail':
            DetailPageHandlerException.onError(
              error,
              stackTrace,
              context,
              routeSettings,
            );
            break;
          case _:
            ScaffoldMessenger.of(context!).showSnackBar(
              SnackBar(
                content: Text(
                  error.toString(),
                ),
              ),
            );
            break;
        }
      },
      builder: (navigatorObserver) => MaterialApp(
        navigatorObservers: [navigatorObserver],
        themeMode: ThemeMode.dark,
        theme: ThemeData.dark(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeLoaderPage(),
          '/Detail': (context) => const DetailPage(),
          '/Profile': (context) => const ProfilePage()
        },
      ),
    );
  }
```
-------------------------------------------------------------------------------------
# Method - (Extension) asyncLoader 
###  Use the “asyncLoader” in asynchronous calls, you won't have to worry about opening or closing the “loader”.
```dart
await Future.delayed(const Duration(seconds: 2)).asyncLoader();

///Personalized
await Future.delayed(const Duration(seconds: 2)).asyncLoader(
  loader: const GlobalCustomLoading(),
);
```
-------------------------------------------------------------------------------------
# Method - (Extension) asyncLazyLoader 
###  Use the “asyncLazyLoader” in asynchronous calls, it will maintain your loader opened so you can do something.
```dart
await Future.delayed(const Duration(seconds: 2)).asyncLazyLoader();

// You can close by calling "AsyncLoader.hide()".
// Or calling "asyncLoader" in another function, and it will take care of closing.

await AsyncLoader.hide();
//OR
await Future.delayed(const Duration(seconds: 2)).asyncLoader();
```
-------------------------------------------------------------------------------------
# Method - (Extension) asyncAwaitLoader 
###  Use the “asyncAwaitLoader” in asynchronous calls, it will call the loader only after the future was solved.
```dart
 await Navigator.of(context).pushNamed('/Detail').asyncAwaitLoader();
// Here, we open the loader when we return from a page, to process the data received.
debugPrint('Detail Page Closed - Do something here');
await Future.delayed(const Duration(seconds: 2));
await AsyncLoader.hide();
```

-------------------------------------------------------------------------------------
# Function - OnError
### The "onError" method, in "AsyncStateBuilder", allows you to handle application errors, generic or via routes, with access to parameters such as context, stackTrace, error and routeSettings.
```dart
onError: (error, stackTrace, context, routeSettings) {
        /// Here you can handle your exceptions
        switch (routeSettings?.name ?? '') {
          case '/Detail':
            DetailPageHandlerException.onError(
              error,
              stackTrace,
              context,
              routeSettings,
            );
            break;
          case _:
            ScaffoldMessenger.of(context!).showSnackBar(
              SnackBar(
                content: Text(
                  error.toString(),
                ),
              ),
            );
            break;
        }
      },
```
-------------------------------------------------------------------------------------
# Handler - AsyncLoader (Show or Hide)
### You can use "AsyncLoader.show()" and "AsyncLoader.hide()" to control the loader dynamically.
```dart
await AsyncLoader.show();
await Future.delayed(const Duration(seconds: 2)).asyncLazyLoader();
await AsyncLoader.hide();
```
-------------------------------------------------------------------------------------
 # Type - AsyncValue
#### "AsyncValue" is a class that extends "ValueNotifier" and adds some functions to help you, additionally methods for state control such as "Success", "Loading" and "Error", and shortcuts for quick definition.
###### All methods like "setSuccess", "setError", "setLoading" e "refresh" call "notifyListener" automatically.
```dart
  final _userModel = AsyncValue<UserModel?>(null);
  final _isLoading = false.asyncValue();

// Method like
_isLoading.setSuccess(false);
_isLoading.setLoading();
_isLoading.setError(error: MyException(), stackTrace: MyStackTrace());
//or
_userModel.setSuccess(UserModel(name: 'Leonardo Serrano'));

// And ".build" to UI
_userModel.build(
 onSuccess: (user) => Text('User: ${user?.name}'),
 onLoading: () => const CircularProgressIndicator(),
 onError: (error, stackTrace) => Text('Error: $error'),
),

// Or change the value using the ".value" and call ".refresh()".
_isLoading.value = false;
_isLoading.refresh();

```

# Bugs or Requests

If you encounter any problems feel free to open an [issue](https://github.com/DevLSerrano/asyncstate/issues). If you feel the library is missing a feature, please raise a [ticket](https://github.com/DevLSerrano/asyncstate/pulls) on GitHub and I'll look into it. Pull request are also welcome.

# Contributors

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://github.com/DevLSerrano"><img src="https://avatars.githubusercontent.com/u/62712813?v=4" width="100px;" alt=""/><br /><sub><b>Leonardo Serrano</b></sub></a><br /><a href="" title="Dev"></a></td>
    <td align="center"><a href="https://github.com/brasizza"><img src="https://avatars.githubusercontent.com/u/26041910?v=4" width="100px;" alt=""/><br /><sub><b>Marcus Brasizza</b></sub></a><br /><a href="" title="Dev"></a></td>
    <td align="center"><a href="https://github.com/felipecastrosales"><img src="https://avatars.githubusercontent.com/u/59374587" width="100px;" alt=""/><br /><sub><b>Felipe Sales</b></sub></a><br /><a href="" title="Dev"></a></td>
  </tr>
</table>

If you like what I do, maybe consider buying me a coffee/tea 🥺👉👈

<a href="https://www.buymeacoffee.com/leonardoserrano" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-red.png" alt="Buy Me A Coffee" width="150" ></a>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
 
