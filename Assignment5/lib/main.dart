import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MCQ Exam Portal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0D3B66)),
        scaffoldBackgroundColor: const Color(0xFFEFF4FA),
        useMaterial3: true,
      ),
      home: const PortalHomePage(),
    );
  }
}

class PortalHomePage extends StatelessWidget {
  const PortalHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0D3B66), Color(0xFF173E67)],
          ),
        ),
        child: Center(
          child: Container(
            width: 1100,
            margin: const EdgeInsets.symmetric(vertical: 28),
            decoration: const BoxDecoration(
              color: Color(0xFFEAF1F7),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: const SingleChildScrollView(
              padding: EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeaderSection(),
                  AssignmentOverviewSection(),
                  LearningObjectivesSection(),
                  ArchitectureSection(),
                  CloudinarySection(),
                  FeaturesSection(),
                  ApiEndpointsSection(),
                  DatabaseSection(),
                  ProjectStructureSection(),
                  TechStackSection(),
                  WorkflowSection(),
                  BonusSection(),
                  ResourcesSection(),
                  ImportantNotesSection(),
                  FooterSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection();

  @override
  Widget build(BuildContext context) {
    final chips = ['Admin Panel', 'Excel Upload', 'Firebase Auth', 'Auto Reports', 'Cloudinary'];

    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.assignment_rounded, size: 34, color: Color(0xFF0D3B66)),
              SizedBox(width: 12),
              Text(
                'MCQ Exam Portal',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0D3B66),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'Full Stack Assignment - Flutter + Node.js + Firebase + Cloudinary',
            style: TextStyle(fontSize: 18, color: Color(0xFF32577D), fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 18),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: chips.map((chip) {
              final colors = [
                const Color(0xFF2F80ED),
                const Color(0xFF27AE60),
                const Color(0xFFf2994a),
                const Color(0xFFbb6bd9),
                const Color(0xFF56CCF2),
              ];
              final index = chips.indexOf(chip);
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                decoration: BoxDecoration(
                  color: colors[index % colors.length],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  chip,
                  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 18),
          const Divider(color: Color(0xFF0D3B66), thickness: 1.2),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData icon;

  const SectionHeader({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xFF0D3B66), size: 30),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              softWrap: true,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Color(0xFF0D3B66),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AssignmentOverviewSection extends StatelessWidget {
  const AssignmentOverviewSection();

  @override
  Widget build(BuildContext context) {
    final cards = [
      _InfoCard(icon: Icons.admin_panel_settings_rounded, title: 'Admin Panel', subtitle: 'Create exams via Excel upload'),
      _InfoCard(icon: Icons.lock_rounded, title: 'Authentication', subtitle: 'Email/Password + Google Sign-In'),
      _InfoCard(icon: Icons.edit_note_rounded, title: 'Exam Interface', subtitle: 'Take MCQ exams with timer'),
      _InfoCard(icon: Icons.bar_chart_rounded, title: 'Auto Result', subtitle: 'Instant result on submission'),
      _InfoCard(icon: Icons.insights_rounded, title: 'Reports', subtitle: 'Generate exam-wise reports'),
      _InfoCard(icon: Icons.cloud_done_rounded, title: 'Cloudinary', subtitle: 'All file uploads to cloud'),
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Assignment Overview', icon: Icons.star_rounded),
          const SizedBox(height: 8),
          const Text(
            'In this assignment, you will build a Professional MCQ Exam Portal that includes:',
            style: TextStyle(fontSize: 18, color: Color(0xFF2A4568)),
          ),
          const SizedBox(height: 18),
          LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = constraints.maxWidth > 900
                  ? 5
                  : constraints.maxWidth > 600
                      ? 3
                      : 2;

              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: 18,
                crossAxisSpacing: 18,
                childAspectRatio: 1.08,
                physics: const NeverScrollableScrollPhysics(),
                children: cards,
              );
            },
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: const Color(0xFFE5F3FF),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFB5D6F3)),
            ),
            child: const Text(
              'Real-World Project: This assignment will teach you to build a professional exam portal similar to Testbook, Gradeup, or Google Forms Quiz.',
              style: TextStyle(fontSize: 17, color: Color(0xFF1A3854), fontStyle: FontStyle.italic),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoCard({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.65),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFccdceb)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 38, color: const Color(0xFF0D3B66)),
          const SizedBox(height: 12),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF0D3B66), fontSize: 20)),
          const SizedBox(height: 6),
          Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 13, color: Color(0xFF496680))),
        ],
      ),
    );
  }
}

