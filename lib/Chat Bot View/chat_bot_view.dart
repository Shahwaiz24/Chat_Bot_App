import 'package:chat_bot/Chat%20Bot%20View/chat_bot_viewmodel.dart';
import 'package:chat_bot/Custom%20Widget/chat_message.dart';
import 'package:chat_bot/Custom%20Widget/textfields.dart';
import 'package:chat_bot/Services/chat_services.dart';
import 'package:chat_bot/Services/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';

bool isView = false;

class ChatBotView extends StatefulWidget {
  const ChatBotView({super.key});

  @override
  State<ChatBotView> createState() => _ChatBotViewState();
}

TextEditingController promptControlloer = TextEditingController();

class _ChatBotViewState extends State<ChatBotView> {
  ScrollController? _controller;

  @override
  void initState() {
    _controller = ScrollController();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _controller!.animateTo(
        _controller!.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get Sizew
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return ViewModelBuilder.reactive(
        viewModelBuilder: () => ChatBotViewmodel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Utils.backgroundColor,
            body: Stack(
              children: [
                Container(
                  height: screenHeight,
                  width: screenWidth,
                  child: const Image(
                    image: AssetImage('assets/images/background_2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: screenWidth,
                    height: isView == true
                        ? screenHeight * 0.800
                        : screenHeight * 0.450,
                    decoration: BoxDecoration(
                        color: Utils.TextColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(screenWidth * 0.080),
                            topRight: Radius.circular(screenWidth * 0.080))),
                    child: isView == true
                        ? Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    itemCount: chats.length,
                                    controller: _controller,
                                    itemBuilder: (context, index) {
                                      return ChatMessage(
                                        userChat: chats[index].userChat,
                                        chatData: chats[index],
                                      );
                                    }),
                              ),
                              Container(
                                height: screenHeight * 0.120,
                              )
                            ],
                          )
                        : Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    top: screenHeight * 0.100,
                                    left: screenWidth * 0.050,
                                    bottom: screenHeight * 0.010),
                                child: Text(
                                  'Welcome To Atom',
                                  style: TextStyle(
                                      color: Utils.Black,
                                      fontSize: screenHeight * 0.030),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: screenWidth * 0.060,
                                    bottom: screenHeight * 0.050),
                                child: Text(
                                  'Ask Any Question',
                                  style: TextStyle(
                                      color: Utils.Black,
                                      fontSize: screenHeight * 0.020),
                                ),
                              )
                            ],
                          ),
                  ),
                ),
                Positioned(
                  top: isView == true
                      ? screenHeight * 0.120
                      : screenHeight * 0.480,
                  left: screenWidth * 0.360,
                  child: Container(
                    height: screenHeight * 0.180,
                    width: screenWidth * 0.260,
                    child: const Image(
                      image: AssetImage('assets/images/small_chat_icon.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.040,
                        right: screenWidth * 0.040,
                        bottom: screenWidth * 0.030),
                    child: Textfield(false,
                        screenHeight: screenHeight,
                        isCode: false,
                        isChat: true,
                        surfix: InkWell(
                          onTap: () async {
                            isView = true;
                            viewModel.stateRebuild();
                            await ChatServices.postMessage(
                                Text: promptControlloer.text);

                            viewModel.stateRebuild();
                          },
                          child: Icon(
                            Icons.send_rounded,
                            color: Utils.Purple,
                          ),
                        ),
                        Controller: promptControlloer,
                        screenWidth: screenWidth,
                        hintText: 'Enter Prompt Here',
                        backColor: Utils.TextColor,
                        hintColor: Utils.Purple.withOpacity(0.2),
                        countryCodes: [],
                        initialCountryCode: ''),
                  ),
                )
              ],
            ),
          );
        });
  }
}
