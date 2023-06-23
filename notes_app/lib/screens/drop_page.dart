import 'package:flutter/material.dart';

class DropPage extends StatefulWidget {
  const DropPage({super.key});

  @override
  State<DropPage> createState() => _DropPageState();
}

class _DropPageState extends State<DropPage> {
  final TextEditingController noteController = TextEditingController();
  NotesLabel? selectedColor;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<NotesLabel>> notesEntries =
        <DropdownMenuEntry<NotesLabel>>[];
    for (final NotesLabel note in NotesLabel.values) {
      notesEntries.add(
        DropdownMenuEntry<NotesLabel>(
          value: note,
          label: note.label,
          // enabled: note.label != 'Grey',
        ),
      );
    }

    return DropdownMenu<NotesLabel>(
      initialSelection: NotesLabel.biology,
      controller: noteController,
      label: const Text('All Notes'),
      dropdownMenuEntries: notesEntries,
      onSelected: (NotesLabel? note) {
        setState(() {
          selectedColor = note;
        });
      },
    );
  }
}

enum NotesLabel {
  biology('Biology'),
  chemistry('Chemistry'),
  physic('Physic'),
  english('English'),
  computerScience('Computer Science');

  const NotesLabel(this.label);
  final String label;
}
