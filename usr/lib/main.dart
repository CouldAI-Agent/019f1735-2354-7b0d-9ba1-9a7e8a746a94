import 'package:flutter/material.dart';

void main() {
  runApp(const ResumeApp());
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Professional Resume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueGrey,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const ResumeScreen(),
      },
    );
  }
}

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Resume'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black12,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: const [
              _HeaderSection(),
              SizedBox(height: 32),
              _SectionTitle('Summary'),
              _SummarySection(),
              SizedBox(height: 24),
              _SectionTitle('Education'),
              _EducationSection(),
              SizedBox(height: 24),
              _SectionTitle('Skills'),
              _SkillsSection(),
              SizedBox(height: 24),
              _SectionTitle('Projects'),
              _ProjectsSection(),
              SizedBox(height: 24),
              _SectionTitle('Certifications'),
              _CertificationsSection(),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'John Doe',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Software Engineer',
          style: TextStyle(
            fontSize: 18,
            color: Colors.blueGrey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 8,
          children: [
            _ContactItem(icon: Icons.email, text: 'johndoe@example.com'),
            _ContactItem(icon: Icons.phone, text: '+1 (555) 123-4567'),
            _ContactItem(icon: Icons.location_on, text: 'New York, NY'),
            _ContactItem(icon: Icons.link, text: 'github.com/johndoe'),
          ],
        ),
      ],
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _ContactItem({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: Colors.blueGrey[600]),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(color: Colors.grey[800]),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
            letterSpacing: 1.5,
          ),
        ),
        const Divider(height: 16, thickness: 1),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _SummarySection extends StatelessWidget {
  const _SummarySection();

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Highly motivated and detail-oriented recent Computer Science graduate with a passion for building scalable web and mobile applications. Proficient in Dart, Flutter, and Python. Strong problem-solving abilities and eager to contribute to a dynamic engineering team.',
      style: TextStyle(fontSize: 15, height: 1.5),
    );
  }
}

class _EducationSection extends StatelessWidget {
  const _EducationSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ResumeItem(
          title: 'Bachelor of Science in Computer Science',
          subtitle: 'State University, College of Engineering',
          date: 'Sept 2019 - May 2023',
          description: 'GPA: 3.8/4.0. Coursework: Data Structures, Algorithms, Web Development, Database Management.',
        ),
      ],
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        _SkillChip('Flutter'),
        _SkillChip('Dart'),
        _SkillChip('Python'),
        _SkillChip('Java'),
        _SkillChip('SQL'),
        _SkillChip('Git / GitHub'),
        _SkillChip('Agile Methodology'),
        _SkillChip('UI/UX Design'),
      ],
    );
  }
}

class _SkillChip extends StatelessWidget {
  final String label;

  const _SkillChip(this.label);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.blueGrey[50],
      side: BorderSide(color: Colors.blueGrey[200]!),
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ResumeItem(
          title: 'E-Commerce Mobile App',
          subtitle: 'Flutter, Firebase',
          date: 'Jan 2023 - April 2023',
          description: '- Developed a fully functional e-commerce app using Flutter and Firebase.\n- Implemented user authentication, product catalog, cart management, and payment gateway integration.\n- Optimized app performance resulting in smooth 60fps scrolling.',
        ),
        SizedBox(height: 16),
        _ResumeItem(
          title: 'Weather Dashboard',
          subtitle: 'React, OpenWeather API',
          date: 'Nov 2022 - Dec 2022',
          description: '- Built a responsive web dashboard to display real-time weather data.\n- Integrated RESTful APIs to fetch and display forecasts.\n- Designed a clean and intuitive user interface using modern CSS frameworks.',
        ),
      ],
    );
  }
}

class _CertificationsSection extends StatelessWidget {
  const _CertificationsSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _ResumeItem(
          title: 'AWS Certified Cloud Practitioner',
          subtitle: 'Amazon Web Services',
          date: 'June 2023',
          description: 'Validated overall understanding of the AWS Cloud platform, covering basic cloud concepts and security.',
        ),
      ],
    );
  }
}

class _ResumeItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String date;
  final String description;

  const _ResumeItem({
    required this.title,
    required this.subtitle,
    required this.date,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Text(
              date,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 15,
            color: Theme.of(context).colorScheme.secondary,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(fontSize: 14, height: 1.5),
        ),
      ],
    );
  }
}
