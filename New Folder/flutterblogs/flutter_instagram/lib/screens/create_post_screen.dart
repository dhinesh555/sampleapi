import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  File _image;
  TextEditingController _captionController = TextEditingController();
  String _caption = '';
  bool _isLoading = false;

  _showSelectImageDialog() {
    return _androidDialog();
  }

  _androidDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('CreatePost'),
            children: <Widget>[
              SimpleDialogOption(
                child: Text('photo with Camera'),
                onPressed: () => _handleImage(ImageSource.camera),
              ),
              SimpleDialogOption(
                child: Text('photo with Gallery'),
                onPressed: () => _handleImage(ImageSource.gallery),
              ),
              SimpleDialogOption(
                child: Text('Cancel'),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  _handleImage(ImageSource source) async {
    Navigator.pop(context);
    File imageFile = await ImagePicker.pickImage(source: source);
    if (imageFile != null) {
      imageFile = await _cropImage(imageFile);
      setState(() {
        _image = imageFile;
      });
    }
  }

  _cropImage(File imageFile) async {
    File croppedImage = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        aspectRatio: CropAspectRatio(
          ratioX: 0.5,
          ratioY: 0.5,
        ));
    return croppedImage;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Create Post',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () => print('Added'),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: _showSelectImageDialog,
              child: Container(
                width: width,
                height: width,
                color: Colors.grey[300],
                child: _image == null
                    ? Icon(
                        Icons.add_a_photo,
                        color: Colors.white70,
                        size: 150,
                      )
                    : Image(
                        image: FileImage(_image),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ],
        ));
  }
}
