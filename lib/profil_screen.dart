import 'package:flutter/material.dart';
import 'edit_profil_screen.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F8),
      appBar: AppBar(
        title: const Text(
          'Profil',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF2E7D32),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 20),
            _buildIdentitySection(),
            _buildLoginActivities(),
            _buildAccountSettings(context),
            _buildLogoutButton(context),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30),
      decoration: const BoxDecoration(
        color: Color(0xFF2E7D32),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 4),
                  image: const DecorationImage(
                    image: NetworkImage('https://ui-avatars.com/api/?name=Firdaus+Antigravity&background=random'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const EditProfilScreen()),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit_rounded, size: 20, color: Color(0xFF2E7D32)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text(
            'Firdaus Antigravity',
            style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            'firdaus.anti@email.com',
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildIdentitySection() {
    return _buildSectionLayout(
      title: 'Identitas Diri',
      children: [
        _buildProfileItem(Icons.person_outline_rounded, 'Nama Lengkap', 'Firdaus Antigravity'),
        _buildProfileItem(Icons.phone_iphone_rounded, 'Nomor HP', '+62 812 3456 7890'),
        _buildProfileItem(Icons.location_on_outlined, 'Alamat', 'Semarang, Indonesia'),
      ],
    );
  }

  Widget _buildLoginActivities() {
    return _buildSectionLayout(
      title: 'Aktivitas Login',
      children: [
        _buildProfileItem(Icons.devices_rounded, 'Windows PC - Chrome', 'Aktif Saat Ini', isSubTitleGreen: true),
        _buildProfileItem(Icons.smartphone_rounded, 'Android - Samsung S21', '2 jam yang lalu'),
      ],
    );
  }

  Widget _buildAccountSettings(BuildContext context) {
    return _buildSectionLayout(
      title: 'Pengaturan Akun',
      children: [
        _buildProfileItem(
          Icons.edit_note_rounded, 
          'Edit Profil', 
          'Ubah data diri Anda', 
          isClickable: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const EditProfilScreen()),
            );
          },
        ),
        _buildProfileItem(Icons.lock_outline_rounded, 'Ubah Password', 'Ganti kata sandi secara berkala', isClickable: true),
        _buildProfileItem(Icons.notifications_outlined, 'Notifikasi', 'Atur preferensi pemberitahuan', isClickable: true),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: () {
             _showLogoutDialog(context);
          },
          icon: const Icon(Icons.logout_rounded, color: Colors.red),
          label: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.red),
            padding: const EdgeInsets.symmetric(vertical: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionLayout({required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blueGrey),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.03),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(children: children),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildProfileItem(
    IconData icon, 
    String title, 
    String subtitle, {
    bool isSubTitleGreen = false, 
    bool isClickable = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF2E7D32).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: const Color(0xFF2E7D32), size: 22),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: isSubTitleGreen ? Colors.green : Colors.grey,
          fontSize: 12,
          fontWeight: isSubTitleGreen ? FontWeight.bold : FontWeight.normal
        )
      ),
      trailing: isClickable ? const Icon(Icons.arrow_forward_ios_rounded, size: 16, color: Colors.grey) : null,
      onTap: onTap,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Apakah Anda yakin ingin keluar dari aplikasi?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Batal')),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ya, Keluar', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
