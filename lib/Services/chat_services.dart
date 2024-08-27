import 'package:Atom/Chat%20Bot%20View/chat_bot_view.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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
  static postMessage({required String Text}) async {
    String chatmessage = Text;
    chats.add(ChatModel(
        chatContent: chatmessage, userChat: true, chatTime: DateTime.now()));
    promptControlloer.clear();
   final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: 'AIzaSyAbzs7UnDu39BZP2mQpAmNoGe4ksAnXA4Q');
    final content = [Content.text('${chatmessage}')];
     final response = await model.generateContent(content);
     if(response != null){
       chats.add(ChatModel(
          chatContent: response.text!, userChat: false, chatTime: DateTime.now()));
     }
    
  }
}
