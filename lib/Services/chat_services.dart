import 'package:Atom/Chat%20Bot%20View/chat_bot_view.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class ChatModel {
  ChatModel({
    required this.chatContent,
    required this.userChat,
    required this.chatTime,
    this.loading = false,
  });

  final String chatContent;
  final bool userChat;
  final DateTime chatTime;
  final bool loading;
}


List<ChatModel> chats = [];
class ChatServices {
  static postMessage({required String Text}) async {
    String chatmessage = Text;
    
    // Add user's message to chat list
    chats.add(ChatModel(
        chatContent: chatmessage, userChat: true, chatTime: DateTime.now()));

    // Add a loading indicator for the bot's response
    ChatModel loadingMessage = ChatModel(
        chatContent: "", userChat: false, chatTime: DateTime.now(), loading: true);
    chats.add(loadingMessage);
    
    // Clear the prompt controller
    promptControlloer.clear();

    // Generate the bot's response
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: 'AIzaSyAbzs7UnDu39BZP2mQpAmNoGe4ksAnXA4Q');
    final content = [Content.text('${chatmessage}')];
    final response = await model.generateContent(content);

    // Remove the loading message
    chats.remove(loadingMessage);

    // Add the bot's response to the chat list
    if (response != null) {
      chats.add(ChatModel(
         chatContent: response.text!, userChat: false, chatTime: DateTime.now()));
    }
  }
}

