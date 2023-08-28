import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:intl/intl.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

InAppWebViewController? controller;
bool isVisible = false;
String initialHost = '';
String webviewUrl = '';
String oneSignalAppId = '';

Future<void> fetchFirebaseRemoteConfig() async {
  await initializeFirebase();
  final remoteConfig = FirebaseRemoteConfig.instance;
  remoteConfig.settings.fetchTimeout = Duration.zero;
  remoteConfig.setConfigSettings(
    RemoteConfigSettings(
      fetchTimeout: Duration.zero,
      minimumFetchInterval: Duration.zero,
    ),
  );
  await remoteConfig.fetchAndActivate();

  try {
    webviewUrl = remoteConfig.getString('WEB_AD_URI_HOST');
    print(webviewUrl);
  } catch (e) {}
  try {
    oneSignalAppId = remoteConfig.getString('SERVICE_OS_KEY');
  } catch (e) {}

  initPlatformState();

  if (webviewUrl != '') {
    try {
      print('load $webviewUrl');
      controller?.loadUrl(urlRequest: URLRequest(url: Uri.parse(webviewUrl)));
    } catch (e) {}
  }
}

Future<void> initPlatformState() async {
  OneSignal.shared.setAppId(oneSignalAppId);
  OneSignal.shared
      .promptUserForPushNotificationPermission()
      .then((accepted) {});
}

Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
}
