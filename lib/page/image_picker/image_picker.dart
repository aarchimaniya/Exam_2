import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_detials_app/my_app.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    double h = size.height;
    double w = size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Detail"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MyApp.homepage);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            color: Colors.orange.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                      // image: DecorationImage(
                      //   image: FileImage(User.image!),
                      // ),
                    ),
                  ),
                  FloatingActionButton.small(
                    onPressed: () async {
                      ImagePicker picker = ImagePicker();
                      XFile? xfile =
                          await picker.pickImage(source: ImageSource.gallery);
                      User.image = File(xfile!.path);
                    },
                    child: const Icon(CupertinoIcons.camera),
                  ),
                ],
              ),
              //name
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Form(
                        key: formkey,
                        child: TextFormField(
                          onSaved: (val) {
                            User.name = val;
                          },
                          validator: (val) => (val!.isEmpty) ? "QWE" : null,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            hintText: "Name",
                            labelText: "Name",
                            labelStyle: const TextStyle(
                              color: Colors.orange,
                            ),
                            helperStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //gr_id
              Row(
                children: [
                  Expanded(
                    child: Form(
                      key: formkey,
                      child: TextFormField(
                        onSaved: (val) {
                          User.name = val;
                        },
                        validator: (val) => (val!.isEmpty) ? "QWE" : null,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "1001",
                          labelText: "Gr_id",
                          labelStyle: const TextStyle(
                            color: Colors.orange,
                          ),
                          helperStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //standard
              Row(
                children: [
                  Expanded(
                    child: Form(
                      key: formkey,
                      child: TextFormField(
                        onSaved: (val) {
                          User.name = val;
                        },
                        validator: (val) => (val!.isEmpty) ? "QWE" : null,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          hintText: "12",
                          labelText: "standard",
                          labelStyle: const TextStyle(
                            color: Colors.orange,
                          ),
                          helperStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                    }
                  },
                  icon: const Icon(Icons.save_alt_outlined),
                  label: const Text("Save"),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.orange.shade200,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
