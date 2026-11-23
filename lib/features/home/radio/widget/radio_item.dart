import 'package:material_ui/material_ui.dart';
import 'package:islami_app/core/provider/radio_manager_provider.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_styles.dart';
import 'package:provider/provider.dart';

class RadioItem extends StatefulWidget {
  const RadioItem({super.key, required this.url, required this.name});
  final String name;
  final String url;

  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RadioManagerProvider>(
      builder: (context, provider, child) {
        final isCurrentPlayer = provider.currentPlayingUrl == widget.url;
        final isPlaying = provider.isPlaying && isCurrentPlayer;
        final isMuted = isCurrentPlayer && !provider.isVolumeUp;
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primaryColor,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                isPlaying ? Assets.imagesSoundWave : Assets.imagesIslamiLogo,
              ),
            ),
          ),
          child: Column(
            children: [
              Text(widget.name, style: AppStyles.bold20White),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      provider.play(widget.url);
                    },
                    icon: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow_rounded,
                      size: 40,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (isCurrentPlayer) {
                        provider.stop();
                      }
                    },
                    icon: const Icon(Icons.stop_rounded, size: 40),
                  ),
                  IconButton(
                    onPressed: () {
                      if (isCurrentPlayer) {
                        provider.toggleVolume();
                      }
                    },
                    icon: Icon(
                      isMuted ? Icons.volume_mute : Icons.volume_up_rounded,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
