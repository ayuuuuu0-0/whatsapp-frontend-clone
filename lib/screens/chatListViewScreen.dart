import 'package:flutter/material.dart';
import '../mockData/dataModel.dart';
import 'chatScreen.dart';


final List<ChatItem> chatList = chatData.map((item) => ChatItem.fromJson(item)).toList();

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, position) {
        final chatItem = chatList[position];
        return Column(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatScreen(
                      image: chatItem.imageUrl,
                      name: chatItem.name,
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage(chatItem.imageUrl),
                ),
                title: Text(
                  chatItem.name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                subtitle: Row(
                  children: [
                    Icon(
                      position % 2 == 0 ? Icons.done : Icons.done_all,
                      color: position % 2 == 0 ? Colors.grey : Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text(
                      chatItem.mostRecentMessage,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(top: 2.0),
                  child: Text(
                    chatItem.messageDate,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontFamily: 'Regular', // Assuming `Regular` is a defined font family
                    ),
                  ),
                ),
              ),
            ),
            Divider(),
          ],
        );
      },
      itemCount: chatList.length,
    );
  }
}
