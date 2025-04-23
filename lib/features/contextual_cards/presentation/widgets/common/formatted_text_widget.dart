import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fam_assignment/features/contextual_cards/data/models/presentation_models/presentation_models.dart';

class FormattedTextWidget extends StatelessWidget {
  final FormattedTextModel formattedText;

  const FormattedTextWidget({
    super.key,
    required this.formattedText,
  });

  @override
  Widget build(BuildContext context) {
    final baseTextStyle = TextStyle(
      color: formattedText.color != null 
          ? Color(int.parse(formattedText.color!.replaceAll('#', '0xFF'))) 
          : Colors.black,
      fontSize: formattedText.fontSize?.toDouble() ?? 16,
      fontStyle: _getFontStyle(formattedText.fontStyle),
      decoration: formattedText.fontStyle == 'underline' ? TextDecoration.underline : null,
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

    // Split the text by {} and build spans
    final parts = text.split('{}');
    for (var i = 0; i < parts.length; i++) {
      // Add the text before the entity
      if (parts[i].isNotEmpty) {
        spans.add(TextSpan(
          text: parts[i],
          style: baseTextStyle,
        ));
      }

      // Add the entity if we haven't reached the end of entities
      if (i < parts.length - 1 && entityIndex < entities.length) {
        final entity = entities[entityIndex];
        spans.add(TextSpan(
          text: entity.text,
          style: TextStyle(
            color: entity.color != null 
                ? Color(int.parse(entity.color!.replaceAll('#', '0xFF'))) 
                : baseTextStyle.color,
            fontSize: entity.fontSize?.toDouble() ?? baseTextStyle.fontSize,
            fontStyle: _getFontStyle(entity.fontStyle) ?? baseTextStyle.fontStyle,
            decoration: entity.fontStyle == 'underline' ? TextDecoration.underline : baseTextStyle.decoration,
            fontFamily: entity.fontFamily ?? baseTextStyle.fontFamily,
          ),
          recognizer: entity.url != null
              ? (TapGestureRecognizer()
                ..onTap = () async {
                  try {
                    final Uri uri = Uri.parse(entity.url!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    }
                  } catch (e) {
                    // Handle invalid URL
                  }
                })
              : null,
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
