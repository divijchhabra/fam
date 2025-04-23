import 'package:fam_assignment/core/utils/url_launcher.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class FormattedTextWidget extends StatelessWidget {
  final FormattedTextModel formattedText;

  const FormattedTextWidget({
    super.key,
    required this.formattedText,
  });

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = TextStyle(
      color: Color(int.parse(formattedText.color.replaceAll('#', '0xFF'))),
      fontSize: formattedText.fontSize.toDouble(),
      fontStyle: _getFontStyle(formattedText.fontStyle),
      decoration: formattedText.fontStyle == 'underline'
          ? TextDecoration.underline
          : null,
      fontFamily: formattedText.fontFamily,
    );

    if (formattedText.entities.isEmpty) {
      return Text(
        formattedText.text,
        textAlign: _getTextAlign(formattedText.align),
        style: baseTextStyle,
      );
    }

    final List<InlineSpan> spans = [];
    final text = formattedText.text;
    final entities = formattedText.entities;
    var entityIndex = 0;

    final parts = text.split('{}');
    for (var i = 0; i < parts.length; i++) {
      if (parts[i].isNotEmpty) {
        spans.add(TextSpan(
          text: parts[i],
          style: baseTextStyle,
        ));
      }

      if (i < parts.length - 1 && entityIndex < entities.length) {
        final entity = entities[entityIndex];
        spans.add(TextSpan(
          text: entity.text,
          style: TextStyle(
            color: Color(int.parse(entity.color.replaceAll('#', '0xFF'))),
            fontSize: entity.fontSize.toDouble(),
            fontStyle:
                _getFontStyle(entity.fontStyle) ?? baseTextStyle.fontStyle,
            decoration: entity.fontStyle == 'underline'
                ? TextDecoration.underline
                : baseTextStyle.decoration,
            fontFamily: entity.fontFamily,
          ),
          recognizer: (TapGestureRecognizer()
            ..onTap = () async {
              await UrlLauncher.launch(entity.url);
            }),
        ));
        entityIndex++;
      }
    }

    return RichText(
      textAlign: _getTextAlign(formattedText.align),
      text: TextSpan(
        style: baseTextStyle,
        children: spans,
      ),
    );
  }

  TextAlign _getTextAlign(String? align) {
    switch (align?.toLowerCase()) {
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      case 'center':
        return TextAlign.center;
      default:
        return TextAlign.left;
    }
  }

  FontStyle? _getFontStyle(String? style) {
    switch (style?.toLowerCase()) {
      case 'italic':
        return FontStyle.italic;
      default:
        return FontStyle.normal;
    }
  }
}
