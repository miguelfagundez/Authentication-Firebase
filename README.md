# Authentication Firebase

Example project connecting Firebase using Clean Architecture & BloC.

## Getting Started

### Firebase console

**Step 1**  
Go to firebase console and login. Create a new project.

**Step 2**  
[Add Firebase to your Flutter app](https://firebase.google.com/docs/flutter/setup?platform=ios)
  * Install Flutter and favorite IDE (✔️)
  * [Install the required command line tools](https://firebase.google.com/docs/flutter/setup?platform=ios#install-cli-tools)
    * [Install the Firebase CLI](https://firebase.google.com/docs/cli#setup_update_cli)
    * [Log in and test the Firebase CLI](https://firebase.google.com/docs/cli#sign-in-test-cli)
  * **Install the FlutterFire CLI** using this command: `dart pub global activate flutterfire_cli`
  * (*Optional*, Only if need it) PATH problem: (*$HOME/.pub-cache/bin* is not on your path). Using this command: `export PATH="$PATH":"$HOME/.pub-cache/bin"`

**Step 3**
[Configure your apps to use Firebase](https://firebase.google.com/docs/flutter/setup?platform=ios#configure-firebase)
  * Execute this command: `flutterfire configure` and select platforms (android, ios, etc)

**Step 4**
[Initialize Firebase in your app]()
  * Execute this command: `flutter pub add firebase_core`

**Step 5**
In your `lib/main.dart` file, import the Firebase core plugin and the configuration file you generated earlier:

```dart
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
```

**Step 6**
Also in your `lib/main.dart` file, initialize Firebase using the DefaultFirebaseOptions object exported by the configuration file:

```dart
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
```

**Step 7**
Rebuild your Flutter application:
`flutter run`

🔴 Possible **Errors**:

* `firebase_core` requires a higher minimum iOS deployment verion. **Solution**: Open your iOS folder in XCode and search `Runner`->`General`->`Minimum Deployment`. You should change it depending on the minimum required.
* CocoaPod's spec repository is out-of-date to satisfy dependencies. **Solution**: Execute this command: `cd ios` and later execute this command: `pod repo update`.
  
