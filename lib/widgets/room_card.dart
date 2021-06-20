import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clubhouse_ui/screens/room_screen.dart';
import 'package:flutter_clubhouse_ui/widgets/user_profile_image.dart';

import '../data.dart';

class RoomCard extends StatelessWidget {
  final Room room;

  const RoomCard({Key? key, required this.room}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => RoomScreen(room: room),
          fullscreenDialog: true,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${room.club} 🏠'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline!.copyWith(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.0,
                        fontSize: 12,
                      ),
                ),
                Text(
                  '${room.name}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        // letterSpacing: 1.0,
                        fontSize: 15,
                      ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 20,
                              left: 28,
                              child: UserProfileImage(
                                imageUrl: room.speakers[1].imageUrl,
                                size: 48,
                              ),
                            ),
                            UserProfileImage(
                              imageUrl: room.speakers[0].imageUrl,
                              size: 48,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ...room.speakers
                                .map((e) => Text(
                                      '${e.givenName} ${e.familyName} 📜',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 16),
                                    ))
                                .toList(),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          '${room.speakers.length + room.others.length} ',
                                    ),
                                    const WidgetSpan(
                                      child: Icon(
                                        CupertinoIcons.person_fill,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' / ${room.speakers.length} ',
                                    ),
                                    const WidgetSpan(
                                      child: Icon(
                                        CupertinoIcons.chat_bubble_fill,
                                        size: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                          ]),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
