// lib/features/home/home_controller.dart

import 'package:get/get.dart';
import '../../data/repositories/flashcard_repository.dart';

class HomeController extends GetxController {
  final FlashcardRepository repository;
  HomeController(this.repository);
}
