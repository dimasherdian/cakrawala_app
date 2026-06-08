import 'package:flutter/material.dart';

// Model Mahasiswa
class Student {
  final String name;
  final String nim;
  final String gender;
  final String faculty;
  final String major;
  final String imageUrl;

  Student({
    required this.name,
    required this.nim,
    required this.gender,
    required this.faculty,
    required this.major,
    required this.imageUrl,
  });
}

class StudentListPage extends StatelessWidget {
  StudentListPage({super.key});

  // Data Dummy Mahasiswa
  final List<Student> students = [
    Student(
      name: 'Budi Santoso',
      nim: '2021001001',
      gender: 'Laki-laki',
      faculty: 'Teknik',
      major: 'Informatika',
      imageUrl: 'https://i.pravatar.cc/150?img=11',
    ),
    Student(
      name: 'Siti Aminah',
      nim: '2021001002',
      gender: 'Perempuan',
      faculty: 'Ekonomi',
      major: 'Akuntansi',
      imageUrl: 'https://i.pravatar.cc/150?img=5',
    ),
    Student(
      name: 'Andi Wijaya',
      nim: '2021001003',
      gender: 'Laki-laki',
      faculty: 'Teknik',
      major: 'Sipil',
      imageUrl: 'https://i.pravatar.cc/150?img=12',
    ),
    Student(
      name: 'Dewi Lestari',
      nim: '2021001004',
      gender: 'Perempuan',
      faculty: 'Hukum',
      major: 'Ilmu Hukum',
      imageUrl: 'https://i.pravatar.cc/150?img=10',
    ),
    Student(
      name: 'Eko Prasetyo',
      nim: '2021001005',
      gender: 'Laki-laki',
      faculty: 'MIPA',
      major: 'Matematika',
      imageUrl: 'https://i.pravatar.cc/150?img=13',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(student.imageUrl),
                radius: 25,
              ),
              title: Text(
                student.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NIM: ${student.nim}'),
                  Text('${student.faculty} - ${student.major}'),
                ],
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              
              // NAVIGASI KE DETAIL MAHASISWA
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/student-detail',
                  arguments: student, // Mengirim objek student sebagai argumen
                );
              },
            ),
          );
        },
      ),
    );
  }
}
