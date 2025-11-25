// import 'dart:async';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class NotificationService {
//   static final NotificationService _instance = NotificationService._internal();
//   factory NotificationService() => _instance;
//   NotificationService._internal();
//
//   final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
//   final FlutterLocalNotificationsPlugin _localNotifications =
//       FlutterLocalNotificationsPlugin();
//
//   String? _fcmToken;
//   StreamSubscription<String>? _tokenSubscription;
//
//   // Getters
//   String? get fcmToken => _fcmToken;
//   FirebaseMessaging get firebaseMessaging => _firebaseMessaging;
//
//   /// Initialize notification service
//   Future<void> initialize() async {
//     // Request permissions
//     await _requestPermissions();
//
//     // Initialize local notifications
//     await _initializeLocalNotifications();
//
//     // Get FCM token
//     await _getFCMToken();
//
//     // Listen for token refresh
//     _listenToTokenRefresh();
//
//     // Configure message handlers
//     _configureMessageHandlers();
//   }
//
//   /// Request notification permissions
//   Future<void> _requestPermissions() async {
//     NotificationSettings settings = await _firebaseMessaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       print('User granted provisional permission');
//     } else {
//       print('User declined or has not accepted permission');
//     }
//   }
//
//   /// Initialize local notifications
//   Future<void> _initializeLocalNotifications() async {
//     const AndroidInitializationSettings androidSettings =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//
//     const DarwinInitializationSettings iosSettings =
//         DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );
//
//     const InitializationSettings initSettings = InitializationSettings(
//       android: androidSettings,
//       iOS: iosSettings,
//     );
//
//     await _localNotifications.initialize(
//       initSettings,
//       onDidReceiveNotificationResponse: _onNotificationTapped,
//     );
//
//     // Create notification channel for Android
//     await _createNotificationChannel();
//   }
//
//   /// Create Android notification channel
//   Future<void> _createNotificationChannel() async {
//     const AndroidNotificationChannel channel = AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       description: 'This channel is used for important notifications.',
//       importance: Importance.high,
//       playSound: true,
//     );
//
//     await _localNotifications
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//   }
//
//   /// Get FCM token
//   Future<void> _getFCMToken() async {
//     try {
//       _fcmToken = await _firebaseMessaging.getToken();
//       print('FCM Token: $_fcmToken');
//
//       // Save token to shared preferences
//       if (_fcmToken != null) {
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('fcm_token', _fcmToken!);
//       }
//
//       // Send token to your backend server here
//       // await _sendTokenToServer(_fcmToken);
//     } catch (e) {
//       print('Error getting FCM token: $e');
//     }
//   }
//
//   /// Listen to token refresh
//   void _listenToTokenRefresh() {
//     _tokenSubscription = _firebaseMessaging.onTokenRefresh.listen((newToken) {
//       _fcmToken = newToken;
//       print('New FCM Token: $newToken');
//
//       // Save new token
//       SharedPreferences.getInstance().then((prefs) {
//         prefs.setString('fcm_token', newToken);
//       });
//
//       // Send new token to your backend server here
//       // await _sendTokenToServer(newToken);
//     });
//   }
//
//   /// Configure message handlers
//   void _configureMessageHandlers() {
//     // Handle foreground messages
//     FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
//
//     // Handle background message (when app is terminated)
//     FirebaseMessaging.onMessageOpenedApp.listen(_handleBackgroundMessageTap);
//
//     // Check if app was opened from a notification
//     _checkInitialMessage();
//   }
//
//   /// Handle foreground messages
//   Future<void> _handleForegroundMessage(RemoteMessage message) async {
//     print('Foreground message received: ${message.messageId}');
//
//     // Show local notification
//     await _showLocalNotification(message);
//   }
//
//   /// Show local notification
//   Future<void> _showLocalNotification(RemoteMessage message) async {
//     final notification = message.notification;
//
//     if (notification != null) {
//       await _localNotifications.show(
//         message.hashCode,
//         notification.title,
//         notification.body,
//         const NotificationDetails(
//           android: AndroidNotificationDetails(
//             'high_importance_channel',
//             'High Importance Notifications',
//             channelDescription: 'This channel is used for important notifications.',
//             importance: Importance.high,
//             priority: Priority.high,
//             icon: '@mipmap/ic_launcher',
//             playSound: true,
//           ),
//           iOS: DarwinNotificationDetails(
//             presentAlert: true,
//             presentBadge: true,
//             presentSound: true,
//           ),
//         ),
//         payload: message.data.toString(),
//       );
//     }
//   }
//
//   /// Handle notification tap when app is in background
//   void _handleBackgroundMessageTap(RemoteMessage message) {
//     print('Notification tapped: ${message.messageId}');
//     // Navigate to notification screen or handle the tap
//     _handleNotificationTap(message);
//   }
//
//   /// Check if app was opened from a notification
//   Future<void> _checkInitialMessage() async {
//     RemoteMessage? initialMessage =
//         await _firebaseMessaging.getInitialMessage();
//
//     if (initialMessage != null) {
//       _handleNotificationTap(initialMessage);
//     }
//   }
//
//   /// Handle notification tap
//   void _handleNotificationTap(RemoteMessage message) {
//     // Handle navigation based on notification data
//     // Example: Navigate to specific screen based on notification type
//     // final data = message.data;
//     // You can add navigation logic here
//   }
//
//   /// Handle notification tap from local notification
//   void _onNotificationTapped(NotificationResponse response) {
//     print('Local notification tapped: ${response.payload}');
//     // Handle navigation
//   }
//
//   /// Subscribe to topic
//   Future<void> subscribeToTopic(String topic) async {
//     await _firebaseMessaging.subscribeToTopic(topic);
//     print('Subscribed to topic: $topic');
//   }
//
//   /// Unsubscribe from topic
//   Future<void> unsubscribeFromTopic(String topic) async {
//     await _firebaseMessaging.unsubscribeFromTopic(topic);
//     print('Unsubscribed from topic: $topic');
//   }
//
//   /// Dispose
//   void dispose() {
//     _tokenSubscription?.cancel();
//   }
// }
//