class LearningObjectivesSection extends StatelessWidget {
  const LearningObjectivesSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        children: [
          const SectionHeader(title: 'Learning Objectives', icon: Icons.psychology_rounded),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: FeatureList(title: 'Frontend Skills', items: ['Complex UI design in Flutter', 'Multi-screen navigation', 'Timer implementation', 'File picker & multi-format uploads', 'Real-time state management', 'Form validation & error handling', 'Charts for result visualization', 'Cloudinary SDK integration'])),
              SizedBox(width: 18),
              Expanded(child: FeatureList(title: 'Backend Skills', items: ['RESTful API design', 'Firebase Authentication (Email + Google)', 'Firestore database design', 'Excel file parsing (xlsx library)', 'Cloudinary storage integration', 'Multer for file uploads', 'Role-based access control', 'Auto-grading logic'])),
            ],
          ),
        ],
      ),
    );
  }
}

class FeatureList extends StatelessWidget {
  final String title;
  final List<String> items;

  const FeatureList({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFd2deee)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22, color: Color(0xFF0D3B66))),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('▶ ', style: TextStyle(color: Color(0xFF0D3B66), fontWeight: FontWeight.w700)),
                Expanded(child: Text(item, style: const TextStyle(fontSize: 15, color: Color(0xFF214C72)))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class ArchitectureSection extends StatelessWidget {
  const ArchitectureSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        children: [
          const SectionHeader(title: 'System Architecture', icon: Icons.memory_rounded),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: PlainCard(title: 'Flutter App', items: ['Student App', 'Admin App (same app, different role)', 'Firebase SDK Integration', 'Cloudinary SDK'])),
              SizedBox(width: 18),
              Expanded(child: PlainCard(title: 'Node.js API', items: ['Express.js Server', 'Firebase Admin SDK', 'Excel Parser', 'Cloudinary Upload'])),
              SizedBox(width: 18),
              Expanded(child: PlainCard(title: 'Firebase + Cloudinary', items: ['Firebase Auth', 'Firestore Database', 'Cloudinary Storage (Files)', 'Cloudinary CDN (Images)'])),
            ],
          ),
        ],
      ),
    );
  }
}

class PlainCard extends StatelessWidget {
  final String title;
  final List<String> items;

  const PlainCard({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFd2deee)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22, color: Color(0xFF0D3B66))),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('▶ ', style: TextStyle(color: Color(0xFF0D3B66), fontWeight: FontWeight.w700)),
                Expanded(child: Text(item, style: const TextStyle(fontSize: 15, color: Color(0xFF214C72)))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class CloudinarySection extends StatelessWidget {
  const CloudinarySection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Cloudinary Integration (Mandatory)', icon: Icons.cloud_done_rounded),
          Container(
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.all(18),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF0D3B66), Color(0xFF1e4e86)]),
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Column(
              children: const [
                Text('Cloudinary-Powered File Uploads', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 30)),
                SizedBox(height: 8),
                Text('All file uploads — Images, PDFs, Excel Sheets — must use Cloudinary storage', style: TextStyle(color: Colors.white70, fontSize: 15)),
              ],
            ),
          ),
          const SizedBox(height: 18),
          const Text('What is Cloudinary?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF0D3B66))),
          const SizedBox(height: 10),
          const Text('Cloudinary is a cloud-based media management platform that provides storage, optimization, transformation, and delivery of images and files. It is widely used in production apps for secure, scalable file handling.', style: TextStyle(fontSize: 16, color: Color(0xFF214C72))),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: BulletCard(title: 'Files to Upload via Cloudinary', items: ['Excel Sheets - Admin\'s question uploads (.xlsx, .csv)', 'Profile Images - Student/Admin profile pictures', 'Question Images - Diagrams in questions (optional)', 'Result PDFs - Generated result cards', 'Certificates - Auto-generated certificates (bonus)', 'Report Exports - Admin report files'])),
              SizedBox(width: 18),
              Expanded(child: BulletCard(title: 'Why Cloudinary?', items: ['Secure cloud storage', 'Automatic image optimization', 'Fast CDN delivery worldwide', 'Free tier available (25 GB)', 'Easy SDK for Flutter + Node.js', 'Built-in transformations', 'Signed uploads for security', 'Folder organization'])),
            ],
          ),
          const SizedBox(height: 18),
          const CodeBlock(title: 'Cloudinary Configuration', code: 'const cloudinary = require("cloudinary").v2;\ncloudinary.config({\n  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,\n  api_key: process.env.CLOUDINARY_API_KEY,\n  api_secret: process.env.CLOUDINARY_API_SECRET,\n  secure: true\n});'),
          const SizedBox(height: 18),
          const CodeBlock(title: 'Node.js Cloudinary Setup', code: 'const cloudinary = require("cloudinary").v2;\nrequire("dotenv").config();\ncloudinary.config({\n  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,\n  api_key: process.env.CLOUDINARY_API_KEY,\n  api_secret: process.env.CLOUDINARY_API_SECRET,\n  secure: true\n});\nmodule.exports = cloudinary;'),
        ],
      ),
    );
  }
}

