import 'package:flutter/material.dart';
import 'package:test_task/presentation/resources/text_resources.dart';

class LoadingErrorWidget extends StatelessWidget {
  const LoadingErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text(AppTextResources.notLoaded));
  }
}
