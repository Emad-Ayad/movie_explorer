
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uni_links3/uni_links.dart';

class DeepLinkService {
  static final DeepLinkService _instance = DeepLinkService._internal();
  factory DeepLinkService() => _instance;

  DeepLinkService._internal();

  StreamSubscription? _sub;
  GlobalKey<NavigatorState>? _navigatorKey;

  void initialize(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;

    _handleInitialUri();
    _sub = uriLinkStream.listen((Uri? uri) {
      _handleUri(uri);
    });
  }

  void dispose() {
    _sub?.cancel();
  }

  Future<void> _handleInitialUri() async {
    try {
      final initialUri = await getInitialUri();
      _handleUri(initialUri);
    } catch (e) {
      debugPrint("Error getting initial URI: $e");
    }
  }

  void handleDynamicLink(Uri uri) {
    _handleUri(uri);
  }

  void _handleUri(Uri? uri) {
    if (uri == null) return;

    if (uri.host == 'details') {
      final movieId = int.tryParse(uri.queryParameters['movieId'] ?? '');
      if (movieId != null) {
        _navigatorKey?.currentState?.pushNamed('details', arguments: movieId);
      }
    }
  }
}