class BulletCard extends StatelessWidget {
  final String title;
  final List<String> items;

  const BulletCard({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFd2deee)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22, color: Color(0xFF0D3B66))),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('▶ ', style: TextStyle(color: Color(0xFF0D3B66), fontWeight: FontWeight.w700)),
                Expanded(child: Text(item, style: const TextStyle(fontSize: 14, color: Color(0xFF214C72)))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class CodeBlock extends StatelessWidget {
  final String title;
  final String code;

  const CodeBlock({required this.title, required this.code});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Color(0xFF0D3B66))),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Color(0xFF1d273a),
          ),
          child: SelectableText(
            code,
            style: const TextStyle(fontFamily: 'monospace', color: Colors.white, fontSize: 15, height: 1.5),
          ),
        ),
      ],
    );
  }
}

class FeaturesSection extends StatelessWidget {
  const FeaturesSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        children: [
          const SectionHeader(title: 'Detailed Features', icon: Icons.widgets_rounded),
          const SizedBox(height: 8),
          FeaturePair(
            title: '1. Authentication System',
            left: const FeatureList(title: 'Features', items: ['Email + Password Sign Up/Login', 'Google Sign-In integration', 'Forgot Password functionality', 'Email verification', 'Role-based redirect (Admin/Student)', 'Session persistence', 'Logout functionality', 'Profile picture upload to Cloudinary']),
            right: const CodeBlock(title: 'Firebase Auth Code', code: 'final credential = await FirebaseAuth.instance\n  .createUserWithEmailAndPassword(\n    email: email,\n    password: password,\n  );\n\nfinal GoogleSignInAccount? googleUser =\n    await GoogleSignIn().signIn();\n\nawait FirebaseFirestore.instance\n    .collection("users")\n    .doc(uid)\n    .set({\n      "email": email,\n      "role": "student",\n      "createdAt": FieldValue.serverTimestamp(),\n    });'),
          ),
          FeaturePair(
            title: '2. Excel Upload & Exam Creation (Admin)',
            left: const FeatureList(title: 'Features', items: ['Excel file picker from device', 'Upload to Cloudinary (raw type)', 'Real-time parsing & validation', 'Preview questions before saving', 'Auto-detect errors in Excel', 'Bulk insert to Firestore', 'Exam metadata form', 'Save Cloudinary URL for future reference']),
            right: const CodeBlock(title: 'Excel Parsing Code', code: 'const workbook = xlsx.readFile(filePath);\nconst sheet = workbook.Sheets[workbook.SheetNames[0]];\nconst questions = xlsx.utils.sheet_to_json(sheet);\n\nquestions.forEach((q) => {\n  db.collection("questions").add({\n    examId,\n    question: q.Question,\n    options: [q.OptionA, q.OptionB, q.OptionC, q.OptionD],\n    correctAnswer: q.CorrectAnswer,\n  });\n});'),
          ),
          FeaturePair(
            title: '3. Exam Interface (Student)',
            left: const FeatureList(title: 'Features', items: ['Countdown timer (auto-submit on timeout)', 'Question palette (jump to any question)', 'Mark for review', 'Previous/Next navigation', 'Progress indicator', 'Auto-save answers', 'Submit confirmation dialog', 'Full-screen mode']),
            right: const CodeBlock(title: 'Question Palette Colors', code: 'Green  -> Answered\nRed    -> Not Answered\nPurple -> Marked for Review\nGray   -> Not Visited'),
          ),
          FeaturePair(
            title: '4. Auto Result Generation',
            left: const FeatureList(title: 'Result Features', items: ['Instant result on submission', 'Score calculation with negative marking', 'Pass/Fail status', 'Correct/Wrong/Unattempted count', 'Percentage & Grade', 'Question-wise analysis', 'Time taken', 'Download result PDF (stored on Cloudinary)']),
            right: const CodeBlock(title: 'Result Data Structure', code: '{\n  "studentId": "uid123",\n  "examId": "exam456",\n  "totalQuestions": 50,\n  "attempted": 45,\n  "correct": 38,\n  "wrong": 7,\n  "unattempted": 5,\n  "score": 36.25,\n  "percentage": 72.5,\n  "status": "PASS",\n  "grade": "B+",\n  "timeTaken": 1250,\n  "pdfUrl": "https://res.cloudinary.com/..."\n}'),
          ),
          FeaturePair(
            title: '5. Admin Reports',
            left: const FeatureList(title: 'Report Features', items: ['Exam-wise student results', 'Sort by score/date/name', 'Topper list', 'Average score', 'Pass percentage', 'Export to Excel/PDF', 'Student-wise history', 'Charts & graphs']),
            right: const CodeBlock(title: 'Report Columns', code: 'Roll No / Student ID\nStudent Name\nEmail\nScore\nPercentage\nStatus (Pass/Fail)\nTime Taken\nSubmission Date'),
          ),
        ],
      ),
    );
  }
}

