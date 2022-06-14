import 'package:flutter/cupertino.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/domain/entities/event_entity.dart';
import 'package:test_template/src/features/templates_ui/ticket_challenge/presentation/widgets/molecules/expanded_item_event.dart';

class ExpandedItemEventView extends ExpandedEvent {
  const ExpandedItemEventView({
    Key? key,
    required this.index,
    required this.event,
    required double imageSize,
    required double top,
    required double left,
    required double imageLeftRadius,
    required double imageRightRadius,
    required Alignment alignment,
    required bool isVisible,
    required double widthContainer,
    required double contentLeftRadius,
    required double contentRightRadius,
  }) : super(
          key: key,
          imageSize: imageSize,
          top: top,
          left: left,
          imageLeftRadius: imageLeftRadius,
          imageRightRadius: imageRightRadius,
          alignment: alignment,
          isVisible: isVisible,
          widthContainer: widthContainer,
          contentLeftRadius: contentLeftRadius,
          contentRightRadius: contentRightRadius,
        );

  final int index;
  final EventEntity event;

  @override
  Widget build(BuildContext context) {
    return ExpandedItemEvent(
      index: index,
      link: event.link,
      title: event.title,
      date: event.date,
      location: event.location,
      imageSize: imageSize,
      top: top,
      left: left,
      imageLeftRadius: imageLeftRadius,
      imageRightRadius: imageRightRadius,
      alignment: alignment,
      isVisible: isVisible,
      widthContainer: widthContainer,
      contentLeftRadius: contentLeftRadius,
      contentRightRadius: contentRightRadius,
    );
  }
}
