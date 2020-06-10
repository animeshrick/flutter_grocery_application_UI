import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  void showLongToast() {
    Fluttertoast.showToast(
      msg: "Active Now",
      toastLength: Toast.LENGTH_LONG,
      timeInSecForIosWeb: 5,
    );
  }

  Future<void> _showChoiceDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(0xff201F23),
            title: Text(
              "Make a choice",
              style: TextStyle(color: Colors.red),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.0)),
                  ListTile(
                    leading: Icon(
                      Icons.linked_camera,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Camera',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      getImage(ImageSource.camera);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.photo_library,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Choose From Gallery',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      getImage(ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                    ),
                    title: Text(
                      'Remove Picture  !',
                      style: TextStyle(color: Colors.red),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getImage(source) async {
    // ignore: deprecated_member_use
    var image = await ImagePicker.pickImage(source: source);
    print(image.path);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var _name;
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
            color: Colors.black54,
          ),
          backgroundColor: Color(0xfff9f9f9),
          title: Text(
            "Profile",
            style: TextStyle(
                fontSize: 29.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey),
          ),
          centerTitle: true,
          elevation: 0,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 50.0, left: 50.0, top: 15.0),
              child: InkWell(
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/user.png'))),
                  ),
                  onTap: () {
                    _showChoiceDialogue(context);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    "Active Status ",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                        color: Colors.blueGrey),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 162),
                    child: Switch(
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.red,
                      value: false,
                      onChanged: (value) {
                        showLongToast();
                      },
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(labelText: 'Full Name'),
              onSaved: (v) => _name.street = v,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Phone No'),
//            onSaved: (v) => contact.phones = [Item(label: "mobile", value: v)],
//            keyboardType: TextInputType.phone,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'E-mail'),
//            onSaved: (v) => contact.emails = [Item(label: "work", value: v)],
//            keyboardType: TextInputType.emailAddress,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: "Address"),
//            onSaved: (v) => contact.emails = [Item(label: "work", value: v)],
//            keyboardType: TextInputType.emailAddress,
            ),
            IconButton(icon: Icon(Icons.save), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
