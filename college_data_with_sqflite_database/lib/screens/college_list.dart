import 'package:flutter/material.dart';

class CollegeList extends StatelessWidget {
    CollegeListScreenState createState() => CollegeListScreenState();
}

class CollegeListScreenState extends State<CollegeList> {
    List<College> colleges = [];

    void loadCollegeData(){
    final data = await Dbservice.instance.getAllColleges();
    setState(() {
        colleges = data;
    });
    }

    void initState() {
    super.initState();
    loadCollegeData();
    }
}

Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('College List'),
        ),
        body: ListView.builder(
            itemCount: colleges.length,
            itemBuilder: (context, index) {
                final college = colleges[index];
                return ListTile(
                    title: Text(college.name),
                    subtitle: Text(college.location),
                    trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                        IconButton(onPressed:(){},Icon(icons.visibility)),
                        IconButton(onPressed:(){},Icon(icons.settings)),
                        IconButton(onPressed:(){},Icon(icons.delete)),

                    ]),
                );
            },
        ),
    );
}

