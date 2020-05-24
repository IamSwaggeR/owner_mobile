import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ownerapp/colors/color.dart';
import 'package:ownerapp/constAndString/string.dart';
import 'package:ownerapp/widgets/button/click_button.dart';
import 'package:ownerapp/widgets/margin/margin_top.dart';
import 'package:ownerapp/widgets/navigation/buttomNavBar.dart';
import 'package:ownerapp/widgets/overviews/profile/text_input_profile.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File _image;
  List<String> _gender = ['Male', 'Female'];
  String _selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: appColor,
      bottomNavigationBar: ButtomNavBar(
        isActiveProfile: true,
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: <Widget>[
          Stack(
            children: [
              Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: appMainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(56),
                    bottomRight: Radius.circular(56),
                  ),
                ),
                alignment: Alignment.center,
                child: Material(
                  shape: CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    height: 160,
                    width: 160,
                    child: _image != null
                        ? Image.file(_image)
                        : SvgPicture.asset(account_pic_null),
                  ),
                ),
              ),
              Positioned(
                bottom: 65,
                left: (MediaQuery.of(context).size.width * 0.5) + 45,
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromRGBO(232, 232, 232, 1),
                      border: Border.all(
                        color: Colors.white,
                      )),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: IconButton(
                      onPressed: () {
//                        alertDiolog();
                      },
                      tooltip: 'Pick Image',
                      padding: EdgeInsets.all(0.0),
                      icon: Icon(
                        Icons.camera_alt,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                MarginTop(),
                TextInputProfile(
                  text: first_name,
                ),
                MarginTop(),
                TextInputProfile(
                  text: last_name,
                ),
                MarginTop(),
                TextInputProfile(
                  text: national_ID,
                  keyboardType: TextInputType.number,
                ),
                MarginTop(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(24),
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(1, 1),
                            spreadRadius: -6,
                            blurRadius: 10,
                            color: appMainColor),
                      ]),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text('Select your gender'),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black
                      ),
                      // Not necessary for Option 1
                      value: _selectedLocation,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedLocation = newValue;
                        });
                      },
                      items: _gender.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                ),
                MarginTop(),
                TextInputProfile(
                  text: phone_number,
                  keyboardType: TextInputType.phone,
                ),
                MarginTop(),
                ClickButton(
                  text: 'Save',
                  press: () {
                    Navigator.of(context).pop();
                  },
                ),
                MarginTop(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future getImageCamera() async {
    Navigator.of(context).pop();
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    _cropImage(image);
  }

  Future getImageGallery() async {
    Navigator.of(context).pop();
    var galleryImage =
        await ImagePicker.pickImage(source: ImageSource.gallery);

    _cropImage(galleryImage);
  }

  Future<Null> _cropImage(File imageFile) async {
    File croppedFile = await ImageCropper.cropImage(
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      sourcePath: imageFile.path,
      maxWidth: 512,
      maxHeight: 512,
    );
    setState(() {
      _image = croppedFile;
    });
  }

//  Future<void> alertDiolog() {
//    return showModalBottomSheet(
//      context: context,
//      builder: (context) {
//        return Container(
//          height: 120,
//          color: Color(0xFF737373),
//          child: Container(
//            decoration: BoxDecoration(
//              color: Theme.of(context).canvasColor,
//              borderRadius: BorderRadius.only(
//                topRight: Radius.circular(30),
//                topLeft: Radius.circular(30),
//              ),
//            ),
//            child: Column(
//              children: [
//                ListTile(
//                  leading: Icon(Icons.camera_enhance),
//                  title: Text('Take a picture'),
//                  onTap: getImageCamera,
//                ),
//                ListTile(
//                  leading: Icon(Icons.check),
//                  title: Text('Select from gallery'),
//                  onTap: getImageGallery,
//                ),
//              ],
//            ),
//          ),
//        );
//      },
//    );
//  }

}
