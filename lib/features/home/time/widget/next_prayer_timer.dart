import 'dart:async';
import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_styles.dart';

class NextPrayerTimer extends StatefulWidget {
  const NextPrayerTimer({super.key, required this.timeRemaining});
  final Duration timeRemaining;
  @override
  State<NextPrayerTimer> createState() => _NextPrayerTimerState();
}

class _NextPrayerTimerState extends State<NextPrayerTimer> {
  late Timer timer;
  late Duration _timeRemaining;

  @override
  void initState() {
    super.initState();
    _timeRemaining = widget.timeRemaining;

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining.inSeconds > 0) {
          _timeRemaining -= Duration(seconds: 1);
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  String _formateDuration(Duration timeRemaining) {
    String hours = timeRemaining.inHours.toString().padLeft(2, "0");
    String minutes = timeRemaining.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, "0");
    String seconds = timeRemaining.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, "0");
    return "$hours:$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Next Pray- ",
          style: AppStyles.bold16Black.copyWith(
            color: AppColors.backgroundColor,
          ),
        ),
        Text(
          _formateDuration(_timeRemaining),
          style: AppStyles.bold16Black.copyWith(
            color: AppColors.backgroundColor,
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.volume_off)),
      ],
    );
  }
}
