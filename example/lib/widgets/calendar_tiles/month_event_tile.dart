import 'package:example/models/event.dart';
import 'package:flutter/material.dart';
import 'package:kalender/kalender.dart';

class MonthEventTile extends StatelessWidget {
  const MonthEventTile({
    super.key,
    required this.event,
    required this.date,
    required this.tileType,
  });

  final CalendarEvent<Event> event;
  final DateTime date;
  final TileType tileType;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: cardElevation,
      margin: const EdgeInsets.all(2),
      color: cardColor(event.eventData?.color ?? Theme.of(context).colorScheme.primaryContainer),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                event.eventData?.title ?? '',
                style: Theme.of(context).textTheme.bodyMedium,
                maxLines: 1,
              ),
            ),
            // if (event.hasDateCounter && !CalendarTheme.of(context).configuration.isMobileDevice)
            //   Text(
            //     '(${event.dayNumber(date)}/${event.daySpan})',
            //   ),
          ],
        ),
      ),
    );
  }

  Color cardColor(Color color) {
    if (tileType == TileType.ghost) {
      return color.withAlpha(100);
    } else {
      return color;
    }
  }

  double get cardElevation {
    switch (tileType) {
      case TileType.ghost:
        return 0.0;
      case TileType.normal:
        return 4.0;
      case TileType.selected:
        return 8.0;
      default:
        return 0.0;
    }
  }
}