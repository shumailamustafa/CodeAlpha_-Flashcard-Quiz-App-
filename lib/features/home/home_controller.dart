// lib/features/home/home_controller.dart

import 'package:get/get.dart';
import '../../data/models/flashcard.dart';
import '../../data/repositories/flashcard_repository.dart';

class HomeController extends GetxController {
  final FlashcardRepository repository;
  HomeController(this.repository);

  final RxList<Flashcard> cards = <Flashcard>[].obs;
  final RxInt currentIndex = 0.obs;
  final RxBool isFlipped = false.obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCards();
  }

  Future<void> loadCards() async {
    isLoading.value = true;
    try {
      final loadedCards = repository.getAllCards();
      cards.assignAll(loadedCards);
      currentIndex.value = 0;
      isFlipped.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  void nextCard() {
    if (currentIndex.value < cards.length - 1) {
      currentIndex.value++;
      isFlipped.value = false;
    }
  }

  void previousCard() {
    if (currentIndex.value > 0) {
      currentIndex.value--;
      isFlipped.value = false;
    }
  }

  void toggleFlip() {
    isFlipped.toggle();
  }

  Flashcard? get currentCard =>
      cards.isNotEmpty ? cards[currentIndex.value] : null;
}
