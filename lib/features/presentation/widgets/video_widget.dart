import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoWidget extends StatefulWidget {
  final String? mediaUrl;
  const VideoWidget({Key? key, required this.mediaUrl}) : super(key: key);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  bool get isYoutubeVideo => widget.mediaUrl!.contains('youtube');

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.mediaUrl != null && isYoutubeVideo) {
      _loadYoutubeVideo(widget.mediaUrl!);
    }
  }

  YoutubePlayerController? _youtubeController;

  void _loadYoutubeVideo(String url) {
    if (_youtubeController == null) {
      final videoId = _filterVideoId(url);
      _youtubeController = YoutubePlayerController.fromVideoId(
        videoId: videoId,
        params: const YoutubePlayerParams(
          showControls: false,
          showFullscreenButton: true,
          mute: true,
          loop: true,
        ),
      );
    }
  }

  String _filterVideoId(String url) {
    final indexOfLastSlash = url.lastIndexOf('/');
    final indexOfComplement = url.indexOf('?');
    final containsComplement = indexOfComplement != -1;
    final videoId = containsComplement
        ? url.substring(indexOfLastSlash + 1, indexOfComplement)
        : url.substring(indexOfLastSlash);
    return videoId;
  }

  void _launchURL(String url) async {
    final canOpenLink = await canLaunchUrl(Uri.parse(url));
    if (canOpenLink) await launchUrl(Uri.parse(url));
  }

  @override
  void dispose() async {
    _youtubeController?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _youtubeController != null
        ? YoutubePlayer(
            controller: _youtubeController,
            aspectRatio: 16 / 9,
          )
        : !isYoutubeVideo
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sorry we can\'t play this video',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () => _launchURL(widget.mediaUrl!),
                    child: const Text(
                      'Open on browser >',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            : Container();
  }
}
