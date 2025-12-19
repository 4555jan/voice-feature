# voice intent dummy app
clone repository
`git clone `

`cd voice-feature`

`flutter pub get`

`flutter build apk --release`

`adb install -r build/app/outputs/flutter-apk/app-release.apk`

ADB Test Commands
1. Open Add Split Screen (Empty)

 `adb shell am start -a com.demo.action.ADD_SPLIT`

3. Open Add Split Screen (With Pre-filled Value)

`adb shell am start -a com.demo.action.ADD_SPLIT --es android.intent.extra.TEXT "300"`// or any number

Google Assistant Integration
App published to Google Play Store (Internal Testing minimum)







https://github.com/user-attachments/assets/273c8c2b-88d8-40b1-ba75-c8c3e9868bec







