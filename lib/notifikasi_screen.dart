import 'package:flutter/material.dart';

class NotifikasiScreen extends StatelessWidget {
  const NotifikasiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = [
      {
        'title': 'Tugas Baru Tersedia',
        'message': 'Tugas Modul 4 UI/UX Design telah dipublikasikan. Segera cek!',
        'time': '10 menit yang lalu',
        'icon': Icons.assignment_rounded,
        'color': Colors.blue[100],
        'isRead': false,
      },
      {
        'title': 'Nilai Keluar',
        'message': 'Nilai untuk kuis Digital Marketing Anda sudah tersedia.',
        'time': '2 jam yang lalu',
        'icon': Icons.grade_rounded,
        'color': Colors.orange[100],
        'isRead': false,
      },
      {
        'title': 'Kelas Dimulai',
        'message': 'Live session Advanced Flutter akan dimulai dalam 30 menit.',
        'time': '5 jam yang lalu',
        'icon': Icons.live_tv_rounded,
        'color': Colors.green[100],
        'isRead': true,
      },
      {
        'title': 'Pembayaran Berhasil',
        'message': 'Terima kasih! Pembayaran untuk kelas Data Science telah dikonfirmasi.',
        'time': 'Kemarin',
        'icon': Icons.account_balance_wallet_rounded,
        'color': Colors.purple[100],
        'isRead': true,
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(
        title: const Text('Notifikasi', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.done_all_rounded),
            tooltip: 'Tandai semua dibaca',
          )
        ],
      ),
      body: notifications.isEmpty
          ? _buildEmptyState()
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 15),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const Divider(height: 1, indent: 80),
              itemBuilder: (context, index) {
                final item = notifications[index];
                return Container(
                  color: (item['isRead'] as bool) ? Colors.transparent : Colors.green.withOpacity(0.05),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    leading: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: item['color'] as Color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(item['icon'] as IconData, color: const Color(0xFF2E7D32)),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item['title'] as String,
                          style: TextStyle(
                            fontWeight: (item['isRead'] as bool) ? FontWeight.normal : FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        if (!(item['isRead'] as bool))
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(
                          item['message'] as String,
                          style: TextStyle(color: Colors.grey[700], fontSize: 13),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item['time'] as String,
                          style: TextStyle(color: Colors.grey[500], fontSize: 11),
                        ),
                      ],
                    ),
                    onTap: () {},
                  ),
                );
              },
            ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_rounded, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 20),
          const Text(
            'Belum ada notifikasi',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
          ),
          const Text(
            'Kami akan memberi tahu Anda jika ada aktivitas baru.',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
