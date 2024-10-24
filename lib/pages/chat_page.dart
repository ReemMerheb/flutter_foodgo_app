
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/chat_model.dart'; 
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    final messagesChats = Provider.of<MessagesChats>(context);
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messagesChats.chats.length,
              itemBuilder: (context, index) {
                final chat = messagesChats.chats[index];
                return GestureDetector(
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Delete Message'),
                        content: Text('Are you sure you want to delete this message?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              messagesChats.deleteMessage(index);
                              Navigator.of(context).pop();
                            },
                            child: Text('Delete', style: TextStyle(color: Color.fromARGB(255, 255, 0, 0),)),
                          ),
                        ],
                      ),
                    );
                  },
                  child: _buildChatBubble(chat['text'], isSender: chat['isSender']),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Type here...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color:Color.fromARGB(255, 255, 0, 0),),
                  onPressed: () {
                    messagesChats.sendMessage(controller.text);
                    controller.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble(String message, {required bool isSender}) {
  return Row(
    mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
    children: [
      
      if (!isSender)
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/blankpic.png'),
             
          ),
        ),
      
      
      Flexible(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isSender ? Color.fromARGB(255, 255, 0, 0) : Colors.grey[300],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            message,
            style: TextStyle(color: isSender ? Colors.white : Colors.black),
            softWrap: true, 
          ),
        ),
      ),

      
      if (isSender)
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/profilepic.png'),
             
          ),
        ),
    ],
  );
}}