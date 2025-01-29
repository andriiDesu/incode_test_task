import 'package:flutter/material.dart';
import 'package:incode_test_task/core/extensions/build_context_extension.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    required this.url,
    this.loaderHeight = 200,
    super.key,
  });

  final String url;
  final double loaderHeight;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      errorBuilder: (_, __, ___) => _loadingImageBuilder(context),
      loadingBuilder: (_, __, ___) => _loadingImageBuilder(context),
    );
  }

  Widget _loadingImageBuilder(BuildContext context) {
    return Container(
      height: loaderHeight,
      alignment: Alignment.center,
      child: Text(
        context.strings.noImageAvailable,
      ),
    );
  }
}
