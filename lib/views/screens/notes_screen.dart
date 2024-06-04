import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_49/controllers/note_controller.dart';
import 'package:lesson_49/models/note/note.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  final notesController = NoteController();
  late List<Note> notes = notesController.notes;
  final titleController = TextEditingController();
  final subtitleController = TextEditingController();
  String titleError = "";
  String subtitleError = "";

  checking() {
    if (titleController.text.isEmpty) {
      titleError = "Note nomi bo'sh bo'lishi mumkin emas";
    } else {
      titleError = "";
    }
    if (subtitleController.text.isEmpty) {
      subtitleError = "Note bo'sh bo'lishi mumkin emas";
    } else {
      subtitleError = "";
    }
    if (subtitleError.isEmpty && titleError.isEmpty) {
      addingNewNote(titleController.text, subtitleController.text);
    }
  }

  addingNewNote(title, subtitle) {
    notes.add(
      Note(
        title: title,
        description: subtitle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notes",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            for (var i = 0; i < notes.length; i++)
              Column(
                children: [
                  ListTile(
                    tileColor: Colors.green.shade100,
                    title: Text(
                      notes[i].title,
                    ),
                    subtitle: Text(
                      notes[i].description,
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            notes.remove(notes[i]);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                  const Gap(30),
                ],
              )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Adding new Note",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                      const Gap(20),
                      TextField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'New title',
                          border: const OutlineInputBorder(),
                          errorText: titleError,
                        ),
                      ),
                      const Gap(10),
                      TextField(
                        controller: subtitleController,
                        decoration: InputDecoration(
                          labelText: 'New description',
                          border: const OutlineInputBorder(),
                          errorText: subtitleError,
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        checking();
                        setState(() {});
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Add",
                      ),
                    )
                  ],
                );
              });
        },
        backgroundColor: Colors.teal.shade400,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
