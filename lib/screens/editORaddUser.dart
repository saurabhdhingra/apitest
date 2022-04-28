import 'package:apitest/apiService.dart';
import 'package:apitest/screens/usersList.dart';
import 'package:flutter/material.dart';
import '../models/user_model.dart';

class UserDetails extends StatefulWidget {
  final String mode;
  final int id;
  const UserDetails({Key? key, required this.mode, required this.id})
      : super(key: key);

  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();
  String email = "";
  String name = "";
  String gender = "";
  String status = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.green[200],
          shape: const StadiumBorder(),
          label: Text(widget.mode == 'add' ? 'Create User' : 'Update User'),
          onPressed: () {
            NetworkHelper networkHelper = NetworkHelper();
            widget.mode == 'add'
                ? networkHelper.createUser(name, email, gender, status).then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsersList(),
                        ),
                      ),
                    )
                : networkHelper
                    .updateUser(widget.id, name, email, gender, status)
                    .then(
                      (value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UsersList(),
                        ),
                      ),
                    );
          }),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        automaticallyImplyLeading: true,
        title: const Text(
          'User Details',
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Text(
                'Name',
                style: TextStyle(),
              ),
              Form(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  controller: textController1,
                  obscureText: false,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x40000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x40000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: const TextStyle(),
                ),
              ),
              const Text(
                'Email',
                style: TextStyle(),
              ),
              Form(
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the email';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  controller: textController2,
                  obscureText: false,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x40000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x40000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: const TextStyle(),
                ),
              ),
              const Text(
                'Gender',
                style: TextStyle(),
              ),
              Form(
                child: TextFormField(
                  controller: textController3,
                  obscureText: false,
                  validator: (value) {
                    if (value != 'male' || value != 'female') {
                      return 'Please enter the gender';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x40000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x40000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: const TextStyle(),
                ),
              ),
              const Text(
                'Status',
                style: TextStyle(),
              ),
              Form(
                child: TextFormField(
                  validator: (value) {
                    if (value != 'active' || value != 'inactive') {
                      return 'Please enter the status either as active or incactive';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      status = value;
                    });
                  },
                  controller: textController4,
                  obscureText: false,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x40000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0x40000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                    ),
                  ),
                  style: const TextStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
