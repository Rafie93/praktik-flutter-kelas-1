import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1a/service/S3Service.dart';
import 'package:image_picker/image_picker.dart';

final db = FirebaseFirestore.instance;
class ImageUploadScreen extends StatefulWidget {
  @override
  _ImageUploadScreenState createState() => _ImageUploadScreenState();
}

class _ImageUploadScreenState extends State<ImageUploadScreen> {
  File? _imageFile;
  bool _isUploading = false;
  String? _imageUrl;
  TextEditingController nameController = TextEditingController();
  final S3Service _s3Service = S3Service();
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
        _imageUrl = null;
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_imageFile == null) return;

    setState(() {
      _isUploading = true;
    });

    try {
      final fileName = 'images/${DateTime.now().millisecondsSinceEpoch}.jpg';
      final url = await _s3Service.uploadFile(_imageFile!, fileName);

      setState(() {
        _imageUrl = url;
        _isUploading = false;
      });
      db.collection("product").add({
        'nama':nameController.text,
        'foto':url!
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Upload berhasil!')),
      );
    } catch (e) {
      setState(() {
        _isUploading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal upload: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload ke S3')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // if (_imageFile != null) Image.file(_imageFile!, height: 200),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pilih Gambar'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter your nama produk',
                labelText: 'Nama Produk',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isUploading ? null : _uploadImage,
              child: _isUploading
                  ? CircularProgressIndicator()
                  : Text('Upload ke S3'),
            ),
            if (_imageUrl != null) ...[
              SizedBox(height: 20),
              Text('URL Gambar:'),
              SelectableText(_imageUrl!),
            ],
          ],
        ),
      ),
    );
  }
}