class FeaturePair extends StatelessWidget {
  final String title;
  final Widget left;
  final Widget right;

  const FeaturePair({required this.title, required this.left, required this.right});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF0D3B66))),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: left),
              const SizedBox(width: 18),
              Expanded(child: right),
            ],
          ),
        ],
      ),
    );
  }
}

class ApiEndpointsSection extends StatelessWidget {
  const ApiEndpointsSection();

  @override
  Widget build(BuildContext context) {
    final adminRows = [
      ['POST', '/admin/upload-excel', 'Upload Excel → Cloudinary → Create exam'],
      ['GET', '/admin/exams', 'List all exams'],
      ['GET', '/admin/exam/:id', 'Get specific exam details'],
      ['PUT', '/admin/exam/:id', 'Update exam'],
      ['DELETE', '/admin/exam/:id', 'Delete exam'],
      ['GET', '/admin/report/:examId', 'Generate exam-wise report'],
      ['POST', '/admin/report/:examId/export', 'Export report → Cloudinary'],
      ['GET', '/admin/students', 'List all students'],
    ];

    final studentRows = [
      ['POST', '/student/upload-profile', 'Upload profile image → Cloudinary'],
      ['GET', '/student/exams', 'List available exams'],
      ['GET', '/student/exam/:id/start', 'Start exam (fetch questions)'],
      ['POST', '/student/exam/:id/submit', 'Submit exam (auto-grade)'],
      ['GET', '/student/result/:examId', 'Get specific exam result'],
      ['POST', '/student/result/:attemptId/pdf', 'Generate & upload result PDF → Cloudinary'],
      ['GET', '/student/history', 'Get all past attempts'],
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'API Endpoints', icon: Icons.api_rounded),
          const SizedBox(height: 10),
          const Text('Base URL: http://localhost:5000/api', style: TextStyle(fontSize: 16, color: Color(0xFF2d4c70))),
          const SizedBox(height: 16),
          EndpointTable(title: 'Admin APIs', rows: adminRows),
          const SizedBox(height: 18),
          EndpointTable(title: 'Student APIs', rows: studentRows),
        ],
      ),
    );
  }
}

class EndpointTable extends StatelessWidget {
  final String title;
  final List<List<String>> rows;

  const EndpointTable({required this.title, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF0D3B66))),
        const SizedBox(height: 10),
        Table(
          border: TableBorder.all(color: const Color(0xFFc8d6e7), width: 1),
          columnWidths: const {0: FixedColumnWidth(90), 1: FixedColumnWidth(220), 2: FlexColumnWidth()},
          children: [
            const TableRow(
              decoration: BoxDecoration(color: Color(0xFF0D3B66)),
              children: [
                Padding(padding: EdgeInsets.all(12), child: Text('Method', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800))),
                Padding(padding: EdgeInsets.all(12), child: Text('Endpoint', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800))),
                Padding(padding: EdgeInsets.all(12), child: Text('Description', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800))),
              ],
            ),
            ...rows.map((row) {
              final method = row[0];
              final color = method == 'POST'
                  ? Colors.green
                  : method == 'GET'
                      ? Colors.blue
                      : method == 'PUT'
                          ? Colors.orange
                          : Colors.red;

              return TableRow(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: Text(method, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 12)),
                      ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.all(12), child: Text(row[1], style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF173c62)))),
                  Padding(padding: const EdgeInsets.all(12), child: Text(row[2], style: const TextStyle(color: Color(0xFF2d4c70)))),
                ],
              );
            }).toList(),
          ],
        ),
      ],
    );
  }
}

