import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool soundEnabled = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F3),
      
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// HEADER
              Row(
                children: [

                  const Icon(
                    Icons.menu,
                    size: 30,
                  ),

                  const SizedBox(width: 18),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      const Row(
                        children: [

                          Text(
                            'Pengaturan',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(width: 6),

                          Text(
                            '☕',
                            style: TextStyle(
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),

                      Text(
                        'Atur perangkat dan preferensi',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// PERANGKAT
              const Text(
                'Perangkat',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              _deviceCard(),

              const SizedBox(height: 35),

              /// PREFERENSI
              const Text(
                'Preferensi Roasting',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Column(
                  children: [

                    _settingsTile(
                      icon: Icons.thermostat,
                      title: 'Satuan Suhu',
                      value: '°C',
                    ),

                    _divider(),

                    _settingsTile(
                      icon: Icons.language,
                      title: 'Bahasa',
                      value: 'Bahasa Indonesia',
                    ),

                    _divider(),

                    _settingsTile(
                      icon: Icons.notifications_none,
                      title: 'Level Notifikasi',
                      value: 'Semua',
                    ),

                    _divider(),

                    SwitchListTile(
                      secondary: const Icon(
                        Icons.volume_up_outlined,
                        color: Colors.grey,
                      ),

                      title: const Text(
                        'Mode Suara',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),

                      value: soundEnabled,

                      activeColor: Colors.orange,

                      onChanged: (value) {
                        setState(() {
                          soundEnabled = value;
                        });
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              /// KALIBRASI
              const Text(
                'Kalibrasi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Column(
                  children: [

                    _settingsTile(
                      icon: Icons.device_thermostat,
                      title: 'Kalibrasi Suhu',
                      subtitle: 'Sesuaikan pembacaan suhu perangkat',
                    ),

                    _divider(),

                    _settingsTile(
                      icon: Icons.delete_outline,
                      title: 'Reset Data',
                      subtitle: 'Hapus semua data roasting',
                      iconColor: Colors.red,
                      textColor: Colors.red,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              /// INFORMASI
              const Text(
                'Informasi Aplikasi',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),

                child: Column(
                  children: [

                    _settingsTile(
                      icon: Icons.info_outline,
                      title: 'Versi Aplikasi',
                      value: '1.0.0',
                    ),

                    _divider(),

                    _settingsTile(
                      icon: Icons.info_outline,
                      title: 'Tentang Aplikasi',
                      value: 'IoT Coffee Roaster',
                    ),

                    _divider(),

                    _settingsTile(
                      icon: Icons.help_outline,
                      title: 'Bantuan & Dukungan',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _deviceCard() {

    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        children: [

          Container(
            width: 65,
            height: 65,

            decoration: BoxDecoration(
              color: const Color(0xFF4E2A16),
              borderRadius: BorderRadius.circular(18),
            ),

            child: const Icon(
              Icons.coffee_maker,
              color: Colors.white,
              size: 34,
            ),
          ),

          const SizedBox(width: 18),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const Text(
                  'IoT Coffee Roaster',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [

                    Container(
                      width: 10,
                      height: 10,

                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),

                    const SizedBox(width: 8),

                    const Text(
                      'Terhubung',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  'ID: ROASTER-001',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          Icon(
            Icons.chevron_right,
            color: Colors.grey.shade500,
          ),
        ],
      ),
    );
  }

  Widget _settingsTile({
    required IconData icon,
    required String title,
    String? subtitle,
    String? value,
    Color iconColor = Colors.grey,
    Color textColor = Colors.black,
  }) {

    return ListTile(

      leading: Icon(
        icon,
        color: iconColor,
      ),

      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 17,
          fontWeight: FontWeight.w500,
        ),
      ),

      subtitle: subtitle != null
          ? Text(
        subtitle,
        style: TextStyle(
          color: Colors.grey.shade600,
        ),
      )
          : null,

      trailing: Row(
        mainAxisSize: MainAxisSize.min,

        children: [

          if (value != null)
            Text(
              value,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 15,
              ),
            ),

          const SizedBox(width: 8),

          Icon(
            Icons.chevron_right,
            color: Colors.grey.shade500,
          ),
        ],
      ),
    );
  }

  Widget _divider() {

    return Divider(
      height: 1,
      color: Colors.grey.shade200,
      indent: 20,
      endIndent: 20,
    );
  }
}