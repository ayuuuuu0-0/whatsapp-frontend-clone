class ChatItem {
  final String name;
  final String mostRecentMessage;
  final String messageDate;
  final String imageUrl;

  const ChatItem({
    required this.name,
    required this.mostRecentMessage,
    required this.messageDate,
    required this.imageUrl,
  });

  factory ChatItem.fromJson(Map<String, dynamic> json) => ChatItem(
    name: json['name'] as String,
    mostRecentMessage: json['mostRecentMessage'] as String,
    messageDate: json['messageDate'] as String,
    imageUrl: json['imageUrl'] as String,
  );
}


final chatData = [
  {
    'name': 'User 1',
    'mostRecentMessage': 'user 1 message.',
    'messageDate': '10:28 PM',
    'imageUrl': 'https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_960_720.jpg',
  },
  {
    'name': 'user2',
    'mostRecentMessage': 'user 1 message',
    'messageDate': '10:28 AM',
    'imageUrl': 'https://cdn.pixabay.com/photo/2021/03/02/16/34/woman-6063087_960_720.jpg',
  },
  {
    'name': 'user3',
    'mostRecentMessage': 'Learning flutter and node',
    'messageDate': 'Yesterday',
    'imageUrl': 'https://cdn.pixabay.com/photo/2017/04/05/10/45/girl-2204622_960_720.jpg',
  },
  {
    'name': 'user4',
    'mostRecentMessage': 'user 3 message',
    'messageDate': 'Wednesday',
    'imageUrl': 'https://cdn.pixabay.com/photo/2017/12/01/08/02/paint-2990357_960_720.jpg',
  },
  {
    'name': 'user5',
    'mostRecentMessage': 'user 4 message',
    'messageDate': '16/01/2022',
    'imageUrl': 'https://cdn.pixabay.com/photo/2021/05/01/09/59/city-6220689_960_720.jpg',
  },
];



final firstChatDataEntry = chatData[0];

final chatList = chatData.map((item) => ChatItem.fromJson(item)).toList();

final firstChatItem = chatList[0];

final totalItems = chatList.length;