import 'package:flutter/material.dart';
import 'package:notification_listener_service/notification_event.dart';
import 'package:notification_listener_service/notification_listener_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool permissionGranted = false;
  final List<ServiceNotificationEvent> events = [];

  @override
  void initState() {
    super.initState();
    checkPermission();
    listen();
  }

  Future<void> checkPermission() async {
    /// check if notification permession is enebaled
    bool status = await NotificationListenerService.isPermissionGranted();

    if (!status) status = await NotificationListenerService.requestPermission();
    permissionGranted = status;
    setState(() {});
  }

  Future<void> listen() async {
    NotificationListenerService.notificationsStream.listen((event) {
      print("$event");
      setState(() {
        events.add(event);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ddsD'),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Permission: $permissionGranted"),
              ListView.separated(
                itemCount: events.length,
                padding: EdgeInsets.symmetric(vertical: 32),
                shrinkWrap: true,
                separatorBuilder: (_, i) => Divider(color: Colors.black),
                itemBuilder: (_, i) => Row(
                  children: [
                    Expanded(
                      child: Text(
                        "packageName: ${events[i].packageName}\ntitle: ${events[i].title}\ncontent: ${events[i].content}\ncanReply: ${events[i].canReply}\ncanReply: ${events[i].id}",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        events[i].sendReply("Ciaoooooo|| REPLY");
                      },
                      child: Text("Reply"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
