import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_detials_app/app_route/imagepicker_attributes/imagepicker_attributes.dart';

class ContactInfoPage extends StatefulWidget {
  const ContactInfoPage({super.key});

  @override
  State<ContactInfoPage> createState() => _ContactInfoPageState();
}

class _ContactInfoPageState extends State<ContactInfoPage> {
  @override
  void dispose() {
    super.dispose();
    FocusManager.instance.primaryFocus?.unfocus();
  }

  // Image Pick Camera
  Future<void> imagePickWithCamera() async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (xFile != null) {
        StudentDataPgval.image = File(xFile.path);
      }
    });
  }

  // Image Pick Gallery
  Future<void> imagePickWithGallery() async {
    ImagePicker picker = ImagePicker();
    XFile? xFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (xFile != null) {
        StudentDataPgval.image = File(xFile.path);
      }
    });
  }

  bool _hide = false;
  int _selected = 0;

  TextEditingController nameController = TextEditingController(text: "Aarchi");
  TextEditingController GRIDController = TextEditingController(text: "3489");
  TextEditingController StandardController =
      TextEditingController(text: "Abc@6060");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Color iconColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Student Information"),
          ),
          backgroundColor: Colors.grey.shade200,
          body: Column(
            children: [
              //TabBar
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 0;
                        });
                        log("Contact clicked...");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: <Color>[
                              Color(0xff003C43),
                              Color(0xffE3FEF7)
                            ],
                          ),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.amber,
                              width: _selected == 0 ? 4 : 0,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Student Data",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selected = 1;
                        });
                        log("Image clicked...");
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 80,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: <Color>[
                              Color(0xff003C43),
                              Color(0xffE3FEF7)
                            ],
                          ),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.amber,
                              width: _selected == 1 ? 4 : 0,
                            ),
                          ),
                        ),
                        child: const Text(
                          "Image",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              //MainBody
              Expanded(
                child: IndexedStack(
                  index: _selected,
                  children: [
                    //ContactPage
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.always,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  // textAlign: TextAlign.center,
                                  // controller: nameController,
                                  initialValue: StudentDataPgval.GRID,
                                  textInputAction: TextInputAction.done,
                                  // onChanged: (val) {
                                  //   ContactPageVal.name = val;
                                  // },
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return "Enter your Name...";
                                    } else {
                                      return null;
                                    }
                                  },
                                  onSaved: (val) {
                                    StudentDataPgval.GRID = val ?? "";
                                  },
                                  onFieldSubmitted: (val) {
                                    log("==============");
                                    log(val);
                                    iconColor = Colors.blueAccent;
                                    setState(() {});
                                    log("==============");
                                  },
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.person),
                                    suffixIcon: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: Icon(
                                        Icons.contact_mail,
                                        color: iconColor,
                                      ),
                                    ),
                                    labelText: "Name",
                                    hintText: "Enter your Name",
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Colors.green,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.phone,
                                  initialValue: StudentDataPgval.GRID,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  validator: (val) {
                                    return (val!.isEmpty)
                                        ? "Enter your GRID..."
                                        : (val.length == 10)
                                            ? null
                                            : "GRID is not required";
                                  },
                                  onSaved: (val) {
                                    StudentDataPgval.GRID = val ?? "";
                                  },
                                  textInputAction: TextInputAction.next,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    prefixIcon: const Icon(Icons.dialpad),
                                    labelText: "GRID ",
                                    hintText: "Enter your GRID",
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Colors.green,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  // controller: passwordController,
                                  initialValue: StudentDataPgval.Standard,
                                  textInputAction: TextInputAction.next,
                                  obscureText: _hide,
                                  // obscuringCharacter: '_',
                                  // onChanged: (val) {
                                  //   ContactPageVal.password = val;
                                  // },
                                  onSaved: (val) {
                                    StudentDataPgval.Standard = val ?? "";
                                  },
                                  validator: (val) => (val!.isEmpty)
                                      ? "Enter your Stndard"
                                      : null,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          _hide = !_hide;
                                        });
                                      },
                                      icon: Icon(_hide
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                    prefixIcon: const Icon(Icons.password),
                                    labelText: "Standard",
                                    hintText: "Enter your standard",
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey.shade400,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: const BorderSide(
                                        color: Colors.green,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          formKey.currentState!.save();

                                          log(StudentDataPgval.GRID ?? "");
                                          log(StudentDataPgval.GRID);
                                          log(StudentDataPgval.Standard);

                                          SnackBar snackBar = SnackBar(
                                            backgroundColor: Colors.green,

                                            margin: const EdgeInsets.all(15),
                                            // width: 200,
                                            behavior: SnackBarBehavior.floating,
                                            duration:
                                                const Duration(seconds: 5),
                                            // padding: const EdgeInsets.all(30),
                                            elevation: 20,
                                            actionOverflowThreshold: 1,
                                            showCloseIcon: true,
                                            closeIconColor: Colors.white,
                                            action: SnackBarAction(
                                              label: "Back",
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                            dismissDirection:
                                                DismissDirection.horizontal,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            content: const Text(
                                                "Student Data insert Successfully 👍"),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);

                                          setState(() {});
                                        }
                                      },
                                      child: const Text("Save"),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          formKey.currentState!.reset();
                                          nameController.clear();
                                        });
                                      },
                                      child: const Text("RESET"),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    //ImagePage
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        height: 250,
                        color: Colors.white,
                        alignment: Alignment.center,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              foregroundImage: (StudentDataPgval.image != null)
                                  ? FileImage(StudentDataPgval.image!)
                                  : null,
                              child: const Text(
                                "ADD",
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                        title: Text(
                                          "Image",
                                        ),
                                        content: Row(
                                          children: [
                                            ElevatedButton.icon(
                                              onPressed: () async {
                                                await imagePickWithCamera();
                                                Navigator.of(context).pop();
                                              },
                                              icon:
                                                  const Icon(Icons.camera_alt),
                                              label: const Text("Camera"),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton.icon(
                                              onPressed: () async {
                                                await imagePickWithGallery();
                                                Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.photo),
                                              label: const Text("Gallery"),
                                            ),
                                          ],
                                        ));
                                  },
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: Colors.blueAccent,
                                child: Icon(
                                  Icons.camera,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
