import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
///
/// represet image from netwrok wich display loading indicator
///
class NetworkImageWithLoader extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double width;
  final double height;

  const NetworkImageWithLoader({
    @required this.url,
    this.fit,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      this.url,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        double progress = loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes
            : null;
        return Center(
            child: CupertinoActivityIndicator.partiallyRevealed(
                progress: progress));
      },
    );
  }
}
