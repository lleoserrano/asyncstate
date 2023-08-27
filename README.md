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

# Usage 
 <body>
  1 - Wrap your MaterialApp Or CurpertinoApp with the AsyncStateBuilder.<br />
  2 - Get the "navigatorObserver" from the builder function and add it to your component's "navigatorObservers".<br />
  3 - If you want, you can add a widget to "CustomLoader", exceptionHandlers or disable the log.<br /> 
 </body>

--------------
`Code example:`
```dart
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Here you need to wrap your MaterialApp with the AsyncStateBuilder
    return AsyncStateBuilder(
      /// Here you can customize your default loading that will show every transaction
      /// Leave it and it will show a simple CircularProgress.adaptive indicator
      customLoader: const GlobalLoading(),

      /// Here you can enable or disable the log
      enableLog: true,

      ///You can customize your exceptions handlers for route
      exceptionHandlers: {
        '_': GlobalExceptionHandler(),
        '/Home/Detail': DetailExceptionHandler(),
      },
      builder: (navigatorObserver) => MaterialApp(
        themeMode: ThemeMode.dark,
        theme: ThemeData.dark(),

        /// Here you need to pass the navigatorObserver to the MaterialApp
        navigatorObservers: [navigatorObserver],
        initialRoute: '/Home',
        routes: {
          '/Home': (context) => const HomePage(),
          '/Home/Detail': (context) => const DetailPage(),
          '/Home/Detail/SecondDetail': (context) => const SecondDetailPage(),
        },
      ),
    );
  }
} 
```

-------------------------------------------------------------------------------------
# Attention
### All methods allow you to customize the “loader”, when you change the "enum LoaderType", you need to ensure that the "customLoader" is already a widget of the same type.
-------------------------------------------------------------------------------------
# Method - (Extension) asyncState
###  Use the “asyncState” extension in asynchronous calls, you won't have to worry about opening or closing the “loader”.
```dart
 Future<void> loginSuccess() async {
    final result = await _functionSuccess().asyncLoader();
    debugPrint('Login Success result: $result');
  }

///Personalized
Future<void> loadMorePersonalized() async {
    await _functionFailure().asyncLoader(
      customLoader: HomeCustomLoaderSnackbar(),
      loaderType: LoaderType.snackBar,
    );
  }
```
-------------------------------------------------------------------------------------
# Method - (Class OR Context Extension) AsyncLoaderHandler
### The "AsyncLoaderHandler" method, allows you to have control over the open loader. Don't worry about “exceptions”, "asyncState" will close the loader if an “exception” is raised before you call “close”.
```dart
 Future<void> loginSuccessHandler() async {
    final handler = AsyncLoaderHandler.start();
    final result = await _functionSuccess().asyncLoader();
    debugPrint('Login Success result: $result');
    handler.close();
  }

///OR On View
 ElevatedButton(
  onPressed: () async {
    context.startAsyncStateLoader();
    await errorCall();
    context.closeAsyncStateLoader();
  },
  child: const Text('Loader Error by context'),
),
```
-------------------------------------------------------------------------------------
# Method - (Interface Class) AsyncStateExceptionHandler
### You can create a class that extends "AsyncStateExceptionHandler", with it, you can handle “exceptions” automatically and per route.
#### It is necessary to check the "exception.runtimeType", or it will execute the action in any “exception”.
```dart
class DetailExceptionHandler implements AsyncStateExceptionHandler {
  @override
  void onException(
    Object exception,
    StackTrace stackTrace,
    BuildContext context,
  ) {
    switch (exception.runtimeType) {
      case DetailException:
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              exception.toString(),
            ),
          ),
        );
      case _:
        log(exception.toString());
        break;
    }
  }
}
```
### On Main
#### In “main”, you can define a specific “AsyncStateExceptionHandler” for each route. The “_” is global, it will be used if the current route does not have a unique “AsyncStateExceptionHandler”.
```dart
 ///You can customize your exceptions handlers for route
exceptionHandlers: {
  '_': GlobalExceptionHandler(),
  '/Home/Detail': DetailExceptionHandler(),
},
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
  </tr>
</table>

If you like what I do, maybe consider buying me a coffee/tea 🥺👉👈

<a href="https://www.buymeacoffee.com/leonardoserrano" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/v2/default-red.png" alt="Buy Me A Coffee" width="150" ></a>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
 
