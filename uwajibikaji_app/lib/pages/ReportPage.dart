import 'dart:io';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'theme.dart';

class ReportPage extends StatefulWidget {
  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _descriptionController = TextEditingController();
  final _categories = ['Roads', 'Bridges', 'Water Supply', 'Electricity'];
  String? _selectedCategory;
  double _severity = 0.5;
  XFile? _imageFile;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report an Issue')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                hintText: 'Describe the issue...',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            DropdownButtonFormField(
              value: _selectedCategory,
              items: _categories.map((cat) => DropdownMenuItem(
                value: cat, child: Text(cat))).toList(),
              onChanged: (value) => setState(() => _selectedCategory = value),
              decoration: InputDecoration(
                labelText: 'Category',
                prefixIcon: Icon(Icons.category, color: AppColors.primaryColor),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Severity'),
                Expanded(
                  child: Slider(
                    value: _severity,
                    min: 0,
                    max: 1,
                    divisions: 2,
                    label: _severity == 0 ? 'Low' : _severity == 1 ? 'High' : 'Medium',
                    onChanged: (value) => setState(() => _severity = value),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt, color: Colors.white),
              label: Text('Take Photo'),
              onPressed: _pickImage,
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.accentColor),
            ),
            if (_imageFile != null) Image.file(File(_imageFile!.path)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle report submission
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
              ),
              child: Text('Submit Report', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
