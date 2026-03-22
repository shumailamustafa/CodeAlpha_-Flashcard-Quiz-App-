// lib/features/manage/manage_controller.dart

import 'package:get/get.dart';
import '../../data/repositories/flashcard_repository.dart';

import '../../data/models/flashcard.dart';
import '../home/home_controller.dart';

class ManageController extends GetxController {
  final FlashcardRepository repository;
  ManageController(this.repository);

  final RxList<Flashcard> allCards = <Flashcard>[].obs;
  final RxList<Flashcard> filteredCards = <Flashcard>[].obs;
  final RxString searchQuery = ''.obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadCards();
    
    // Set up real-time search filtering
    ever(searchQuery, (_) => _applyFilter());
  }

  void loadCards() {
    isLoading.value = true;
    try {
      final cards = repository.getAllCards();
      allCards.assignAll(cards);
      _applyFilter();
    } finally {
      isLoading.value = false;
    }
  }

  void _applyFilter() {
    if (searchQuery.isEmpty) {
      filteredCards.assignAll(allCards);
    } else {
      final query = searchQuery.value.toLowerCase();
      filteredCards.assignAll(
        allCards.where((card) =>
            card.question.toLowerCase().contains(query) ||
            card.answer.toLowerCase().contains(query))
            .toList(),
      );
    }
  }

  void addCard(String question, String answer) {
    repository.addCard(question, answer);
    loadCards();
    _syncHome();
  }

  void updateCard(String id, String question, String answer) {
    repository.updateCard(id, question, answer);
    loadCards();
    _syncHome();
  }

  void deleteCard(String id) {
    repository.deleteCard(id);
    loadCards();
    _syncHome();
  }

  void _syncHome() {
    if (Get.isRegistered<HomeController>()) {
      Get.find<HomeController>().loadCards();
    }
  }
}
