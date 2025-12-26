import 'package:flutter/material.dart';
import 'kuis_screen.dart';
import 'tugas_screen.dart';

class DetailKelasScreen extends StatelessWidget {
  final String title;

  const DetailKelasScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7F8),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 200.0,
                floating: false,
                pinned: true,
                backgroundColor: const Color(0xFF2E7D32),
                iconTheme: const IconThemeData(color: Colors.white),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Color(0xFF2E7D32), Color(0xFF1B5E20)],
                          ),
                        ),
                      ),
                      const Center(
                        child: Icon(
                          Icons.menu_book_rounded,
                          size: 80,
                          color: Colors.white24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: _SliverAppBarDelegate(
                  const TabBar(
                    labelColor: Color(0xFF2E7D32),
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Color(0xFF2E7D32),
                    indicatorWeight: 3,
                    tabs: [
                      Tab(text: "Materi"),
                      Tab(text: "Tugas"),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              _buildMateriList(),
              _buildTugasList(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMateriList() {
    final materi = [
      {'title': 'Pengenalan UI/UX Design', 'duration': '15 Menit', 'isCompleted': true},
      {'title': 'Prinsip Dasar Visual Design', 'duration': '25 Menit', 'isCompleted': true},
      {'title': 'Memahami User Persona', 'duration': '20 Menit', 'isCompleted': false},
      {'title': 'Wireframing & Prototyping', 'duration': '40 Menit', 'isCompleted': false},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: materi.length,
      itemBuilder: (context, index) {
        final item = materi[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
              ),
            ],
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: (item['isCompleted'] as bool) 
                  ? const Color(0xFF2E7D32).withOpacity(0.1) 
                  : Colors.grey[100],
              child: Icon(
                (item['isCompleted'] as bool) ? Icons.check_circle_rounded : Icons.play_arrow_rounded,
                color: (item['isCompleted'] as bool) ? const Color(0xFF2E7D32) : Colors.grey,
              ),
            ),
            title: Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(item['duration'] as String),
            trailing: const Icon(Icons.download_rounded, size: 20, color: Colors.grey),
            onTap: () {},
          ),
        );
      },
    );
  }

  Widget _buildTugasList(BuildContext context) {
    final tugas = [
      {'title': 'Kuis 1: Dasar Desain', 'status': 'Selesai', 'deadline': 'Terkirim', 'type': 'kuis'},
      {'title': 'Tugas Mandiri: Membuat Persona', 'status': 'Belum Selesai', 'deadline': '30 Des 2025', 'type': 'tugas'},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: tugas.length,
      itemBuilder: (context, index) {
        final item = tugas[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
              ),
            ],
          ),
          child: ListTile(
            onTap: () {
              if (item['type'] == 'kuis') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => KuisScreen(title: item['title'] as String)),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TugasScreen(title: item['title'] as String)),
                );
              }
            },
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.orange.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.assignment_rounded, color: Colors.orange),
            ),
            title: Text(item['title'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('Batas: ${item['deadline']}'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: (item['status'] == 'Selesai') ? Colors.green[50] : Colors.red[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                item['status'] as String,
                style: TextStyle(
                  color: (item['status'] == 'Selesai') ? Colors.green : Colors.red,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
