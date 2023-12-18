import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

User? user = FirebaseAuth.instance.currentUser;
String userId = user!.uid;

class ChatScreen extends StatelessWidget {
  final String serviceName;
  const ChatScreen({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: true,
        flexibleSpace: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                const SizedBox(
                  width: 2,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        serviceName,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Profile())),
                  child: const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://images.pexels.com/photos/3189024/pexels-photo-3189024.jpeg?auto=compress&cs=tinysrgb&w=1600'),
                    maxRadius: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ChatBody(
              userId: userId,
              recipient: serviceName,
            ),
          ),
          SendMessageWidget(
            recipient: serviceName,
          ),
        ],
      ),
    );
  }
}

class SendMessageWidget extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();
  final String recipient;

  SendMessageWidget({super.key, required this.recipient});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: _messageController,
            decoration: const InputDecoration(
                hintText: "Write message...", border: InputBorder.none),
          )),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // Add logic to send messages to Firebase
              _sendMessage(context);
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage(BuildContext context) async {
    String messageText = _messageController.value.text.trim();

    if (messageText.isNotEmpty) {
      // Get the current user (if using authentication)
      // FirebaseUser user = FirebaseAuth.instance.currentUser;

      // Assuming you have a 'messages' collection in your Firestore database
      Map<String, dynamic> userChatStreamStructure = {"messages": ""};

      if (user != null) {
        DocumentReference userChatStream =
            await FirebaseFirestore.instance.collection(userId).doc('messages');

        CollectionReference messageStream =
            userChatStream.collection(recipient);

        Map<String, dynamic> msg = {
          'data': messageText,
          'sender': userId,
          'recipient': recipient,
          // Add more fields as needed, e.g., 'sender': user.displayName,
          'timestamp': FieldValue.serverTimestamp(),
        };
        messageStream.add(msg);

        var x =
            await messageStream.orderBy("timestamp", descending: false).get();
        String convo = "our discuss ";
        for (var i in x.docs) {
          convo += i['data'] + ", ";
        }
        askTheAi(messageText, convo);
      }

      // Clear the text input field after sending the message
      _messageController.clear();
    } else {
      // Show an error message or handle empty message case
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a message')));
    }
  }

  Future<void> askTheAi(String qsk, convo) async {
    print("hi asking ai");
    var headers = {'Content-Type': 'application/json'};

    var data = json.encode({
      "user_content": "${"our early convo " + convo}so am asking $qsk",
      "id": userId,
      "service": recipient
    });
    var dio = Dio();
    var response = await dio.request(
      "https://zeroaichat-sklni5poha-de.a.run.app/",
      options: Options(method: "POST", headers: headers),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}

class ChatBody extends StatefulWidget {
  final String userId;
  final String recipient;
  const ChatBody({super.key, required this.userId, required this.recipient});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(userId)
            .doc('messages')
            .collection(widget.recipient)
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Loading Messages..."),
            );
          }

          var messages = snapshot.data!.docs;

          return ListView.builder(
              reverse: true,
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return messageBox(
                    messages[index]['sender'], messages[index]['data']);
              });
        });
  }

  void scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Widget messageBox(sender, text) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      child: Container(
        width: 223,
        padding: const EdgeInsets.only(
          top: 6,
          bottom: 6,
        ),
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: sender == userId ? Colors.grey : Colors.blueGrey,
              width: 3,
              strokeAlign: BorderSide.strokeAlignOutside,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  final String text;

  MessageWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
    );
  }
}
