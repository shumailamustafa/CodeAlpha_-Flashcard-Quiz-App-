// lib/features/manage/manage_controller.dart

import 'package:get/get.dart';
import '../../data/repositories/flashcard_repository.dart';

class ManageController extends GetxController {
  final FlashcardRepository repository;
  ManageController(this.repository);
}
