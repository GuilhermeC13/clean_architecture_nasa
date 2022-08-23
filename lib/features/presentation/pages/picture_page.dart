import 'package:flutter/material.dart';

class PicturePage extends StatelessWidget {
  final String mediaUrl;
  final DateTime data;
  const PicturePage({Key? key, required this.mediaUrl, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Image from ${data.month}/${data.day}/${data.year}')),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: InteractiveViewer(
          minScale: 0.1,
          maxScale: 4,
          child: Image.network(
            mediaUrl,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
