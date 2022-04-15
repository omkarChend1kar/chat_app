import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final Function() getLoggedOut;
  static const id = 'chat_screen';
  const ChatScreen({Key? key, required this.getLoggedOut}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: null,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 100,
                height: 50,
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
