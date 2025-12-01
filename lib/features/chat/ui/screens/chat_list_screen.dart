import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rizq/core/constant/app_colors.dart';
import 'package:rizq/core/router/route_manager.dart';
import 'package:rizq/core/theme/app_text_styles.dart';
import 'package:rizq/features/chat/models/chat.dart';
import 'package:rizq/features/chat/ui/screens/chat_details_screen.dart';
import 'package:rizq/features/chat/ui/widgets/chat_card.dart';
import 'package:rizq/generated/locale_keys.g.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  ChatCategory _selectedFilter = ChatCategory.all;

  late final List<Chat> _chats = _mockChats;

  @override
  Widget build(BuildContext context) {
    final filteredChats = _filters[_selectedFilter]!(List<Chat>.from(_chats));

    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: AppBar(
        backgroundColor: AppColors.whiteBackground,
        elevation: 0,
        centerTitle: true,
        title: Text(
          LocaleKeys.chats.tr(context: context),
          style: AppTextStyles.cairoTextStyle(
            size: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primaryColor,
          )
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _FilterRow(
              selected: _selectedFilter,
              onSelected: (filter) {
                setState(() {
                  _selectedFilter = filter;
                });
              },
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView.separated(
                itemCount: filteredChats.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (context, index) {
                  final chat = filteredChats[index];
                  return ChatCard(
                    chat: chat,
                    onTap: () => RouteManager.navigateTo(
                      ChatDetailsScreen(chat: chat),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  static final Map<ChatCategory, List<Chat> Function(List<Chat>)> _filters = {
    ChatCategory.all: (list) => list,
    ChatCategory.sales: (list) =>
        list.where((chat) => chat.category == ChatCategory.sales).toList(),
    ChatCategory.purchases: (list) =>
        list.where((chat) => chat.category == ChatCategory.purchases).toList(),
    ChatCategory.unread: (list) =>
        list.where((chat) => chat.unreadCount > 0).toList(),
  };

  List<Chat> get _mockChats => [
    Chat(
      id: '1',
      contactName: 'محمود محمد',
      lastMessage: 'كم سعر هذا المنتج؟',
      lastMessageTime: const TimeOfDay(hour: 14, minute: 58),
      productTitle: 'ماك بوك برو M2 MNEJ3 2022 LLA 13.3 بوصة',
      unreadCount: 20,
      category: ChatCategory.sales,
      messages: _mockMessages,
    ),
    Chat(
      id: '2',
      contactName: 'أحمد علي',
      lastMessage: 'تم الشحن بالفعل؟',
      lastMessageTime: const TimeOfDay(hour: 13, minute: 40),
      productTitle: 'سماعات آيربودز الجيل الثالث',
      unreadCount: 3,
      category: ChatCategory.sales,
      messages: _mockMessages,
    ),
    Chat(
      id: '3',
      contactName: 'سارة محمود',
      lastMessage: 'أشكرك على تعاونك.',
      lastMessageTime: const TimeOfDay(hour: 10, minute: 22),
      productTitle: 'شاشة سامسونج 32 بوصة',
      unreadCount: 0,
      category: ChatCategory.purchases,
      messages: _mockMessages,
    ),
  ];

  List<ChatMessage> get _mockMessages => const [
    ChatMessage(
      text: 'كم مساحة الفلاشة بالتحديد؟',
      time: TimeOfDay(hour: 14, minute: 40),
      isMe: false,
    ),
    ChatMessage(
      text: 'سعة 128 جيجا بايت، والمنتج جديد تمامًا.',
      time: TimeOfDay(hour: 14, minute: 42),
      isMe: true,
    ),
    ChatMessage(
      text: 'يستبدل هذا بالنص الكتابي الذي يعبر عن المحادثات ......',
      time: TimeOfDay(hour: 14, minute: 45),
      isMe: true,
    ),
    ChatMessage(
      text: 'أحتاجه اليوم، هل يمكن التوصيل السريع؟',
      time: TimeOfDay(hour: 14, minute: 52),
      isMe: false,
    ),
  ];
}

class _FilterRow extends StatelessWidget {
  const _FilterRow({required this.selected, required this.onSelected});

  final ChatCategory selected;
  final ValueChanged<ChatCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6.r),
      decoration: BoxDecoration(
        color: Color(0xffDCF1FF),
        borderRadius: BorderRadius.circular(24.r),
      ),
      child: Row(
        spacing: 12.r,
        mainAxisSize: MainAxisSize.min,
        children: ChatCategory.values.map((filter) {
          final isSelected = filter == selected;
          return GestureDetector(
            onTap: () => onSelected(filter),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.r),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(24.r),
              ),
              alignment: Alignment.center,
              child: Text(
                _label(filter),
                style: AppTextStyles.cairoTextStyle(
                  fontWeight: FontWeight.w500,
                  color: isSelected? Colors.white : AppColors.titleColor,
                  size: 14,
                )
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  String _label(ChatCategory filter) {
    switch (filter) {
      case ChatCategory.all:
        return LocaleKeys.chat_all.tr();
      case ChatCategory.sales:
        return LocaleKeys.chat_sales.tr();
      case ChatCategory.purchases:
        return LocaleKeys.chat_purchases.tr();
      case ChatCategory.unread:
        return LocaleKeys.chat_unread.tr();
    }
  }
}





