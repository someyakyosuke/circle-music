import 'dart:io';
import '../data/song_data.dart';
import '../pages/now_playing.dart';
import 'mp_circle_avatar.dart';
import 'mp_inherited.dart';
import 'package:flutter/material.dart';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'dart:math';
import 'package:flute_music_player/flute_music_player.dart';
import  '../my_app.dart';

class MPListView extends StatelessWidget {
  final List<MaterialColor> _colors = Colors.primaries;

    @override
  Widget build(BuildContext context) {

      Widget _buildmusicItem(int index) {
       // final rootIW = MPInheritedWidget.of(context);
        //SongData songData = rootIW.songData;
        //var s = songData.songs[index];

        return Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Container(
              width: 80,
              padding: EdgeInsets.all(20),
              color: Colors.blue[100 * ((index % 8) + 1)],
              child: Center(
                child: Text(
                  index.toString(),
                ),

              ),

            ),
          ),
        );
      }

      final rootIW = MPInheritedWidget.of(context);
      SongData songData = rootIW.songData;

    return new CircleListScrollView(

      physics: CircleFixedExtentScrollPhysics(),
      axis: Axis.horizontal,
      itemExtent: 80,
      children: List.generate(songData.songs.length,_buildmusicItem),
      radius: MediaQuery.of(context).size.width * 0.6,



    );
  }
}
