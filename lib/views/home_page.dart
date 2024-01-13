import 'package:employee_database_app/controllers/employeeController.dart';
import 'package:employee_database_app/models/employee_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  employeeController _controller = Get.put(employeeController());
  List<dynamic> dataList = [];
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var data = await _controller.getData();
      setState(() {
        dataList = data.data;
      });
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  void refreshData() {
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Homepage"),
          backgroundColor: Colors.blueGrey,
          leading: Icon(Icons.home),
          actions: [
            IconButton(
              onPressed: refreshData,
              icon: Icon(Icons.refresh),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DefaultTabController(
                  length: dataList!.length,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        isScrollable: true,
                        tabs: dataList.map((item) {
                          return Tab(
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Container(
                                color: Colors.blueGrey.shade200,
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${item.firstName} ${item.lastName}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Employee Details:",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: dataList.map((item) {
                            return Card(
                              elevation: 3,
                              margin: EdgeInsets.all(8),
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.blueGrey.shade700,
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  scrollable: true,
                                                  title: Text('Fill Details'),
                                                  content: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      children: [
                                                        TextFormField(
                                                          controller:
                                                              firstNameController,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText:
                                                                'First Name',
                                                            focusedBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black)),
                                                            icon: Icon(
                                                              Icons
                                                                  .account_box_outlined,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            labelStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .blueGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            focusColor: Colors
                                                                .grey.shade100,
                                                            hintText:
                                                                'Enter your first name...',
                                                            hintStyle:
                                                                TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              lastNameController,
                                                          decoration:
                                                              InputDecoration(
                                                            focusColor:
                                                                Colors.black,
                                                            focusedBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black)),
                                                            labelText:
                                                                'Last Name',
                                                            icon: Icon(
                                                              Icons.account_box,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            labelStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .blueGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            hintText:
                                                                'Enter your Last name...',
                                                            hintStyle:
                                                                TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextFormField(
                                                          controller:
                                                              emailController,
                                                          decoration:
                                                              InputDecoration(
                                                            labelText: 'Email',
                                                            focusedBorder: UnderlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .black)),
                                                            icon: Icon(
                                                              Icons
                                                                  .email_outlined,
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                            labelStyle:
                                                                TextStyle(
                                                              color: Colors
                                                                  .blueGrey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                            hintText:
                                                                'Enter your email...',
                                                            hintStyle:
                                                                TextStyle(
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.blueGrey,
                                                      ),
                                                      child: Text(
                                                        "Save",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          item.firstName =
                                                              firstNameController
                                                                  .text;

                                                          item.lastName =
                                                              lastNameController
                                                                  .text;
                                                          item.email =
                                                              emailController
                                                                  .text;

                                                          firstNameController
                                                              .clear();
                                                          lastNameController
                                                              .clear();
                                                          emailController
                                                              .clear();
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.blueGrey,
                                                      ),
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Text("Edit"),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.edit,
                                                size: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.red.shade400,
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text(
                                                    "Are you sure you want to delete?",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  actions: [
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.blueGrey,
                                                      ),
                                                      child: Text(
                                                        "Yes",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        // clearData();
                                                        setState(() {
                                                          dataList.remove(item);
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      style:
                                                          TextButton.styleFrom(
                                                        backgroundColor:
                                                            Colors.blueGrey,
                                                      ),
                                                      child: Text(
                                                        "No",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                          child: Row(
                                            children: [
                                              Text("Delete"),
                                              SizedBox(width: 5),
                                              Icon(
                                                Icons.delete,
                                                size: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage: NetworkImage(
                                        item.avatar.toString(),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "First Name: ${item.firstName}",
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Last Name: ${item.lastName}",
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      "Email: ${item.email}",
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
