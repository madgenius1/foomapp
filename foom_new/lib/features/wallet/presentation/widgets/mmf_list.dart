import 'package:flutter/material.dart';

class MmfList extends StatelessWidget {
  final String? selectedMmf;
  final Function(String) onSelect;

  const MmfList({super.key, required this.selectedMmf, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    final mmfs = ['MMF Alpha', 'MMF Beta', 'MMF Growth'];

    return Column(
      children: mmfs.map((mmf) {
        return RadioListTile<String>(
          title: Text(mmf),
          value: mmf,
          groupValue: selectedMmf,
          onChanged: (value) {
            if (value != null) onSelect(value);
          },
        );
      }).toList(),
    );
  }
}