class DatabaseSection extends StatelessWidget {
  const DatabaseSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Firestore Database Structure', icon: Icons.storage_rounded),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: Color(0xFF1d273a),
            ),
            child: SelectableText(
              'users/{userId} -> email, name, role, photoUrl, createdAt, lastLogin\nexams/{examId} -> title, subject, duration, totalMarks, passingMarks, negativeMarking, startDate, endDate, excelUrl\nquestions/{questionId} -> question, options, correctAnswer, marks\nattempts/{attemptId} -> studentId, examId, answers, score, status, resultPdfUrl, submittedAt',
              style: const TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 15, height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectStructureSection extends StatelessWidget {
  const ProjectStructureSection();

  @override
  Widget build(BuildContext context) {
    const flutterStructure = '''lib/
  models/
    user_model.dart
    exam_model.dart
    question_model.dart
    result_model.dart
  services/
    auth_service.dart
    exam_service.dart
    cloudinary_service.dart
    api_service.dart
  screens/
    auth/
      login_screen.dart
      signup_screen.dart
    admin/
      admin_dashboard.dart
    student/
      student_dashboard.dart''';

    const backendStructure = '''backend/
  src/
    controllers/
      authController.js
      examController.js
    routes/
      authRoutes.js
      adminRoutes.js
      studentRoutes.js
    config/
      firebase.js
      cloudinary.js
  server.js''';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Project Structure', icon: Icons.account_tree_rounded),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1d273a),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: SelectableText('Flutter App Structure\n\n$flutterStructure', style: const TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 14, height: 1.5)),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1d273a),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: SelectableText('Backend Structure\n\n$backendStructure', style: const TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 14, height: 1.5)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TechStackSection extends StatelessWidget {
  const TechStackSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Tech Stack & Dependencies', icon: Icons.build_circle_rounded),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1d273a),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: SelectableText('Flutter (pubspec.yaml)\n\ndependencies:\n  flutter:\n    sdk: flutter\n  firebase_core: ^2.24.0\n  firebase_auth: ^4.15.0\n  cloud_firestore: ^4.13.0\n  google_sign_in: ^6.1.5\n  http: ^1.1.0\n  provider: ^6.0.0\n  file_picker: ^6.1.1\n  image_picker: ^1.0.5\n  cloudinary_public: ^0.21.0', style: const TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 14, height: 1.5)),
                ),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF1d273a),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: SelectableText('Node.js (package.json)\n\n"dependencies": {\n  "express": "^4.18.2",\n  "cors": "^2.8.5",\n  "firebase-admin": "^11.11.0",\n  "multer": "^1.4.5-lts.1",\n  "xlsx": "^0.18.5",\n  "cloudinary": "^1.41.0",\n  "dotenv": "^16.3.1"\n}', style: const TextStyle(color: Colors.white, fontFamily: 'monospace', fontSize: 14, height: 1.5)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WorkflowSection extends StatelessWidget {
  const WorkflowSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Complete Workflow', icon: Icons.workspaces_rounded),
          const SizedBox(height: 10),
          WorkflowColumn(title: 'Admin Flow', items: ['Admin Login', 'Upload Excel Sheet', 'Fill Exam Details', 'Preview & Publish', 'Generate Reports']),
          const SizedBox(height: 16),
          WorkflowColumn(title: 'Student Flow', items: ['Sign Up / Login', 'Upload Profile Picture', 'Browse Available Exams', 'Start Exam', 'Submit Exam', 'View Result', 'View History']),
        ],
      ),
    );
  }
}

class WorkflowColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const WorkflowColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: Color(0xFF0D3B66))),
        const SizedBox(height: 12),
        ...items.asMap().entries.map((entry) {
          final index = entry.key + 1;
          final value = entry.value;
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFd2deee)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: const Color(0xFF0D3B66),
                  child: Text('$index', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
                ),
                const SizedBox(width: 10),
                Expanded(child: Text(value, style: const TextStyle(fontSize: 16, color: Color(0xFF214C72), fontWeight: FontWeight.w600))),
              ],
            ),
          );
        }),
      ],
    );
  }
}

