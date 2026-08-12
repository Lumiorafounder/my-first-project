import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const LumioraAI());
}

class LumioraAI extends StatelessWidget {
  const LumioraAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lumiora AI',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6C63FF),
        ),
      ),
      home: const LumioraHomePage(),
    );
  }
}

// ================= HOME PAGE =================

class LumioraHomePage extends StatelessWidget {
  const LumioraHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FC),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Lumiora AI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Welcome to Lumiora AI 👋',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'Your intelligent school management assistant',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 25),

            // ================= AI BANNER =================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF6C63FF),
                    Color(0xFF8E7CFF),
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Icon(
                    Icons.auto_awesome,
                    color: Colors.white,
                    size: 35,
                  ),

                  SizedBox(height: 15),

                  Text(
                    'Lumiora AI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 6),

                  Text(
                    'Smarter school management with AI',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),

            // ================= SCHOOL MANAGEMENT =================

            const Text(
              'School Management',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            Row(
              children: [

                Expanded(
                  child: _FeatureCard(
                    icon: Icons.people_outline,
                    title: 'Students',
                    subtitle: 'Manage students',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StudentsPage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _FeatureCard(
                    icon: Icons.school_outlined,
                    title: 'Teachers',
                    subtitle: 'Manage teachers',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                        builder: (context) => TeachersPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            Row(
              children: [

                Expanded(
                  child: _FeatureCard(
                    icon: Icons.calendar_month_outlined,
                    title: 'Attendance',
                    subtitle: 'Track attendance',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AttendancePage(),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: _FeatureCard(
                    icon: Icons.payments_outlined,
                    title: 'Fees',
                    subtitle: 'Manage fees',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FeesPage(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // ================= AI FEATURES =================

            const Text(
              'AI Features',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            _AIAction(
              icon: Icons.auto_awesome,
              title: 'AI Student Report',
              subtitle: 'Generate intelligent progress reports',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AIStudentReportPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _AIAction(
              icon: Icons.analytics_outlined,
              title: 'AI Analytics',
              subtitle: 'Understand school performance',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AIAnalyticsPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            _AIAction(
              icon: Icons.chat_bubble_outline,
              title: 'AI Assistant',
              subtitle: 'Ask Lumiora AI anything',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AIAssistantPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),

      // ================= BOTTOM NAVIGATION =================

      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (index) {

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AnalyticsPage(),
              ),
            );
          }

          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
        },
        destinations: const [

          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            label: 'Analytics',
          ),

          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ================= FEATURE CARD =================

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),

      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Icon(
              icon,
              size: 30,
              color: const Color(0xFF6C63FF),
            ),

            const SizedBox(height: 14),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= AI ACTION =================

class _AIAction extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  const _AIAction({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),

      child: Container(
        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),

        child: Row(
          children: [

            Container(
              padding: const EdgeInsets.all(12),

              decoration: BoxDecoration(
                color: const Color(0xFFEDEBFF),
                borderRadius: BorderRadius.circular(14),
              ),

              child: Icon(
                icon,
                color: const Color(0xFF6C63FF),
                size: 26,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

// ================= STUDENTS PAGE =================

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List<dynamic> students = [];
  bool loading = true;
  String? error;

  final String apiUrl = 'http://192.168.1.109:8000';

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl/students'),
      );

      if (response.statusCode == 200) {
        setState(() {
          students = jsonDecode(response.body);
          loading = false;
        });
      } else {
        setState(() {
          error = 'Server error: ${response.statusCode}';
          loading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = 'Unable to connect to backend';
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Students',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : error != null
              ? Center(
                  child: Text(
                    error!,
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              : students.isEmpty
                  ? const Center(
                      child: Text(
                        'No students found',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  : RefreshIndicator(
                      onRefresh: fetchStudents,
                      child: ListView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: students.length,
                        itemBuilder: (context, index) {
                          final student = students[index];

                          return Card(
                            margin: const EdgeInsets.only(bottom: 12),
                            child: ListTile(
                              leading: const CircleAvatar(
                                child: Icon(Icons.person),
                              ),
                              title: Text(
                                student['name']?.toString() ?? 'Unknown',
                              ),
                              subtitle: Text(
                                'Class: ${student['student_class'] ?? '-'}',
                              ),
                              trailing: Text(
                                'ID: ${student['id'] ?? '-'}',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
    );
  }
}

// ================= TEACHERS PAGE =================

class TeachersPage extends StatelessWidget {
  const TeachersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'Teachers',
      icon: Icons.school_outlined,
      message: 'Teachers Management',
    );
  }
}

// ================= ATTENDANCE PAGE =================

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'Attendance',
      icon: Icons.calendar_month_outlined,
      message: 'Attendance Management',
    );
  }
}

// ================= FEES PAGE =================

class FeesPage extends StatelessWidget {
  const FeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'Fees',
      icon: Icons.payments_outlined,
      message: 'Fees Management',
    );
  }
}

// ================= AI STUDENT REPORT =================

class AIStudentReportPage extends StatelessWidget {
  const AIStudentReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'AI Student Report',
      icon: Icons.auto_awesome,
      message: 'AI Student Report',
    );
  }
}

// ================= AI ANALYTICS =================

class AIAnalyticsPage extends StatelessWidget {
  const AIAnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'AI Analytics',
      icon: Icons.analytics_outlined,
      message: 'AI Analytics',
    );
  }
}

// ================= AI ASSISTANT =================

class AIAssistantPage extends StatelessWidget {
  const AIAssistantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'AI Assistant',
      icon: Icons.chat_bubble_outline,
      message: 'Ask Lumiora AI anything',
    );
  }
}

// ================= ANALYTICS =================

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'Analytics',
      icon: Icons.analytics_outlined,
      message: 'School Analytics',
    );
  }
}

// ================= PROFILE =================

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimplePage(
      title: 'Profile',
      icon: Icons.person_outline,
      message: 'User Profile',
    );
  }
}

// ================= SIMPLE PAGE =================

class SimplePage extends StatelessWidget {
  final String title;
  final IconData icon;
  final String message;

  const SimplePage({
    super.key,
    required this.title,
    required this.icon,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              icon,
              size: 70,
              color: const Color(0xFF6C63FF),
            ),

            const SizedBox(height: 20),

            Text(
              message,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'This section is ready for backend integration.',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}