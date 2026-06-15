import 'package:flutter/material.dart';


class BelajarSesi8 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BelajarSesi8State();
}

class _BelajarSesi8State extends State<BelajarSesi8> {
  final TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
    }
  }

  var itemsList = [
    "Male", "Female"
  ];
  String? selectedGender;
  bool isAgreed = false; // Variabel untuk checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Tidak Boleh Kosong';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: const InputDecoration(
                labelText: "Jenis Kelamin",
                border: OutlineInputBorder(), // Membuat outline border untuk dropdown
              ),
              items: itemsList.map((item){
                return DropdownMenuItem(value: item, child: Text(item));
              }).toList(),
              validator: (value) {
                if(value == null || value.isEmpty){
                  return "Jenis Kelamin Tidak Boleh Kosong";
                }
                return null;
              },
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text("Setuju dengan syarat dan ketentuan"),
              value: isAgreed,
              controlAffinity: ListTileControlAffinity.leading, // Kotak centang di kiri
              onChanged: (bool? value) {
                setState(() {
                  isAgreed = value ?? false;
                });
              },
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isAgreed ? submitForm : null,
                child: const Text("Submit"),
              ),
            ),
          ],

        ),
      ),
    );
  }
}