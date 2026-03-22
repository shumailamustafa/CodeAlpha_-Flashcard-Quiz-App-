// lib/features/home/home_screen.dart

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'home_controller.dart';
import 'widgets/flip_card.dart';
import '../../app/routes/app_routes.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlashMind'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Get.toNamed(Routes.manage),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.cards.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.layers_clear, size: 80, color: Colors.grey),
                const SizedBox(height: 16),
                const Text(
                  'No flashcards yet!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text('Create some in the Manage section'),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => Get.toNamed(Routes.manage),
                  child: const Text('Go to Manage'),
                ),
              ],
            ),
          );
        }

        final card = controller.currentCard;
        if (card == null) return const SizedBox();

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Progress/Counter
              Text(
                'Card ${controller.currentIndex.value + 1} of ${controller.cards.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),

              // The Flip Card
              Expanded(
                child: FlipCard(
                  isFlipped: controller.isFlipped.value,
                  onTap: controller.toggleFlip,
                  front: _buildCardFace(card.question, 'Question'),
                  back: _buildCardFace(card.answer, 'Answer'),
                ),
              ),

              const SizedBox(height: 48),

              // Navigation Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _navButton(
                    icon: Icons.arrow_back_ios_new,
                    onPressed: controller.currentIndex.value > 0
                        ? controller.previousCard
                        : null,
                  ),
                  _navButton(
                    icon: Icons.arrow_forward_ios,
                    onPressed: controller.currentIndex.value < controller.cards.length - 1
                        ? controller.nextCard
                        : null,
                  ),
                ],
              ),
              const SizedBox(height: 24),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildCardFace(String text, String label) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(32),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label.toUpperCase(),
              style: const TextStyle(
                letterSpacing: 2,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navButton({required IconData icon, VoidCallback? onPressed}) {
    return IconButton.filled(
      onPressed: onPressed,
      icon: Icon(icon),
      padding: const EdgeInsets.all(16),
      style: IconButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
