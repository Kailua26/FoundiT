import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class FoundItemPage extends StatefulWidget {
  const FoundItemPage({super.key});

  @override
  _FoundItemPageState createState() => _FoundItemPageState();
}

class _FoundItemPageState extends State<FoundItemPage> {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  XFile? _image;

  final InputDecoration inputDecoration = InputDecoration(
    hintStyle: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Color(0xFFADAEBC),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE6E6E6)),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  final TextStyle labelStyle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Color(0xFF1A535C),
  );

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: Color(0xFFACF7C1),
    foregroundColor: Color(0xFF1A535C),
    padding: EdgeInsets.symmetric(vertical: 15),
    minimumSize: Size(double.infinity, 50),
  );

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void _submitForm() {
    if (itemNameController.text.isEmpty ||
        locationController.text.isEmpty ||
        timeController.text.isEmpty ||
        _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all required fields and add a photo."),
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Item posted successfully!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "What Did You Find?",
          style: TextStyle(
            fontFamily: 'Poppins',
            color: Color(0xFF1A535C),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Item Name*", style: labelStyle),
              TextField(
                controller: itemNameController,
                decoration: inputDecoration.copyWith(
                  hintText: "What item did you find?",
                ),
              ),
              SizedBox(height: 15),
              Text("Where did you find it?*", style: labelStyle),
              TextField(
                controller: locationController,
                decoration: inputDecoration.copyWith(
                  hintText: "Exact location found",
                ),
              ),
              SizedBox(height: 15),
              Text("When did you find it?*", style: labelStyle),
              TextField(
                controller: timeController,
                decoration: inputDecoration.copyWith(hintText: "Time"),
              ),
              SizedBox(height: 15),
              Text("Add Photo*", style: labelStyle),
              ElevatedButton.icon(
                onPressed: _pickImage,
                icon: Icon(Icons.camera_alt, color: Color(0xFF1A535C)),
                label: Text(
                  "Add Photo (Required)",
                  style: TextStyle(color: Color(0xFF1A535C)),
                ),
                style: buttonStyle,
              ),
              if (_image == null)
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "⚠ You MUST upload a photo!",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              SizedBox(height: 15),
              Text("Description (Optional)", style: labelStyle),
              TextField(
                controller: descriptionController,
                decoration: inputDecoration.copyWith(
                  hintText: "Where are you keeping the item safe?",
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _submitForm,
                icon: Icon(Icons.send, color: Color(0xFF1A535C)),
                label: Text(
                  "Post Found Item!",
                  style: TextStyle(color: Color(0xFF1A535C)),
                ),
                style: buttonStyle,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Home.png', width: 24, height: 24),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/Post.png', width: 24, height: 24),
              label: "My Posts",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/Message.png',
                width: 24,
                height: 24,
              ),
              label: "Messages",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/Profile.png',
                width: 24,
                height: 24,
              ),
              label: "Profile",
            ),
          ],
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }
}
