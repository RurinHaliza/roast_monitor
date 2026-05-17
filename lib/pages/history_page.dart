import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F5F3),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: const Color(0xFF5B3521),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Monitor',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistik',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Pengaturan',
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [

                      const Icon(
                        Icons.menu,
                        size: 32,
                      ),

                      const SizedBox(width: 18),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          const Row(
                            children: [

                              Text(
                                'Riwayat',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              SizedBox(width: 8),

                              Text(
                                '☕',
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            'Riwayat Roasting',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.tune),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              /// RINGKASAN
              const Text(
                'Ringkasan',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              Row(
                children: [

                  Expanded(
                    child: _summaryCard(
                      Icons.local_fire_department,
                      Colors.orange,
                      'Total Roast',
                      '24',
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _summaryCard(
                      Icons.check_circle,
                      Colors.green,
                      'Sukses',
                      '20',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [

                  Expanded(
                    child: _summaryCard(
                      Icons.access_time,
                      Colors.brown,
                      'Rata-rata Durasi',
                      '11:45',
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: _summaryCard(
                      Icons.thermostat,
                      Colors.orange,
                      'Rata-rata Suhu Akhir',
                      '182.2°C',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              /// DAFTAR RIWAYAT
              const Text(
                'Daftar Riwayat',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 18),

              _historyCard(
                iconColor: Colors.orange,
                title: 'Medium Roast',
                date: '12 Mei 2024, 09:15',
                duration: '12:00',
                temperature: '182.4°C',
                status: 'Selesai',
                statusColor: Colors.green,
              ),

              _historyCard(
                iconColor: Colors.green,
                title: 'Light Roast',
                date: '11 Mei 2024, 16:40',
                duration: '10:30',
                temperature: '165.2°C',
                status: 'Selesai',
                statusColor: Colors.green,
              ),

              _historyCard(
                iconColor: const Color(0xFF3A1C0F),
                title: 'Dark Roast',
                date: '11 Mei 2024, 09:10',
                duration: '13:20',
                temperature: '196.5°C',
                status: 'Selesai',
                statusColor: Colors.green,
              ),

              _historyCard(
                iconColor: Colors.orange.shade300,
                title: 'Development Test',
                date: '10 Mei 2024, 08:50',
                duration: '09:30',
                temperature: '160.8°C',
                status: 'Dibatalkan',
                statusColor: Colors.red,
              ),

              _historyCard(
                iconColor: const Color(0xFF3A1C0F),
                title: 'Dark Roast',
                date: '9 Mei 2024, 15:20',
                duration: '12:50',
                temperature: '190.1°C',
                status: 'Selesai',
                statusColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _summaryCard(
      IconData icon,
      Color color,
      String title,
      String value,
      ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CircleAvatar(
            radius: 18,
            backgroundColor: color.withOpacity(0.15),
            child: Icon(
              icon,
              color: color,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            title,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _historyCard({
    required Color iconColor,
    required String title,
    required String date,
    required String duration,
    required String temperature,
    required String status,
    required Color statusColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CircleAvatar(
            radius: 22,
            backgroundColor: iconColor.withOpacity(0.15),
            child: Icon(
              Icons.local_fire_department,
              color: iconColor,
            ),
          ),

          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),

                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                      ),

                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 6),

                Text(
                  date,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [

                    Icon(
                      Icons.access_time,
                      size: 18,
                      color: Colors.grey.shade600,
                    ),

                    const SizedBox(width: 5),

                    Text(
                      duration,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),

                    const SizedBox(width: 18),

                    Icon(
                      Icons.thermostat,
                      size: 18,
                      color: Colors.grey.shade600,
                    ),

                    const SizedBox(width: 5),

                    Text(
                      temperature,
                      style: TextStyle(
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Icon(
            Icons.chevron_right,
            color: Colors.grey.shade500,
          ),
        ],
      ),
    );
  }
}