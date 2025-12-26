import 'package:flutter/material.dart';

class KelasSayaScreen extends StatelessWidget {
  const KelasSayaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7F8),
        appBar: AppBar(
          title: const Text(
            'Kelas Saya',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFF2E7D32),
          centerTitle: true,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Berlangsung'),
              Tab(text: 'Selesai'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOngoingClasses(),
            _buildCompletedClasses(),
          ],
        ),
      ),
    );
  }

  Widget _buildOngoingClasses() {
    final ongoingCourses = [
      {
        'title': 'UI/UX Design Masterclass',
        'progress': 0.65,
        'modules': '12/18 Modul',
        'image': Icons.brush_rounded,
        'color': Colors.blue[100],
      },
      {
        'title': 'Advanced Flutter Development',
        'progress': 0.30,
        'modules': '5/20 Modul',
        'image': Icons.code_rounded,
        'color': Colors.orange[100],
      },
      {
        'title': 'Digital Marketing Basics',
        'progress': 0.85,
        'modules': '15/17 Modul',
        'image': Icons.trending_up_rounded,
        'color': Colors.purple[100],
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: ongoingCourses.length,
      itemBuilder: (context, index) {
        final course = ongoingCourses[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: course['color'] as Color,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(course['image'] as IconData, color: const Color(0xFF2E7D32)),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course['title'] as String,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          course['modules'] as String,
                          style: TextStyle(color: Colors.grey[600], fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: course['progress'] as double,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2E7D32)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    '${((course['progress'] as double) * 100).toInt()}%',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2E7D32),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 0,
                  ),
                  child: const Text('Lanjutkan Belajar'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCompletedClasses() {
    final completedCourses = [
      {
        'title': 'Web Development Bootcamp',
        'date': 'Selesai pada 12 Des 2025',
        'image': Icons.web_rounded,
        'color': Colors.green[100],
      },
      {
        'title': 'Graphic Design for Beginners',
        'date': 'Selesai pada 05 Nov 2025',
        'image': Icons.palette_rounded,
        'color': Colors.pink[100],
      },
    ];

    if (completedCourses.isEmpty) {
      return const Center(
        child: Text('Belum ada kelas yang diselesaikan'),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: completedCourses.length,
      itemBuilder: (context, index) {
        final course = completedCourses[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: course['color'] as Color,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(course['image'] as IconData, color: const Color(0xFF2E7D32)),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course['title'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      course['date'] as String,
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.verified_rounded, color: Colors.blue),
            ],
          ),
        );
      },
    );
  }
}
