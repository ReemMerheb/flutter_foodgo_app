
import 'package:flutter/material.dart';

class MessagesChats with ChangeNotifier {
  final List<Map<String, dynamic>> _chats = [
    {'text': 'Hi, how can I help you?', 'isSender': false},
    {'text': 'Hello, I ordered two fried \n chicken  burgers. Can I \n know  how much time it  \n will take to arrive?', 'isSender': true},
    {'text': 'Ok, please let me check!', 'isSender': false},
    {'text': 'Sure...', 'isSender': true},
    {'text': 'It’ll get 25 minutes to \n arrive at your address', 'isSender': false},
    {'text': 'Ok, thanks for your \n support', 'isSender': true},
  ];

  List<Map<String, dynamic>> get chats => _chats;

  void sendMessage(String chats) {
    if (chats.isNotEmpty) {
      _chats.add({'text': chats, 'isSender': true});
      notifyListeners(); 
    }
  }
  void deleteMessage(int index) {
    if (index >= 0 && index < _chats.length) {
      _chats.removeAt(index);
      notifyListeners(); 
    }
  }
}
