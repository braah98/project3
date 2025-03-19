// TODO Implement this library.
// TODO Implement this library.
import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('المساعد سامر')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5, // استبدل برسائل حقيقية
              itemBuilder: (context, index) {
                return ListTile(
                  title: Align(
                    alignment: index.isEven ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: index.isEven ? Colors.green[100] : Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(index.isEven ? 'رسالتك' : 'رد المساعد'),
                    ),
                  ),
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
                    decoration: const InputDecoration(
                      hintText: 'اكتب رسالتك...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    // إرسال الرسالة إلى Chatbot
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}