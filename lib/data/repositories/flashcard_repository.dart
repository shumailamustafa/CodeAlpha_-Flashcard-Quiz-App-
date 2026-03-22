// lib/data/repositories/flashcard_repository.dart

import 'package:uuid/uuid.dart';
import '../models/flashcard.dart';
import '../services/storage_service.dart';

abstract class FlashcardRepository {
  List<Flashcard> getAllCards();
  void addCard(String question, String answer);
  void updateCard(String id, String question, String answer);
  void deleteCard(String id);
}

class FlashcardRepositoryImpl implements FlashcardRepository {
  final StorageService _storageService;
  final _uuid = const Uuid();

  FlashcardRepositoryImpl(this._storageService);

  @override
  List<Flashcard> getAllCards() {
    return _storageService.readAll();
  }

  @override
  void addCard(String question, String answer) {
    final cards = _storageService.readAll();
    final newCard = Flashcard(
      id: _uuid.v4(),
      question: question,
      answer: answer,
      createdAt: DateTime.now(),
    );
    cards.add(newCard);
    _storageService.writeAll(cards);
  }

  @override
  void updateCard(String id, String question, String answer) {
    final cards = _storageService.readAll();
    final index = cards.indexWhere((card) => card.id == id);
    if (index != -1) {
      cards[index] = cards[index].copyWith(
        question: question,
        answer: answer,
      );
      _storageService.writeAll(cards);
    }
  }

  @override
  void deleteCard(String id) {
    final cards = _storageService.readAll();
    cards.removeWhere((card) => card.id == id);
    _storageService.writeAll(cards);
  }
}
