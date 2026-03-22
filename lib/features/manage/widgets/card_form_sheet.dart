// lib/features/manage/widgets/card_form_sheet.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/flashcard.dart';
import '../../../core/utils/validators.dart';
import '../manage_controller.dart';

class CardFormSheet extends StatelessWidget {
  final Flashcard? card;
  final ManageController controller = Get.find<ManageController>();

  CardFormSheet({super.key, this.card});

  final _formKey = GlobalKey<FormState>();
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();

  static void show({Flashcard? card}) {
    Get.bottomSheet(
      CardFormSheet(card: card),
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (card != null) {
      _questionController.text = card!.question;
      _answerController.text = card!.answer;
    }

    return Padding(
      padding: EdgeInsets.only(
        top: 32,
        left: 24,
        right: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 32,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              card == null ? 'Add New Card' : 'Edit Flashcard',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _questionController,
              decoration: const InputDecoration(
                labelText: 'Question',
                hintText: 'Enter your question...',
              ),
              maxLines: 2,
              validator: Validators.validateQuestion,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _answerController,
              decoration: const InputDecoration(
                labelText: 'Answer',
                hintText: 'Enter the answer...',
              ),
              maxLines: 3,
              validator: Validators.validateAnswer,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _submit,
              child: Text(card == null ? 'Create Card' : 'Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      if (card == null) {
        controller.addCard(_questionController.text, _answerController.text);
      } else {
        controller.updateCard(card!.id, _questionController.text, _answerController.text);
      }
      Get.back();
    }
  }
}