class BonusSection extends StatelessWidget {
  const BonusSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Bonus Features (Extra Marks)', icon: Icons.emoji_events_rounded),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: BonusColumn(title: 'Advanced Features', items: ['Push notifications for new exams', 'Offline exam mode', 'Anti-cheating (tab switch detection)', 'Question randomization', 'Option shuffling', 'Multi-language support', 'Dark mode', 'Cloudinary image transformations (thumbnails, watermarks)'])),
              SizedBox(width: 18),
              Expanded(child: BonusColumn(title: 'Analytics', items: ['Student performance graph', 'Topic-wise analysis', 'Class average comparison', 'Time-per-question analysis', 'Leaderboard', 'Certificate generation (auto upload to Cloudinary)'])),
            ],
          ),
        ],
      ),
    );
  }
}

class BonusColumn extends StatelessWidget {
  final String title;
  final List<String> items;

  const BonusColumn({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFd2deee)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22, color: Color(0xFF0D3B66))),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('▶ ', style: TextStyle(color: Color(0xFF0D3B66), fontWeight: FontWeight.w700)),
                Expanded(child: Text(item, style: const TextStyle(fontSize: 15, color: Color(0xFF214C72)))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class ResourcesSection extends StatelessWidget {
  const ResourcesSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Resources', icon: Icons.library_books_rounded),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(child: ResourceBox(title: 'Documentation', items: ['Firebase Auth', 'Firestore', 'Cloudinary Docs', 'Flutter Docs'])),
              SizedBox(width: 18),
              Expanded(child: ResourceBox(title: 'Tutorials', items: ['Firebase Auth with Flutter', 'Cloudinary + Node.js upload', 'Excel parsing in Node.js', 'Building quiz apps'])),
              SizedBox(width: 18),
              Expanded(child: ResourceBox(title: 'Tools', items: ['VS Code / Android Studio', 'Postman', 'Firebase Console', 'Cloudinary Dashboard'])),
            ],
          ),
        ],
      ),
    );
  }
}

class ResourceBox extends StatelessWidget {
  final String title;
  final List<String> items;

  const ResourceBox({required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFd2deee)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 22, color: Color(0xFF0D3B66))),
          const SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('▶ ', style: TextStyle(color: Color(0xFF0D3B66), fontWeight: FontWeight.w700)),
                Expanded(child: Text(item, style: const TextStyle(fontSize: 15, color: Color(0xFF214C72)))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class ImportantNotesSection extends StatelessWidget {
  const ImportantNotesSection();

  @override
  Widget build(BuildContext context) {
    final notes = [
      'Excel Format: The "Correct Answer" column must contain only A, B, C, or D. No extra columns.',
      'Firebase Rules: Set proper security rules to prevent unauthorized access.',
      'Timer Logic: Implement server-side timer too, so it runs even if the app is closed.',
      'Answer Security: Never send correct answers to the client. Grade on the server only.',
      'Cloudinary Security: Use signed uploads for admin files. Keep API secret in .env (never commit to GitHub).',
      'Cloudinary Cleanup: When deleting an exam, also delete associated Cloudinary files using cloudinary.uploader.destroy(publicId) to keep storage clean.',
      'Cloudinary Free Tier: 25 GB storage + 25 GB bandwidth/month — enough for this assignment. Upgrade if needed for demo.',
      'Pro Tip: Build modules one at a time (Auth → Cloudinary Upload → Excel → Exam → Result → Report), then integrate them together.'
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFc7d5e5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(title: 'Important Notes', icon: Icons.error_rounded),
          const SizedBox(height: 10),
          ...notes.map((note) => Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF4E8C9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFE4B769)),
            ),
            child: Row(
              children: [
                const Icon(Icons.warning_amber_rounded, color: Colors.orange),
                const SizedBox(width: 12),
                Expanded(child: Text(note, style: const TextStyle(color: Color(0xFF233E5C), fontSize: 15))),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: const [
          Text('MCQ Exam Portal Assignment', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white)),
          SizedBox(height: 6),
          Text('Full Stack Project | Flutter + Node.js + Firebase + Cloudinary', style: TextStyle(fontSize: 16, color: Colors.white70)),
          SizedBox(height: 6),
          Text('Made with ❤️ for students', style: TextStyle(fontSize: 15, color: Colors.white)),
          SizedBox(height: 6),
          Text('© 2026 - All Rights Reserved', style: TextStyle(fontSize: 14, color: Colors.white70)),
        ],
      ),
    );
  }
}
