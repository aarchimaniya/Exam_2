import 'package:flutter/material.dart';
import 'package:student_detials_app/app_route/app_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      decoration:
          BoxDecoration(image: DecorationImage(image: NetworkImage(""))),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Student Page"),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                height: size.height * 0.1,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: <Color>[Color(0xff003C43), Color(0xffE3FEF7)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff874CCC),
                ),
                padding: const EdgeInsets.all(10),
                child: const Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(radius: 20),
                      ),
                      Text(
                        "Student GRId",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    height: size.height * 0.1,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: <Color>[Color(0xff003C43), Color(0xffE3FEF7)],
                      ),
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xff874CCC),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircleAvatar(radius: 20),
                          ),
                          Text(
                            "Student Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: <Color>[
                              Color(0xff003C43),
                              Color(0xffE3FEF7)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xff874CCC),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Align(
                          alignment: AlignmentDirectional.topCenter,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: CircleAvatar(radius: 20),
                              ),
                              Text(
                                "Student Std",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.detailspage);
                },
                child: const Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
