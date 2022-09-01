import 'package:clean_architecture_nasa/features/presentation/stores/space_media_store.dart';
import 'package:clean_architecture_nasa/features/presentation/widgets/video_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class PicturePage extends StatelessWidget {
  final DateTime date;
  PicturePage({Key? key, required this.date}) : super(key: key);

  SpaceMediaStore store = GetIt.I.get<SpaceMediaStore>();

  @override
  Widget build(BuildContext context) {
    store.getSpaceMediaFromDate(date);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.only(
                  right: 0,
                ),
                primary: Colors.white),
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Observer(builder: (_) {
        switch (store.state) {
          case StoreState.initial:
            return Container(
              color: Colors.white,
            );
          case StoreState.loading:
            return const Center(child: CircularProgressIndicator());
          case StoreState.loaded:
            return Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: InteractiveViewer(
                    minScale: 0.1,
                    maxScale: 4,
                    child: store.spaceMediaEntity!.mediaType == 'image'
                        ? Image.network(
                            store.spaceMediaEntity!.mediaUrl,
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          )
                        : VideoWidget(
                            mediaUrl: store.spaceMediaEntity!.mediaUrl),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.62,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 32),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            store.spaceMediaEntity!.title,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            store.spaceMediaEntity!.description,
                            style: const TextStyle(fontSize: 16),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
        }
      }),
    );
  }
}
