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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          "Student Page",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: size.height * 0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: <Color>[
                    Color(0xffF6F5F2),
                    Color(0xffE5E1DA),
                    Color(0xFF45474B),
                  ],
                ),
                borderRadius: BorderRadius.circular(30),
                color: Color(0xff874CCC),
              ),
              padding: const EdgeInsets.all(10),
              child: const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/564x/00/4e/a0/004ea0fedec87425e8d33757f7f5b3a0.jpg"),
                      ),
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
                  height: size.height * 0.2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: <Color>[
                        Color(0xffF6F5F2),
                        Color(0xffE5E1DA),
                        Color(0xFF45474B),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xff874CCC),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                "https://i.pinimg.com/564x/e9/57/00/e95700d9ef5a22ce023354485e5a959a.jpg"),
                          ),
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
                      height: size.height * 0.2,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.topLeft,
                          colors: <Color>[
                            Color(0xffF6F5F2),
                            Color(0xffE5E1DA),
                            Color(0xFF45474B),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    "https://i.pinimg.com/564x/23/e8/ab/23e8abfe3d1ea1570eab8d4a764f4ea7.jpg"),
                              ),
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
    );
  }
}
