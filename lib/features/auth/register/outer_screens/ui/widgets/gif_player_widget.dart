import 'package:flutter/material.dart';

class GifPlayerWidget extends StatefulWidget {
  final String gifPath;

  const GifPlayerWidget({super.key, required this.gifPath});

  @override
  State<GifPlayerWidget> createState() => _GifPlayerWidgetState();
}

class _GifPlayerWidgetState extends State<GifPlayerWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.gifPath,
      key: UniqueKey(),
    );
  }

  @override
  void dispose() {
    evictGif();
    super.dispose();
  }

  // remove the gif from cached assets, which allow it play correctly each time you call
  void evictGif() {
    final AssetImage gifProvider = AssetImage(widget.gifPath);
    gifProvider.evict().then((isEvicted) {
      print('GIF IS EVICTED? : $isEvicted');
    });
  }
}