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
  3 - If you want, you can add a widget to "CustomLoader".<br />
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
      customLoader: const MyLoading(),

      builder: (navigatorObserver) => MaterialApp(
        themeMode: ThemeMode.dark,

        /// Here you need to pass the navigatorObserver to the MaterialApp
        navigatorObservers: [navigatorObserver],
        home: HomePage(),
      ),
    );
  }
}   
```

-------------------------------------------------------------------------------------

## The asyncronous loader call methods allow you to define a LoaderType, and pass the widget to be displayed.
```dart
  Future<void> loadMoreSnackBar() async {
    await Future.delayed(const Duration(seconds: 10)).asyncLoader(
      loaderType: LoaderType.snackBar,
      customLoader: const SnackBar(
        content: Text('Loading more...'),
        duration: Duration(seconds: 90),
      ),
    );
  }

  Future<void> loadMoreMaterialBanner() async {
    await Future.delayed(const Duration(seconds: 10)).asyncLoader(
      loaderType: LoaderType.materialBanner,
      customLoader: const MaterialBanner(
        content: Text('Loading more...'),
        actions: [SizedBox.shrink()],
      ),
    );
  }
```

-------------------------------------------------------------------------------------

# Mixin AsyncStateMixin

### `Methods`

<body>
  <b>callAsyncLoader</b> - Automatically call your loader during async calls.<br />
  <b>showMaterialBanner</b> - Allow you call the MaterialBanner on ScaffoldMessenger.<br />
  <b>showSnackBar</b> - Allow you call the SnackBar on ScaffoldMessenger.<br />
  <b>showDialog</b> - Allow you call the Dialog on showDialog.<br />
  <b>showBottomSheet</b> - Allow you call the BottomSheet on showBottomSheet.<br />
 </body>

------------------

```dart
class HomeController with AsyncStateMixin {
  
  Future goBack(Function callback) async {
    return await callAsyncLoader(
      Future.delayed(
        const Duration(seconds: 3),
        () {
          callback();
        },
      ),
    );
  }

Future<void> loginError() async {
    try {
      await _fakeError().asyncLoader();
    } catch (e) {
      showMaterialBanner(
        materialBanner: MaterialBanner(
          actions: const [
            SizedBox.shrink(),
          ],
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }
}
```

# Extension anywhere (.asyncLoader())
```dart
class HomeController{

   Future<bool> login() async {
    try {
      return await Future.delayed(const Duration(seconds: 3), () {
        return true;
      }).asyncLoader(
          customLoader: const MyCustomLoadingWidget(
        text: 'Sign in! Hold on!!!!',
      ));
    } catch (e) {
      // debugPrint(e.toString());
      return false;
    }
  }
}
```

  # Call in your View like this
  ```dart
  ElevatedButton(
    onPressed: () async {
      if (await controller.login()) {
    ///Use a Navigator to go to another page if your login is true
   ///You don't need to care about start of finish the loading, just what to do after or before!
       Navigator.push(
           context,
             MaterialPageRoute(
                builder: (context) => SecondPage(
                   controller: controller,
          )),
      );
   }
},
   child: const Text('Sign in!'),
)
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
 
