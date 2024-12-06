import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  final List<InlineSpan> textSpans;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;

  const CustomRichText({
    Key? key,
    required this.textSpans,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.clip,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: textSpans,
      ),
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
