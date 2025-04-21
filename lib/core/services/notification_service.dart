import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:movie_explorer/core/services/deeplink_service.dart';
import 'package:movie_explorer/features/home/presentation/view/details_view.dart';

import '../../main.dart';


class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  RemoteMessage? _initialNotification;

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission();

    // Handle background notification launch
    _initialNotification = await _firebaseMessaging.getInitialMessage();

    FirebaseMessaging.onMessageOpenedApp.listen(_handleNotification);
    FirebaseMessaging.onMessage.listen(_handleForegroundNotification);
  }

  void _handleNotification(RemoteMessage message) {
    _processNotification(message);
  }

  void _handleForegroundNotification(RemoteMessage message) {
    // Optional: Show local notification or snackbar
  }

  void _processNotification(RemoteMessage message) {
    final dynamicLink = message.data['link']; // Firebase Dynamic Link

    if (dynamicLink != null) {
      DeepLinkService().handleDynamicLink(Uri.parse(dynamicLink));
    } else {
      // Fallback if you're using raw movieId instead of link
      final movieId = message.data['movieId'];
      if (movieId != null) {
        navigatorKey.currentState?.pushNamed(
          DetailsView.routeName,
          arguments: int.parse(movieId),
        );
      }
    }
  }

  bool hasInitialNotification() => _initialNotification != null;

  void handleInitialNotification() {
    if (_initialNotification != null) {
      _processNotification(_initialNotification!);
      _initialNotification = null;
    }
  }
}