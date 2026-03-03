![rest_app](https://user-images.githubusercontent.com/55942632/73445975-edf01d80-4381-11ea-9b8f-3bc57490c93f.png)

# Rest App - Flutter Restaurant App with Firebase Auth + Splash Screen

A beautiful restaurant app UI built with Flutter, featuring Firebase Authentication (Email/Password and Anonymous) and biometric login (Fingerprint / FaceID) support.

## Features

- Firebase Email/Password Authentication
- Anonymous Sign-In via Biometric Authentication (Fingerprint / FaceID)
- Stream-based auth state management with Provider
- Dark-themed restaurant UI inspired by Dribbble designs
- Null-safe codebase targeting Dart 3 / Flutter 3

## Screenshots

![rest_app](https://user-images.githubusercontent.com/55942632/73445975-edf01d80-4381-11ea-9b8f-3bc57490c93f.png)

## Prerequisites

- Flutter 3.10+ and Dart 3.0+
- A Firebase project with Authentication enabled
- Android: `google-services.json` placed in `android/app/`
- iOS: `GoogleService-Info.plist` placed in `ios/Runner/`

## Installation

1. **Clone the repository**

```bash
git clone https://github.com/theindianappguy/rest_app.git
cd rest_app
```

2. **Set up Firebase**

   - Create a Firebase project at [console.firebase.google.com](https://console.firebase.google.com)
   - Enable **Email/Password** and **Anonymous** sign-in methods under Authentication
   - Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) and place them in the paths listed above

3. **Install dependencies**

```bash
flutter pub get
```

4. **Run the app**

```bash
flutter run
```

## Project Structure

```
lib/
 |- main.dart                          # App entry point with Firebase init
 |- models/
 |   |- dart.dart                      # AppUser model
 |- screens/
 |   |- home.dart                      # Home screen after login
 |   |- wrapper.dart                   # Auth-state routing wrapper
 |   |- authenticate/
 |       |- authenticate.dart          # Toggle between SignIn / SignUp
 |       |- signin.dart                # Sign-in screen with biometric option
 |       |- signup.dart                # Sign-up screen
 |- services/
     |- auth_services.dart             # Firebase Auth service layer
```

## Created & Maintained By

[Sanskar Tiwari](https://github.com/theindianappguy) ([@indianappguy](https://twitter.com/indianappguy)) ([YouTube](https://www.youtube.com/c/SanskarTiwari))

> If you found this project helpful or you learned something from the source code and want to thank me,
> consider checking out what I am building at [MagicSlides.app](https://www.magicslides.app), [MagicForm.app](https://www.magicform.app) & [SheetAI.app](https://www.sheetai.app)

## License

    Copyright 2020 Sanskar Tiwari

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
