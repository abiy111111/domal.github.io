import 'package:flutter/material.dart';

class Message {
  final String text;
  final String sender;
  final DateTime timestamp;

  Message({
    required this.text,
    required this.sender,
    required this.timestamp,
  });
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Message> _messages = [
    Message(
      text: "tunggu sebentar yaa",
      sender: "@abiy_wow",
      timestamp: DateTime(2024, 8, 26, 15, 14),
    ),
    Message(
      text: "okayy",
      sender: "@Me",
      timestamp: DateTime(2024, 8, 26, 15, 14),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0EBE7F),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('A', style: TextStyle(color: Color(0xFF0EBE7F))),
            ),
            SizedBox(width: 8),
            Text(
              'Abiy',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final bool isMe = message.sender == "@Me";

                return Padding(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: isMe 
                      ? CrossAxisAlignment.end 
                      : CrossAxisAlignment.start,
                    children: [
                      if (index == 0 || _shouldShowDate(index))
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              '26/8/2024',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      if (!isMe)
                        Padding(
                          padding: EdgeInsets.only(left: 8, bottom: 4),
                          child: Text(
                            message.sender,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      Container(
                        margin: EdgeInsets.only(
                          left: isMe ? 50 : 0,
                          right: isMe ? 0 : 50,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.grey[300] : Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              child: Text(message.text),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '${message.timestamp.hour}:${message.timestamp.minute.toString().padLeft(2, '0')}',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Color(0xFF0EBE7F),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF0EBE7F).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Ketik sesuatu...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Color(0xFF0EBE7F),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bool _shouldShowDate(int index) {
    if (index == 0) return true;
    final DateTime currentDate = _messages[index].timestamp;
    final DateTime previousDate = _messages[index - 1].timestamp;
    return currentDate.day != previousDate.day;
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add(
        Message(
          text: _messageController.text,
          sender: "@Me",
          timestamp: DateTime.now(),
        ),
      );
    });
    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
