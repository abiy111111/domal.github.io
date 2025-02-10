import 'package:flutter/material.dart';

enum UserRole { admin, donatur, pengelola }

class SettingsPage extends StatelessWidget {
  final UserRole userRole;

  const SettingsPage({
    Key? key,
    required this.userRole,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            const SizedBox(height: 20),
            _buildSettingsSection(userRole),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: const Color(0xFF0EBE7F).withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(
                color: const Color(0xFF0EBE7F),
                width: 2,
              ),
            ),
            child: const Icon(
              Icons.person,
              size: 40,
              color: Color(0xFF0EBE7F),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nama Pengguna',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getRoleText(userRole),
                  style: const TextStyle(
                    color: Color(0xFF0EBE7F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection(UserRole role) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Pengaturan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Common settings for all roles
        _buildSettingItem(
          icon: Icons.person_outline,
          title: 'Edit Profil',
          subtitle: 'Ubah informasi profil Anda',
        ),
        _buildSettingItem(
          icon: Icons.notifications_outlined,
          title: 'Notifikasi',
          subtitle: 'Atur preferensi notifikasi',
        ),
        _buildSettingItem(
          icon: Icons.lock_outline,
          title: 'Keamanan',
          subtitle: 'Password dan autentikasi',
        ),

        // Role-specific settings
        if (role == UserRole.admin) ...[
          _buildDivider('Pengaturan Admin'),
          _buildSettingItem(
            icon: Icons.admin_panel_settings,
            title: 'Kelola Pengguna',
            subtitle: 'Atur pengguna dan perizinan',
          ),
          _buildSettingItem(
            icon: Icons.campaign,
            title: 'Moderasi Kampanye',
            subtitle: 'Review dan kelola kampanye',
          ),
          _buildSettingItem(
            icon: Icons.analytics,
            title: 'Laporan & Analitik',
            subtitle: 'Lihat statistik platform',
          ),
        ],

        if (role == UserRole.donatur) ...[
          _buildDivider('Pengaturan Donatur'),
          _buildSettingItem(
            icon: Icons.favorite_border,
            title: 'Riwayat Donasi',
            subtitle: 'Lihat donasi Anda',
          ),
          _buildSettingItem(
            icon: Icons.credit_card,
            title: 'Metode Pembayaran',
            subtitle: 'Kelola metode pembayaran',
          ),
          _buildSettingItem(
            icon: Icons.receipt_long,
            title: 'Laporan Donasi',
            subtitle: 'Unduh laporan donasi',
          ),
        ],

        if (role == UserRole.pengelola) ...[
          _buildDivider('Pengaturan Pengelola'),
          _buildSettingItem(
            icon: Icons.campaign,
            title: 'Kelola Kampanye',
            subtitle: 'Atur kampanye donasi',
          ),
          _buildSettingItem(
            icon: Icons.account_balance_wallet,
            title: 'Keuangan',
            subtitle: 'Kelola dana kampanye',
          ),
          _buildSettingItem(
            icon: Icons.description,
            title: 'Laporan Aktivitas',
            subtitle: 'Laporan penggunaan dana',
          ),
        ],

        const SizedBox(height: 20),
        _buildSettingItem(
          icon: Icons.help_outline,
          title: 'Bantuan',
          subtitle: 'Pusat bantuan dan FAQ',
        ),
        _buildSettingItem(
          icon: Icons.logout,
          title: 'Keluar',
          subtitle: 'Keluar dari akun',
          textColor: Colors.red,
        ),
      ],
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    Color? textColor,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF0EBE7F).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: const Color(0xFF0EBE7F),
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textColor ?? Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: textColor ?? Colors.grey[600],
          fontSize: 12,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
      onTap: () {
        // Handle setting item tap
      },
    );
  }

  Widget _buildDivider(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Divider(),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  String _getRoleText(UserRole role) {
    switch (role) {
      case UserRole.admin:
        return 'Administrator';
      case UserRole.donatur:
        return 'Donatur';
      case UserRole.pengelola:
        return 'Pengelola Kampanye';
    }
  }
}