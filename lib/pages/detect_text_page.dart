import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ihk_projekt/widgets/architecture_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ihk_projekt/models/imageData.dart';
import 'package:ihk_projekt/services/firestoreService.dart';
import 'package:ihk_projekt/services/upload_service.dart';

class DetectTextPage extends StatefulWidget {
  static String routeName = "/detectText";
  DetectTextPage({Key key}) : super(key: key);

  @override
  _DetectTextPageState createState() => _DetectTextPageState();
}

class _DetectTextPageState extends State<DetectTextPage> {
  File _image;
  final picker = ImagePicker();
  var loading = false;
  var docId = '';
  var gotData = false;
  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  clearSelection() {
    setState(() {
      this._image = null;
      this.docId = "";
      this.loading = false;
    });
  }

  setLoading(bool state) {
    setState(() {
      this.loading = state;
    });
  }

  gotDataTrue(bool state) {
    gotData = state;
  }

  setDocId(String doc) {
    setState(() {
      this.docId = doc;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        elevation: 0,
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              iconSize: 27,
              icon: Icon(Icons.info),
              onPressed: () {
                showDialog(
                    context: context, builder: (_) => ArchitectureDialog());
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                "Detect text in an image",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
              ),
              _image == null
                  ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 40, right: 50.0, top: 30, bottom: 30),
                          child: Text(
                            "With this application you can detect text in an image that you upload. That can be a handwritten note or printed text.",
                            style: TextStyle(
                              color: Theme.of(context).textSelectionColor,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RawMaterialButton(
                              onPressed: getImageFromCamera,
                              elevation: 0,
                              fillColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.camera_alt,
                                size: 35.0,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                            RawMaterialButton(
                              onPressed: getImageFromGallery,
                              elevation: 0,
                              fillColor: Theme.of(context).primaryColor,
                              child: Icon(
                                Icons.image,
                                size: 35.0,
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(15.0),
                              shape: CircleBorder(),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: loading == false
                              ? Image.file(
                                  _image,
                                  height: height * 0.4,
                                )
                              : Image.file(
                                  _image,
                                  height: height * 0.4,
                                  color: Colors.grey.withOpacity(0.5),
                                  colorBlendMode: BlendMode.lighten,
                                ),
                        ),
                        Container(
                            child: loading == false
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: SendImageWidget(
                                      setLoadign: setLoading,
                                      image: _image,
                                      setDocId: setDocId,
                                    ),
                                  )
                                : docId != ''
                                    ? ResultWidget(
                                        docId: this.docId,
                                        clearSelection: this.clearSelection,
                                        gotData: this.gotDataTrue,
                                        gotDataTrue: gotData,
                                      )
                                    : Column(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 8.0, top: 10),
                                            child: CircularProgressIndicator(),
                                          ),
                                          Text('Uploading'),
                                        ],
                                      ))
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class ResultWidget extends StatefulWidget {
  final String docId;
  final Function clearSelection;
  final Function(bool) gotData;
  final bool gotDataTrue;

  ResultWidget({
    Key key,
    this.docId,
    this.clearSelection,
    this.gotData,
    this.gotDataTrue,
  }) : super(key: key);

  @override
  _ResultWidgetState createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  final FirestoreService _firestore = new FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StreamBuilder(
          stream: _firestore.getImageData(widget.docId),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data != null) {
              print("Jetzt");
              this.widget.gotData(true);
              ImageData data = snapshot.data;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15.0, top: 20),
                    child: Text("Extracted Text",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: data.extractedText != null
                        ? Text(
                            data.extractedText,
                            textAlign: TextAlign.center,
                          )
                        : Text(
                            "No text was found",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w800),
                          ),
                  )
                ],
              );
            } else {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, top: 10),
                    child: CircularProgressIndicator(),
                  ),
                  Text("Image is beeing processed"),
                ],
              );
            }
          },
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14.0, bottom: 14),
          child: RaisedButton(
            onPressed: widget.clearSelection,
            color: Theme.of(context).primaryColor,
            child: Icon(Icons.replay, color: Colors.white),
          ),
        )
      ],
    );
  }
}

class SendImageWidget extends StatelessWidget {
  SendImageWidget({
    Key key,
    this.setLoadign,
    this.setDocId,
    this.image,
  }) : super(key: key);
  UploadService uploadService = UploadService();

  final Function(bool) setLoadign;
  final Function(String) setDocId;
  final File image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 40,
          width: MediaQuery.of(context).size.width / 3,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Text(
              'Send',
              style: TextStyle(color: Colors.white),
            ),
          )),
      onTap: () {
        setLoadign(true);
        uploadService.uploadFile(image).then((value) => setDocId(value));
      },
    );
  }
}
