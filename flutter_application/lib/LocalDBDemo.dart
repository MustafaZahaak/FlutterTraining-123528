import 'package:flutter/material.dart';
import 'package:flutter_application/dbmanager.dart';

class LocalDbDemo extends StatefulWidget {
  const LocalDbDemo({Key key}) : super(key: key);

  @override
  State<LocalDbDemo> createState() => _LocalDbDemoState();
}

class _LocalDbDemoState extends State<LocalDbDemo> {
  final _formKey = GlobalKey<FormState>();
  var _nameController = TextEditingController();
  var _courseController = TextEditingController();
  List<Student> studlist;

  DbStudentManager dbmanger = new DbStudentManager();
  Student student;
  int updateIndex;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Local DB'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                          labelText: "Name", hintText: "Enter Name"),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Name field is Required";
                        } else {
                          return null;
                        }
                      },
                    ),
                    TextFormField(
                      controller: _courseController,
                      decoration: InputDecoration(
                          labelText: "Course", hintText: "Enter Course Name"),
                      validator: (val) =>
                          val.isNotEmpty ? null : "Course Field is Required",
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _submitStudent(context);
                        },
                        child: Text("Submit")),
                    FutureBuilder(
                        future: dbmanger.getStudentList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            studlist = snapshot.data;
                            return ListView.builder(
                                shrinkWrap: true,
                                itemCount:
                                    studlist == null ? 0 : studlist.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Student st = studlist[index];
                                  return Card(
                                    child: Row(
                                      children: [
                                        Image(
                                          image: AssetImage('images/avtar.jpg'),
                                          width: 50,
                                          height: 50,
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        Container(
                                          width: width * .4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Name:${st.name}',
                                                style: TextStyle(fontSize: 15),
                                              ),
                                              Text(
                                                'Course:${st.course}',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              _nameController.text = st.name;
                                              _courseController.text =
                                                  st.course;
                                              student = st;
                                              updateIndex = index;
                                            },
                                            icon: Icon(
                                              Icons.edit,
                                              color: Colors.blue,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              dbmanger.deleteStudent(st.id);

                                              setState(() {
                                                studlist.removeAt(index);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ))
                                      ],
                                    ),
                                  );
                                });
                          } else {
                            return new CircularProgressIndicator();
                          }
                        })
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void _submitStudent(BuildContext context) {
    if (_formKey.currentState.validate()) {
      if (student == null) {
        Student st = new Student(
            name: _nameController.text, course: _courseController.text);

        dbmanger.insertStudent(st).then((id) => {
              _nameController.clear(),
              _courseController.clear(),
              print("Student Added to Database id:${id}")
            });
      } else {
        student.name = _nameController.text;
        student.course = _courseController.text;

        dbmanger.updateStudent(student).then((id) {
          print("Student Updated Id: ${id}");
          setState(() {
            studlist[updateIndex].name = _nameController.text;
            studlist[updateIndex].course = _courseController.text;
          });
          _nameController.clear();
          _courseController.clear();
          student = null;
        });
      }
    }
  }
}
