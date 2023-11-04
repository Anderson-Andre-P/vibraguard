import 'package:flutter/material.dart';

class AddWorkOrderWidget extends StatefulWidget {
  final void Function(String title, String description, String priority) onSave;

  const AddWorkOrderWidget({Key? key, required this.onSave}) : super(key: key);

  @override
  _AddWorkOrderWidgetState createState() => _AddWorkOrderWidgetState();
}

class _AddWorkOrderWidgetState extends State<AddWorkOrderWidget> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedPriority = 'High';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TextFormField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
          ),
          DropdownButtonFormField<String>(
            value: _selectedPriority,
            onChanged: (String? newValue) {
              setState(() {
                _selectedPriority = newValue!;
              });
            },
            items: <String>['High', 'Medium', 'Low']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            decoration: const InputDecoration(labelText: 'Priority'),
          ),
          ElevatedButton(
            onPressed: () {
              final title = _titleController.text;
              final description = _descriptionController.text;
              final priority = _selectedPriority;

              if (title.isNotEmpty && description.isNotEmpty) {
                widget.onSave(title, description, priority);
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill in all required fields.'),
                  ),
                );
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
