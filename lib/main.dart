import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

/* ---------------- APP ROOT ---------------- */

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  ThemeMode themeMode = ThemeMode.dark;

  void toggleTheme() {
    setState(() {
      themeMode =
          themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mahidhar Reddy | Junior Flutter Developer',
      themeMode: themeMode,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: PortfolioHome(onToggleTheme: toggleTheme),
    );
  }
}

/* ---------------- HOME ---------------- */

class PortfolioHome extends StatelessWidget {
  final VoidCallback onToggleTheme;
  const PortfolioHome({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: onToggleTheme,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            Divider(),
            AboutSection(),
            Divider(),
            SkillsSection(),
            Divider(),
            ProjectsSection(),
            Divider(),
            ExperienceSection(),
            Divider(),
            ContactSection(),
            FooterSection(),
          ],
        ),
      ),
    );
  }
}

/* ---------------- HERO ---------------- */

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  void open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 70),
      child: Column(
        children: [
          const Text(
            "Mahidhar Reddy",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            "Junior Flutter Developer",
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          const Text("Flutter • Dart • Firebase • REST APIs"),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            children: [
              ElevatedButton(
                onPressed: () => open(
                    "assets/Mahidhar_Reddy_Junior_Flutter_Developer.pdf"),
                child: const Text("Resume"),
              ),
              OutlinedButton(
                onPressed: () =>
                    open("https://github.com/YOUR_GITHUB_USERNAME"),
                child: const Text("GitHub"),
              ),
              OutlinedButton(
                onPressed: () =>
                    open("https://www.linkedin.com/in/YOUR_LINKEDIN_USERNAME"),
                child: const Text("LinkedIn"),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/* ---------------- ABOUT ---------------- */

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return section(
      "About Me",
      const Text(
        "Junior Flutter Developer with hands-on experience building Flutter web and "
        "mobile applications. Developed multiple self-learning projects including "
        "CRUD apps, portfolio apps, and demo products.\n\n"
        "Previously worked as an IT Support Engineer with 3+ years of experience in "
        "troubleshooting, system support, and service desk operations.",
        textAlign: TextAlign.center,
      ),
    );
  }
}

/* ---------------- SKILLS ---------------- */

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = [
      "Flutter",
      "Dart",
      "Firebase",
      "REST APIs",
      "Git & GitHub",
      "Flutter Web",
      "Responsive UI",
      "Linux",
      "Windows",
    ];

    return section(
      "Skills",
      Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        children: skills.map((s) => Chip(label: Text(s))).toList(),
      ),
    );
  }
}

/* ---------------- PROJECTS ---------------- */

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return section(
      "Projects",
      Column(
        children: const [
          ProjectCard(
            title: "Flutter CRUD App with Firebase",
            desc: "Authentication, Firestore database, CRUD operations.",
            github: "https://github.com/YOUR_GITHUB/flutter-crud-app",
            images: [
              "assets/screenshots/flutter_crud_1.png",
              "assets/screenshots/flutter_crud_2.png",
            ],
          ),
          ProjectCard(
            title: "Flutter Portfolio App",
            desc: "Responsive Flutter web & mobile portfolio.",
            github: "https://github.com/YOUR_GITHUB/flutter-portfolio",
            images: [
              "assets/screenshots/portfolio_1.png",
            ],
          ),
          ProjectCard(
            title: "Medical Appointment App (Demo)",
            desc: "Appointment booking UI with scalable layout.",
            github: "https://github.com/YOUR_GITHUB/medical-app-demo",
            images: [
              "assets/screenshots/medical_1.png",
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String desc;
  final String github;
  final List<String> images;

  const ProjectCard({
    super.key,
    required this.title,
    required this.desc,
    required this.github,
    required this.images,
  });

  void open(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            Text(desc, textAlign: TextAlign.center),
            const SizedBox(height: 12),
            Wrap(
              spacing: 10,
              children: images
                  .map((img) => Image.asset(img,
                      width: 200, height: 120, fit: BoxFit.cover))
                  .toList(),
            ),
            const SizedBox(height: 12),
            OutlinedButton(
              onPressed: () => open(github),
              child: const Text("View on GitHub"),
            )
          ],
        ),
      ),
    );
  }
}

/* ---------------- EXPERIENCE ---------------- */

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return section(
      "Experience",
      const Text(
        "IT Support Engineer\n"
        "Vishwa Samudra Engineering Pvt. Ltd.\n"
        "July 2023 – August 2024",
        textAlign: TextAlign.center,
      ),
    );
  }
}

/* ---------------- CONTACT ---------------- */

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return section(
      "Contact",
      const Column(
        children: [
          Text("📧 mahidhar407@gmail.com"),
          Text("📞 +91 93981 32203"),
          Text("📍 Pune, India"),
        ],
      ),
    );
  }
}

/* ---------------- FOOTER ---------------- */

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Text("© 2025 Mahidhar Reddy | Junior Flutter Developer"),
    );
  }
}

/* ---------------- HELPER ---------------- */

Widget section(String title, Widget child) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
    child: Column(
      children: [
        Text(title,
            style:
                const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 900), child: child),
      ],
    ),
  );
}
