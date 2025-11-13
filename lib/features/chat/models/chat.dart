import 'package:flutter/material.dart';

class Chat {
  const Chat({
    required this.id,
    required this.contactName,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.productTitle,
    required this.unreadCount,
    required this.category,
    this.avatar,
    this.messages = const [],
  });

  final String id;
  final String contactName;
  final String lastMessage;
  final TimeOfDay lastMessageTime;
  final String productTitle;
  final int unreadCount;
  final ChatCategory category;
  final ImageProvider<Object>? avatar;
  final List<ChatMessage> messages;

  String get initials {
    final parts = contactName
        .trim()
        .split(' ')
        .where((element) => element.isNotEmpty)
        .toList();
    if (parts.isEmpty) {
      return '';
    }
    if (parts.length == 1) {
      final value = parts.first;
      return value.length >= 2
          ? value.substring(0, 2).toUpperCase()
          : value.toUpperCase();
    }
    final firstInitial = parts.first[0];
    final secondInitial = parts[1][0];
    return (firstInitial + secondInitial).toUpperCase();
  }
}

class ChatMessage {
  const ChatMessage({
    required this.text,
    required this.time,
    required this.isMe,
    this.isRead = true,
  });

  final String text;
  final TimeOfDay time;
  final bool isMe;
  final bool isRead;
}

enum ChatCategory { all, sales, purchases, unread }
