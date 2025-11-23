class NotificationModel {
  final String id;
  final String title;
  final String description;
  final String timestamp;
  final String? avatarUrl;
  final String? actionButtonText;
  bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    this.avatarUrl,
    this.actionButtonText,
    this.isRead = false,
  });
}

