# voice intent dummy app

git clone repository 

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
have to Wait 24-48 hours for Google to index actions.xml



https://github.com/user-attachments/assets/2e733606-3dda-490c-a32a-af01adb642b5

