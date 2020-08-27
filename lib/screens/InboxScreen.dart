import 'package:flutter/material.dart';
import 'package:tiktok/widgets/WhiteAppBar.dart';

/// This is the comment screen.
class MessagesScreen extends StatelessWidget {
  final Function buildUI;
  MessagesScreen(this.buildUI);

  final messages = [
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
    {'msg': 'hello', 'sender': 'Tik Tok Man'},
  ];

  @override
  Widget build(BuildContext context) {
    return buildUI(
      frontLayer: Column(
        children: [
          WhiteAppBar(
            leading: Icons.arrow_back_ios,
            trailing: Icons.add,
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                children: messages.map((messenger) {
                  return Card(
                    child: ListTile(
                      title: Text(messenger['sender']),
                      leading: CircleAvatar(
                        child: Text(messenger['sender'][0]),
                      ),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
