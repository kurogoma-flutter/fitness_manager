import 'package:flutter/material.dart';

import '../../component/color/color_theme.dart';

/// `Heatmap` ウィジェットは日時データに基づいてヒートマップを表示します。
///
/// - [data]: ヒートマップのデータ。heat
/// - [colorSet]: 値ごとの色セット。
/// - [cellSize]: 各セルのサイズ。
/// - [defaultColor]: デフォルトのセル色。
/// - [targetYear]: ヒートマップの対象年。
///
class Heatmap extends StatefulWidget {
  const Heatmap({
    required this.data,
    required this.colorSet,
    super.key,
    this.cellSize = 16.0,
    this.defaultColor,
    this.targetYear,
  });
  final List<Map<DateTime, int>> data;
  final Map<int, Color> colorSet;
  final double cellSize;
  final Color? defaultColor;
  final int? targetYear;

  @override
  _HeatmapState createState() => _HeatmapState();
}

class _HeatmapState extends State<Heatmap> {
  DateTime? _selectedDate;
  OverlayEntry? _overlayEntry;

  final ScrollController _scrollController = ScrollController();

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 初期位置で自分の月が見えるようにする
      final currentMonth = DateTime.now().month;
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent * ((currentMonth - 1) / 12),
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeOut,
      );
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      child: GestureDetector(
        onLongPress: _showPopupMenu,
        onLongPressUp: _hidePopupMenu,
        child: SizedBox(
          height: widget.cellSize * 7,
          child: CustomPaint(
            painter: HeatmapPainter(
              data: widget.data,
              colorSet: widget.colorSet,
              cellSize: widget.cellSize,
              onTapCell: (date) => setState(() => _selectedDate = date),
            ),
            size: Size(widget.cellSize * (365 ~/ 7), widget.cellSize * 7),
          ),
        ),
      ),
    );
  }

  void _showPopupMenu() {
    if (_selectedDate == null) {
      return;
    }

    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 140, // Adjust as needed
        left: MediaQuery.of(context).size.width * 0.4, // Adjust as needed
        child: Material(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.grey[200], // Adjust color as per your theme
              borderRadius: BorderRadius.circular(4),
              boxShadow: const [
                BoxShadow(offset: Offset(0, 2), blurRadius: 6),
              ],
            ),
            child: Center(
              child: Text(
                '${_getScoreForDate(_selectedDate!)} tracks ${_selectedDate!.year}-${_selectedDate!.month}-${_selectedDate!.day}',
                style: const TextStyle(fontSize: 12), // Adjust style as needed
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void _hidePopupMenu() {
    _overlayEntry?.remove();
  }

  int _getScoreForDate(DateTime date) {
    final mapData = widget.data.firstWhere(
      (map) => map.containsKey(date),
      orElse: () => {},
    );

    if (mapData.isEmpty) {
      return 0;
    }
    return mapData[date] ?? 0;
  }
}

extension FirstOrElseExtension<T> on Iterable<T> {
  T firstOrElse(T Function() orElse) {
    return isEmpty ? orElse() : first;
  }
}

/// `HeatmapPainter` クラスは、ヒートマップのカスタム描画を行います。
class HeatmapPainter extends CustomPainter {
  HeatmapPainter({
    required this.data,
    this.colorSet = const {},
    this.cellSize = 16.0,
    this.onTapCell,
    this.defaultColor,
    this.targetYear,
  });

  final List<Map<DateTime, int>> data;
  final Map<int, Color> colorSet;
  final double cellSize;
  final void Function(DateTime date)? onTapCell;
  final Color? defaultColor;
  final int? targetYear;

  @override
  bool? hitTest(Offset position) {
    final week = (position.dx ~/ cellSize).toInt();
    final day = (position.dy ~/ cellSize).toInt();
    final targetYearNumber = targetYear ?? DateTime.now().year;

    final selectedDate =
        DateTime(targetYearNumber, 1, 1).add(Duration(days: (week * 7) + day));
    if (onTapCell != null) {
      onTapCell!(selectedDate);
    }

    return super.hitTest(position);
  }

  Color _getColorFromSet(int value) {
    final thresholds = colorSet.keys.toList()..sort();
    for (final threshold in thresholds) {
      if (value <= threshold) {
        return colorSet[threshold]!;
      }
    }
    return defaultColor ?? ColorTheme.secondaryBackGround;
  }

  @override
  void paint(Canvas canvas, Size size) {
    const borderThickness = 0.5;
    final targetYearNumber = targetYear ?? DateTime.now().year;
    final currentYearStartDate = DateTime(targetYearNumber, 1, 1);

    final filteredData = data
        .where((item) => item.keys.any((key) => key.year == targetYearNumber))
        .toList();

    for (var week = 0; week < (365 ~/ 7); week++) {
      for (var day = 0; day < 7; day++) {
        final x = week * cellSize;
        final y = day * cellSize;

        final currentCellDate =
            currentYearStartDate.add(Duration(days: (week * 7) + day));
        final matchingData = filteredData.firstWhere(
          (item) =>
              item.keys.any((key) => key.isAtSameMomentAs(currentCellDate)),
          orElse: () => {},
        );

        var cellColor = ColorTheme.secondaryBackGround;
        if (matchingData.isNotEmpty) {
          final value = matchingData.values.first;
          cellColor = _getColorFromSet(value);
        }

        canvas.drawRect(
          Rect.fromPoints(
            Offset(x, y),
            Offset(
              x + cellSize - borderThickness,
              y + cellSize - borderThickness,
            ),
          ),
          Paint()..color = cellColor,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
