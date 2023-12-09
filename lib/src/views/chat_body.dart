import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'profile.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        automaticallyImplyLeading: false,
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
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "widget.service",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
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
          const Expanded(
            child: ChatBody(),
          ),
          SendMessageWidget(),
        ],
      ),
    );
  }
}

class SendMessageWidget extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

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
                hintText: 'Enter your message...',
              ),
            ),
          ),
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
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;
        await FirebaseFirestore.instance.collection('messages').add({
          'text': messageText,
          'sender': userId,
          'recipient': 'service',
          // Add more fields as needed, e.g., 'sender': user.displayName,
          'timestamp': FieldValue.serverTimestamp(),
        });
      }

      // Clear the text input field after sending the message
      _messageController.clear();
    } else {
      // Show an error message or handle empty message case
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a message')));
    }
  }
}

class ChatBody extends StatefulWidget {
  const ChatBody({super.key});

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("Loading Messages..."),
            );
          }

          var messages = snapshot.data!.docs.reversed;
          List<Widget> messageWidgets = [];
          for (var message in messages) {
            var messageText = message['text'];

            var messageWidget = MessageWidget(text: messageText);
            messageWidgets.add(messageWidget);
          }

          return ListView(
            reverse: true,
            children: messageWidgets,
          );
        });
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
