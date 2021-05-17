import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DealIcon extends StatelessWidget {
  final double height;
  final double width;
  final String? uid;
  final String thumb;
  final double radius;

  const DealIcon(
    this.thumb, {
    this.height = 100,
    this.width = 100,
    this.uid,
    this.radius = 20,
  });

  @override
  Widget build(BuildContext context) {
    final _widget = ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: thumb,
        height: height,
        width: width,
        fit: BoxFit.cover,
        placeholder: (_, __) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (_, __, ___) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: Colors.black.withOpacity(0.3),
          ),
          child: const Icon(Icons.error, color: Colors.white),
        ),
      ),
    );
    if (uid != null) return Hero(tag: uid!, child: _widget);
    return _widget;
  }
}
