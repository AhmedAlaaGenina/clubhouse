import 'dart:math';

import 'package:flutter/material.dart';

import 'widgets.dart';

class Speaker extends StatelessWidget {
  final List roomSpeaker;

  const Speaker({Key? key, required this.roomSpeaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(20),
      sliver: SliverGrid.count(
          crossAxisCount: 4,
          mainAxisSpacing: 20,
          // crossAxisSpacing: 20,
          childAspectRatio: 0.7,
          children: [
            ...roomSpeaker
                .map(
                  (e) => RoomUserProfile(
                    imageUrl: e.imageUrl,
                    name: e.givenName,
                    size: 66,
                    isNew: Random().nextBool(),
                  ),
                )
                .toList(),
          ]),
    );
  }
}
