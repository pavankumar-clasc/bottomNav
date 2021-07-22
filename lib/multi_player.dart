import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:winter_app/route_page.dart';

class VideoPlayablePlayer extends StatefulWidget {
  @override
  _VideoPlayablePlayerState createState() => _VideoPlayablePlayerState();
}

class _VideoPlayablePlayerState extends State<VideoPlayablePlayer> {
  late ChewieController _chewieController;

  @override
  void initState() {
    ChewieController chewieController = ChewieController(
      videoPlayerController: VideoPlayerController.network(
          'https://clasc-videos-list83748-dev.s3.ap-south-1.amazonaws.com/Australia.mp4'),
      looping: true,
      aspectRatio: 3 / 2,
      autoInitialize: true,
      autoPlay: false,
      fullScreenByDefault: true,
    );
    setState(() {
      _chewieController = chewieController;
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.amber,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DivisionsPage()));
              },
            )
          ],
        ),
        body: Container(
          child: Padding(
              padding: EdgeInsets.fromLTRB(1, 0, 1, 430),
              child: Chewie(controller: _chewieController)),
        ),
      ),
    );
  }
}
