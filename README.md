<h1 align="center">Async Loader</h1>

<p align="center">
  <a href="https://flutter.dev">
    <img src="https://img.shields.io/badge/Platform-Flutter-02569B?logo=flutter"
      alt="Platform" />
  </a>
  <a href="">
    <img src="https://img.shields.io/badge/Donate-PayPal-00457C?logo=paypal"
      alt="Donate" />
  </a>
</p><br>


# Installing

### 1. Depend on it

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  async_loader: ^0.0.1
```

### 2. Install it

You can install packages from the command line:

with `pub`:

```
$ pub get
```

with `Flutter`:

```
$ flutter pub get
```

### 3. Import it

Now in your `Dart` code, you can use:

```dart
import 'package:asyncloader/asyncloader.dart;'
```
`OR For Mixin`
```dart
import 'package:asyncloader/mixin/async_loader.dart';
```
# Usage

`AsyncLoaderClass`:
```dart
void main() {
  AsyncLoaderClass.onInitAsyncLoaderState(
    defaultDialogWidget:
        const MyLoading(), //TODO Seta o Widget de loading inicial.
  );
  runApp(const MyApp());
}         
```
`Difine your Widget with Loading default.`

-------------------------------------------------------------------------------------
```dart
 class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      navigatorObservers: [
        AsyncLoaderClass.observer //TODO Here
      ], 
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
```
`Add "AsyncLoaderClass.observer" on MaterialApp.`

# Bugs or Requests

If you encounter any problems feel free to open an [issue](). If you feel the library is missing a feature, please raise a [ticket](https://github.com/DevLSerrano/asyncloader/pulls) on GitHub and I'll look into it. Pull request are also welcome.

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

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->
 
