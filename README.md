# Flutter-demo-Getx-Hive-GoogleMap
Flutter demo for Getx state management, route management , dependancy injection and Hive local database , also include google map to show pindrop


![Simulator Screen Shot - iPhone 13 mini - 2022-03-13 at 23 13 37](https://user-images.githubusercontent.com/30076950/158073477-25703c50-cb5b-4d10-8400-47adec8c74a7.png)
![Simulator Screen Shot - iPhone 13 mini - 2022-03-13 at 23 13 48](https://user-images.githubusercontent.com/30076950/158073485-e4b7f435-dbdc-4d43-ace6-cb4ed694db71.png)


NOTES :- 

First need to add Google API key in 

for ios iOS : ../ios/Runner/AppDelegate.swift 
 specify your API key in the application delegate ios/Runner/AppDelegate.swift:

import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR KEY HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}


for android : ../android/app/src/main/AdroidMainfest.xml
Specify your API key in the application manifest android/app/src/main/AndroidManifest.xml:
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>


               
