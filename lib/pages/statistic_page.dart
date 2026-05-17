import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

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
                                'Statistik',
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
                            'Analisis Roasting',
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: const Row(
                      children: [

                        Text(
                          '5 - 12 Mei 2024',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(width: 8),

                        Icon(
                          Icons.calendar_month,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              /// LINE CHART TITLE
              const Text(
                'Grafik Suhu Rata-rata',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                'Suhu (°C)',
                style: TextStyle(
                  color: Colors.grey.shade700,
                ),
              ),

              const SizedBox(height: 20),

              /// LINE CHART
              Container(
                height: 300,
                padding: const EdgeInsets.only(
                  right: 20,
                  top: 20,
                ),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),

                child: LineChart(
                  LineChartData(

                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      horizontalInterval: 50,
                      verticalInterval: 1,
                    ),

                    titlesData: FlTitlesData(

                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 45,
                          interval: 50,

                          getTitlesWidget: (value, meta) {
                            return Text(
                              '${value.toInt()}°C',
                              style: const TextStyle(fontSize: 12),
                            );
                          },
                        ),
                      ),

                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),

                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,

                          getTitlesWidget: (value, meta) {

                            const days = [
                              '5 Mei',
                              '6 Mei',
                              '7 Mei',
                              '8 Mei',
                              '9 Mei',
                              '10 Mei',
                              '11 Mei',
                              '12 Mei',
                            ];

                            return Padding(
                              padding: const EdgeInsets.only(top: 12),
                              child: Text(
                                days[value.toInt()],
                                style: const TextStyle(fontSize: 11),
                              ),
                            );
                          },

                          interval: 1,
                        ),
                      ),
                    ),

                    borderData: FlBorderData(show: false),

                    minX: 0,
                    maxX: 7,

                    minY: 50,
                    maxY: 250,

                    lineBarsData: [

                      LineChartBarData(
                        spots: const [

                          FlSpot(0, 130),
                          FlSpot(1, 160),
                          FlSpot(2, 165),
                          FlSpot(3, 155),
                          FlSpot(4, 175),
                          FlSpot(5, 198),
                          FlSpot(6, 190),
                          FlSpot(7, 182.2),
                        ],

                        isCurved: true,
                        color: Colors.orange,
                        barWidth: 4,

                        dotData: const FlDotData(show: true),

                        belowBarData: BarAreaData(show: false),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 40),

              /// SUMMARY
              const Text(
                'Ringkasan Statistik',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

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

                  const SizedBox(width: 14),

                  Expanded(
                    child: _summaryCard(
                      Icons.check_circle,
                      Colors.green,
                      'Sukses',
                      '20 (83%)',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

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

                  const SizedBox(width: 14),

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

              const SizedBox(height: 40),

              /// PIE TITLE
              const Text(
                'Distribusi Level Roast',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 25),

              /// PIE CHART
              Row(
                children: [

                  SizedBox(
                    width: 180,
                    height: 180,

                    child: PieChart(
                      PieChartData(
                        sectionsSpace: 3,
                        centerSpaceRadius: 45,

                        sections: [

                          PieChartSectionData(
                            value: 25,
                            color: const Color(0xFFFFC266),
                            showTitle: false,
                            radius: 35,
                          ),

                          PieChartSectionData(
                            value: 42,
                            color: Colors.orange,
                            showTitle: false,
                            radius: 35,
                          ),

                          PieChartSectionData(
                            value: 25,
                            color: const Color(0xFF8B5E3C),
                            showTitle: false,
                            radius: 35,
                          ),

                          PieChartSectionData(
                            value: 8,
                            color: Colors.grey.shade400,
                            showTitle: false,
                            radius: 35,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: Column(
                      children: [

                        _legendItem(
                          const Color(0xFFFFC266),
                          'Light Roast',
                          '6 (25%)',
                        ),

                        _legendItem(
                          Colors.orange,
                          'Medium Roast',
                          '10 (42%)',
                        ),

                        _legendItem(
                          const Color(0xFF8B5E3C),
                          'Dark Roast',
                          '6 (25%)',
                        ),

                        _legendItem(
                          Colors.grey,
                          'Lainnya',
                          '2 (8%)',
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),
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
      padding: const EdgeInsets.all(18),

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
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _legendItem(
      Color color,
      String title,
      String value,
      ) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 18),

      child: Row(
        children: [

          Container(
            width: 14,
            height: 14,

            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),

          Text(
            value,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}