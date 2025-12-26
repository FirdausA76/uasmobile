import 'package:flutter/material.dart';

class KuisScreen extends StatefulWidget {
  final String title;
  const KuisScreen({super.key, required this.title});

  @override
  State<KuisScreen> createState() => _KuisScreenState();
}

class _KuisScreenState extends State<KuisScreen> {
  int _currentQuestionIndex = 0;
  int? _selectedOption;

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'Apa tujuan utama dari proses Wireframing dalam UI/UX Design?',
      'options': [
        'Menentukan skema warna aplikasi',
        'Mengatur tata letak dasar dan struktur fungsional',
        'Membuat prototipe yang bisa diklik',
        'Menulis kode frontend'
      ],
      'answer': 1
    },
    {
      'question': 'Elemen mana yang paling penting dalam User Persona?',
      'options': [
        'Hobi dan kesukaan',
        'Nama dan usia saja',
        'Tujuan, kebutuhan, dan kendala pengguna',
        'Warna favorit'
      ],
      'answer': 2
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(
        title: Text(widget.title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LinearProgressIndicator(
                      value: (_currentQuestionIndex + 1) / _questions.length,
                      backgroundColor: Colors.grey[300],
                      valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2E7D32)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Pertanyaan ${_currentQuestionIndex + 1} dari ${_questions.length}',
                      style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _questions[_currentQuestionIndex]['question'],
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    ...List.generate(
                      _questions[_currentQuestionIndex]['options'].length,
                      (index) => _buildOption(index),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int index) {
    bool isSelected = _selectedOption == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = index;
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF2E7D32).withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? const Color(0xFF2E7D32) : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? const Color(0xFF2E7D32) : Colors.grey[100],
              ),
              child: Center(
                child: Text(
                  String.fromCharCode(65 + index),
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                _questions[_currentQuestionIndex]['options'][index],
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: _selectedOption == null
            ? null
            : () {
                if (_currentQuestionIndex < _questions.length - 1) {
                  setState(() {
                    _currentQuestionIndex++;
                    _selectedOption = null;
                  });
                } else {
                  _showResultDialog();
                }
              },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2E7D32),
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        child: Text(
          _currentQuestionIndex < _questions.length - 1 ? 'Pertanyaan Selanjutnya' : 'Selesai Kuis',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }

  void _showResultDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.stars_rounded, color: Colors.orange, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Kuis Selesai!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Skor Anda: 100/100', style: TextStyle(fontSize: 18, color: Color(0xFF2E7D32), fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
                Navigator.pop(context); // Back to detail
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Kembali ke Materi'),
            ),
          ],
        ),
      ),
    );
  }
}
