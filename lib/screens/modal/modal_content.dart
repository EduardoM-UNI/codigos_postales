import 'package:flutter/material.dart';

class ModalContent extends StatefulWidget {
  final Function(Map<String, String>) onSave;

  const ModalContent({super.key, required this.onSave});

  @override
  State<ModalContent> createState() => _ModalContentState();
}

class _ModalContentState extends State<ModalContent> {
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    postalCodeController.dispose();
    cityController.dispose();
    super.dispose();
  }

  void _saveAndClose() {
    widget.onSave({
      "postalCode": postalCodeController.text,
      "city": cityController.text,
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Busqueda por Codigo Postal o Poblacion",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: postalCodeController,
          decoration: const InputDecoration(labelText: "Codigo Postal"),
        ),
        TextField(
          controller: cityController,
          decoration: const InputDecoration(labelText: "Poblacion"),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: _saveAndClose,
              child: const Text("Buscar"),
            ),
          ],
        ),
      ],
    );
  }
}
