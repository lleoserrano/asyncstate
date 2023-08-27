## 2.0.2
- Implemented the  "AsyncLoaderHandler", this class allows you start the loader and close when necessary.
- Thanks @rodrigorahman for the idea and the code model.

## 2.0.1
- Improve the pop in the dialog and scaffold to prevent remove more than the navigation stack. 
- Thanks to @brasizza
- Fixed named parameter in builder.

## 2.0.0

- ##### Break Change
- Removed static methods.
- Now you must wrap the MaterialApp/CupertinoApp in the "AsyncStateBuilder", through which you can customize your loading widget and inject the "NavigatorObserver". Thanks @rodrigorahman for the idea.
- New "Enum LoaderType" that allows you to call different widgets for the view.
- New methods implemented in "AsyncStateMixin", now you can call dialog, snackbar, bottomSheet and materialBanner, directly from the class that uses the mixin.
- Flutter sdk: ">=3.0.0 <4.0.0"
- Update the README and examples.

## 1.0.0

- Improve the loading to be much more independent and customizable
- Thanks to @brasizza

## 0.0.5

- Build with Flutter 3.0.3

## 0.0.4

- Change the CupertinoActionSheet to CupertinoActivityIndicator, because the CircularProgress from android is CupertinoActivityIndicator in IOS!
- Thanks to @brasizza

## 0.0.3

- Fix issues
- Now it is not mandatory to start the class in main.
- You can define a new loader anywhere in the app.
- Native loader according to the platform (iOS,Android).

## 0.0.2

- Change the pubspec to increase the score and improve the example folder
- Now this package is full compatible with Ios, Android, Web, Macos
- Update Readme
- Thanks to @brasizza

## 0.0.1

- TODO: Describe initial release.
