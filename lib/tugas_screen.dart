import 'package:flutter/material.dart';

class TugasScreen extends StatelessWidget {
  final String title;
  const TugasScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(
        title: const Text('Detail Tugas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.access_time_filled_rounded, color: Colors.orange, size: 18),
                      const SizedBox(width: 5),
                      Text('Tenggat: 30 Des 2025, 23:59', style: TextStyle(color: Colors.grey[700], fontSize: 13)),
                    ],
                  ),
                  const Divider(height: 30),
                  const Text(
                    'Instruksi Tugas:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '1. Buatlah User Persona berdasarkan hasil interview yang telah dilakukan.\n'
                    '2. Persona harus mencakup biodata, tujuan, pain points, dan perilaku.\n'
                    '3. Format file harus berupa PDF.\n'
                    '4. Ukuran file maksimal 5MB.',
                    style: TextStyle(color: Colors.grey[800], height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Pengiriman Anda',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            _buildUploadSection(context),
            const SizedBox(height: 30),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          Icon(Icons.cloud_upload_rounded, size: 50, color: Colors.grey[400]),
          const SizedBox(height: 10),
          const Text(
            'Klik untuk unggah file PDF',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
          ),
          const Text(
            'atau seret file ke sini',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tugas berhasil dikirim!'),
              backgroundColor: Color(0xFF2E7D32),
            ),
          );
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: const Text('Kirim Jawaban', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ),
    );
  }
}
