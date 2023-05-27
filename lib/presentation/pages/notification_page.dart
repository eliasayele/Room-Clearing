import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:room_clearing/presentation/pages/notification_detail_page.dart';

import '../../utils/constants.dart';

class User {
  final String userName;
  final String avatar;

  User({required this.userName, required this.avatar});
}

class NotificationData {
  final String time;
  final List<User> users;
  final List<String> images;
  final String message;

  NotificationData(
      {required this.time,
      required this.users,
      required this.images,
      required this.message});
}

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

User user1 = User(userName: "sugeevan_svg", avatar: "assets/avatar1.png");
User user2 = User(userName: "stella_sf", avatar: "assets/avatar3.png");
User user3 = User(userName: "maria_2", avatar: "assets/avatar2.png");
User user4 = User(userName: "jamestalan", avatar: "assets/avatar4.png");

class _NotificationPageState extends State<NotificationPage> {
  List<NotificationData> notificationData = [
    NotificationData(
      time: "5 Min Ago",
      users: [],
      images: ["assets/image1.jpg", "assets/image2.jpg"],
      message: "Why don’t you claim a fees by cleaning the room @stella_jue",
    ),
    NotificationData(
      time: "Just now",
      users: [user2],
      images: ["assets/image2.jpg"],
      message: "Now you can give a review to stella_sf’s place",
    ),
    NotificationData(
      time: "28 Min Ago",
      users: [user3, user4],
      images: ["assets/image2.jpg"],
      message: "send you a proposal.",
    ),
    NotificationData(
      time: "23 March, 2023",
      users: [user4],
      images: ["assets/image2.jpg"],
      message: "give you a review: @konsikan exactly..",
    ),
    // Add more sample data entries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          "Notification",
          style: TextStyle(color: kBlack),
        ),
        backgroundColor: kWhite,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Today",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: notificationData.length * 72,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notificationData.length,
                  itemBuilder: (BuildContext context, int index) {
                    NotificationData notification = notificationData[index];
                    return NotificationItem(notification: notification);
                  }),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("This Week",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  )),
            ),
            NotificationItem(notification: notificationData.first),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("This Month",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  )),
            ),
            SizedBox(
              height: notificationData.length * 75,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: notificationData.length,
                  itemBuilder: (BuildContext context, int index) {
                    NotificationData notification = notificationData[index];
                    return NotificationItem(notification: notification);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.notification})
      : super(key: key);
  final NotificationData notification;

  // showing correct user name or users name
  String getUserName(NotificationData notification) {
    String name = '';
    if (notification.users.isNotEmpty) {
      name = name + notification.users[0].userName;
    }
    if (notification.users.length == 2) {
      name = '$name & ';
    }
    if (notification.users.length == 2) {
      name = name + notification.users[1].userName;
    }
    return "$name ";
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NotificationDetailPage(),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                notification.users.isEmpty
                    ? Container(
                        padding: const EdgeInsets.all(8.0),
                        width: 60,
                        child: Image.asset("assets/mobilebutton.png"),
                      )
                    : notification.users.length > 1
                        ? Container(
                            padding: const EdgeInsets.all(8.0),
                            width: 60,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundImage: AssetImage(
                                        notification.users[1].avatar),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: kWhite,
                                      child: CircleAvatar(
                                        radius: 15,
                                        backgroundImage: AssetImage(
                                            notification.users.first.avatar),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Align(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              width: 60,
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage(notification.users.first.avatar),
                              ),
                            ),
                          ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                          text: getUserName(notification),
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: notification.message,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ]),
                    ),
                    Text(
                      notification.time,
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: kGray),
                    )
                  ],
                )),
                Image.asset(
                  notification.images.first,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 70,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
