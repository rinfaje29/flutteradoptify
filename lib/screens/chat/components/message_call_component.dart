import 'package:adoptify/main.dart';
import 'package:adoptify/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ChatComponent extends StatelessWidget {
  final chat;

  ChatComponent({
    super.key,
    this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (chat.unread!.isNotEmpty)
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: Text(
              chat.unread!,
              style: TextStyle(color: white, fontSize: 12),
            ),
          ),
        Text(
          chat.time!,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: isDarkMode.value ? Colors.white54 : Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class CallComponent extends StatelessWidget {
  final call;

  const CallComponent({super.key, this.call});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image(image: NetworkImage(call.callimage ?? "")),
    );
  }
}
