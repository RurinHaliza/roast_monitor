import 'package:flutter/material.dart';

void main() {
  runApp(const MonitorPage());
}

class MonitorPage extends StatelessWidget {
  const MonitorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F3F1),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildMonitorCard(),
            _buildRoastingStages(),
            _buildLogs(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Container(
          height: 320,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF2D1307),
                Color(0xFF4E2A16),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),

        Positioned(
            right: -10,
            top: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/roaster.png',
                width: 230,
                height: 270,
                fit: BoxFit.cover,
              ),
            ),
          ),

        Padding(
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.menu, color: Colors.white, size: 30),

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.green,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Terhubung',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                'Roast Monitor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Text(
                'IoT Coffee Roaster',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                'Profile Aktif',
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                '☕ Medium Roast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const SizedBox(
                width: 220,
                child: Text(
                  'Profil seimbang untuk cita rasa yang kaya dan seimbang.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMonitorCard() {
    return Transform.translate(
      offset: const Offset(0, -30),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 15,
              ),
            ],
          ),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 6,
                        backgroundColor: Colors.orange,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'ROASTING BERJALAN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                    ],
                  ),

                  OutlinedButton(
                    onPressed: null,
                    child: Text('AKHIRI ROAST'),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Suhu Saat Ini',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '182.4°C',
                  style: TextStyle(
                    fontSize: 52,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Target: 200°C',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoBox('Waktu Berjalan', '06:24'),
                  _infoBox('Total Durasi', '12:00'),
                  _infoBox('Tahap Saat Ini', 'Maillard'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoBox(String title, String value) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoastingStages() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tahapan Roasting',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StageItem('Drying', Icons.check_circle, Colors.green),
                _StageItem('Maillard', Icons.check_circle, Colors.green),
                _StageItem('Development', Icons.local_fire_department, Colors.orange),
                _StageItem('Cooling', Icons.ac_unit, Colors.grey),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogs() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Log Roasting',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _logItem(
              Icons.coffee,
              'Roasting dimulai',
              'Suhu awal: 120°C',
            ),

            _logItem(
              Icons.waves,
              'Maillard dimulai',
              'Suhu: 150°C',
            ),

            _logItem(
              Icons.local_fire_department,
              'First Crack terdeteksi',
              'Suhu: 196°C',
            ),
          ],
        ),
      ),
    );
  }

  Widget _logItem(
      IconData icon,
      String title,
      String subtitle,
      ) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Colors.orange.withOpacity(0.15),
        child: Icon(icon, color: Colors.orange),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
    );
  }
}

class _StageItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const _StageItem(
      this.title,
      this.icon,
      this.color,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: color.withOpacity(0.15),
          child: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),

        const SizedBox(height: 10),

        Text(title),
      ],
    );
  }
}