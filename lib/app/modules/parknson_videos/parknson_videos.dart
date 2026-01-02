import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/controller/parknson_test_controller.dart';
import '../../data/enum/data_status.dart';
import '../../shared/contstant/color_manager.dart';
import '../../shared/contstant/style_manager.dart';
import '../../shared/contstant/values_manager.dart';
import '../../shared/utils/utils.dart';
import '../../shared/widget/app_bar.dart';
import '../../shared/widget/my_loading.dart';

class ParknsonVideos extends StatefulWidget {
  const ParknsonVideos({super.key});

  @override
  State<ParknsonVideos> createState() => _ParknsonVideosState();
}

class _ParknsonVideosState extends State<ParknsonVideos> {
  final controller = Get.find<ParknsonTestController>(tag: 'parknson_test_controller');



  @override
  void initState() {
   Future.delayed(Duration.zero,()async{
     await controller.getParknsonVideos();
   });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);


    return Scaffold(
      backgroundColor: Colors.white,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const ScreenAppBar(title: 'parknson_videos'),
          Obx(() {
            if (controller.getParknsonVideosStatus.value==ApiStatus.loading) {
              return const Center(child:MyLoading());
            }

            if (controller.videos.isEmpty) {
              return const Center(
                child: Text(
                  'No videos available',
                  style: TextStyle(fontSize: 16),
                ),
              );
            }

            return Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: AppPadding.kPadding/2),
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // responsive feel
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: controller.videos.length,
                        itemBuilder: (context, index) {
                          final video = controller.videos[index];

                          return _VideoCard(
                            title: video.title??'',
                            notes: video.notes??'',
                            subscription: video.subscribe??'',
                            videoUrl: video.videoUrl??'',
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
class _VideoCard extends StatelessWidget {
  final String title;
  final String notes;
  final String subscription;
  final String videoUrl;

  const _VideoCard({
    required this.title,
    required this.notes,
    required this.subscription,
    required this.videoUrl,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () async {
        final uri = Uri.parse(videoUrl);
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      },
      child: Card(
        elevation: 15,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                decoration: BoxDecoration(
                  color: ColorManager.kPrimary.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(14),
                ),
                child:  Center(
                  child: Icon(
                    Icons.play_circle_fill,
                    size: 48,
                    color: ColorManager.kPrimary,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              /// Title
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              /// Notes
              Text(
                notes,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodySmall,
              ),

              const Spacer(),

              /// Footer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _SubscriptionChip(subscription: subscription),
                  const Icon(Icons.open_in_new, size: 18),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubscriptionChip extends StatelessWidget {
  final String subscription;

  const _SubscriptionChip({required this.subscription});

  @override
  Widget build(BuildContext context) {
    final isPremium = subscription.toLowerCase() == 'premium';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: isPremium ? Colors.orange.shade100 : Colors.green.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        subscription,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: isPremium ? Colors.orange.shade800 : Colors.green.shade800,
        ),
      ),
    );
  }
}

