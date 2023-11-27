import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String videoAssetPath;

  VideoPlayerWidget({required this.videoAssetPath});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late bool _isPlaying;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAssetPath)
      ..initialize().then((_) {
        setState(() {});
      });
    _isPlaying = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.0, // 设置容器的宽度
      height: 300.0, // 设置容器的高度
      color: Colors.black, // 添加黑色背景
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause(); // 是调用 VideoPlayerController 对象的 pause 方法，如果视频在播放，就使用pause方法，视频就会暂停。然后使用setstate方法改变播放状态。
              _isPlaying = false;
            } else {
              _controller.play();
              _isPlaying = true;
            }
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio, // 使用视频的宽高比 
              child: _controller.value.isInitialized   //是确定视频组件是否初始化
                  ? VideoPlayer(_controller)      //如果初始化完成则使用controller作为参数传入视频
                  : CircularProgressIndicator(),  //没有的话就显示一个圆圈显示加载状态。
            ),
            _isPlaying
                ? Container() // 如果视频正在播放，不显示按钮
                : IconButton(
                    icon: Icon(Icons.play_arrow, size: 50.0, color: Colors.white),
                    onPressed: () {
                      setState(() {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                          _isPlaying = false;
                        } else {
                          _controller.play();
                          _isPlaying = true;
                        }
                      });
                    },
                  ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
