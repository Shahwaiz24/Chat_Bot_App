import 'package:chat_bot/Chat%20Bot%20View/chat_bot_view.dart';

class ChatModel {
  ChatModel({
    required this.chatContent,
    required this.userChat,
    required this.chatTime,
  });
  final String chatContent;
  final bool userChat;
  final DateTime chatTime;
}

List<ChatModel> chats = [];

class ChatServices {
  static postMessage({required String Text}) {
    String chatmessage = Text;
    chats.add(ChatModel(
        chatContent: chatmessage, userChat: true, chatTime: DateTime.now()));
    promptControlloer.clear();
    chats.add(ChatModel(
        chatContent: chatmessage, userChat: false, chatTime: DateTime.now()));
    print(chats);
  }
}
