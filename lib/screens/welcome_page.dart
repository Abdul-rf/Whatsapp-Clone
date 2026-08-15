import 'package:flutter/material.dart';
import 'phone_number_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() {
    return _WelcomePageState();
  }
}

class _WelcomePageState extends State<WelcomePage> {
  // ============================================================
  // SELECTED LANGUAGE
  // ============================================================

  String selectedLanguage = 'English';

  // ============================================================
  // LANGUAGE LIST
  // ============================================================

  final List<Map<String, String>> languages = [
    {'native': 'English', 'english': 'English', 'device': 'true'},
    {'native': 'हिन्दी', 'english': 'Hindi'},
    {'native': 'मराठी', 'english': 'Marathi'},
    {'native': 'ગુજરાતી', 'english': 'Gujarati'},
    {'native': 'தமிழ்', 'english': 'Tamil'},
    {'native': 'বাংলা', 'english': 'Bangla'},
    {'native': 'తెలుగు', 'english': 'Telugu'},
    {'native': 'ಕನ್ನಡ', 'english': 'Kannada'},
    {'native': 'മലയാളം', 'english': 'Malayalam'},
    {'native': 'ਪੰਜਾਬੀ', 'english': 'Punjabi'},
    {'native': 'اردو', 'english': 'Urdu'},
  ];

  // ============================================================
  // BUILD WELCOME PAGE
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111B21),

      // ========================================================
      // APP BAR
      // ========================================================
      appBar: AppBar(
        backgroundColor: const Color(0xFF111B21),
        elevation: 0,

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.white),

            onSelected: (value) {
              if (value == 'help') {
                _showHelp();
              }
            },

            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem<String>(value: 'help', child: Text('Help')),
              ];
            },
          ),
        ],
      ),

      // ========================================================
      // BODY
      // ========================================================
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const SizedBox(height: 110),

              // ==================================================
              // WHATSAPP LOGO
              // ==================================================
              Center(
                child: Image.asset(
                  'assets/whatsapp_logo_green.png',
                  width: 120,
                ),
              ),

              const SizedBox(height: 55),

              // ==================================================
              // WELCOME TEXT
              // ==================================================
              const Text(
                'Welcome to WhatsApp',

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 10),

              // ==================================================
              // PRIVACY POLICY + TERMS
              // ==================================================
              RichText(
                textAlign: TextAlign.center,

                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.5,
                  ),

                  children: [
                    TextSpan(text: 'Read our '),

                    TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(
                        color: Color(0xFF53BDEB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    TextSpan(text: '. Tap "Agree and continue" to accept our '),

                    TextSpan(
                      text: 'Terms of Service',
                      style: TextStyle(
                        color: Color(0xFF53BDEB),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    TextSpan(text: '.'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ==================================================
              // LANGUAGE BUTTON
              // ==================================================
              GestureDetector(
                onTap: _openLanguageSelector,

                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 10,
                  ),

                  decoration: BoxDecoration(
                    color: const Color(0xFF202C33),
                    borderRadius: BorderRadius.circular(25),
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [
                      const Icon(Icons.language, color: Colors.white, size: 20),

                      const SizedBox(width: 8),

                      Text(
                        selectedLanguage,

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),

                      const SizedBox(width: 5),

                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ==================================================
              // AGREE AND CONTINUE BUTTON
              // ==================================================
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(
                  onPressed: () {
                    // ==========================================
                    // GO TO PHONE NUMBER PAGE
                    // ==========================================

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const PhoneNumberPage();
                        },
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00A884),
                    foregroundColor: Colors.white,
                    elevation: 0,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),

                  child: const Text(
                    'Agree and continue',

                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  // ============================================================
  // OPEN LANGUAGE SELECTOR
  // ============================================================

  void _openLanguageSelector() async {
    final String? language = await showModalBottomSheet<String>(
      context: context,

      isScrollControlled: true,

      backgroundColor: Colors.transparent,

      barrierColor: Colors.black54,

      builder: (context) {
        return _LanguageSelector(
          languages: languages,
          selectedLanguage: selectedLanguage,
        );
      },
    );

    if (language != null) {
      setState(() {
        selectedLanguage = language;
      });
    }
  }

  // ============================================================
  // HELP
  // ============================================================

  void _showHelp() {
    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF202C33),

          title: const Text('Help', style: TextStyle(color: Colors.white)),

          content: const Text(
            'For help and support, please visit the WhatsApp Help Center.',
            style: TextStyle(color: Colors.white70),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'OK',
                style: TextStyle(color: Color(0xFF00A884)),
              ),
            ),
          ],
        );
      },
    );
  }
}

// ==================================================================
// LANGUAGE SELECTOR
// ==================================================================

class _LanguageSelector extends StatelessWidget {
  final List<Map<String, String>> languages;
  final String selectedLanguage;

  const _LanguageSelector({
    required this.languages,
    required this.selectedLanguage,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.91,

      decoration: const BoxDecoration(
        color: Color(0xFF11171B),

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),

      child: Column(
        children: [
          const SizedBox(height: 18),

          Container(
            width: 60,
            height: 5,

            decoration: BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          const SizedBox(height: 12),

          SizedBox(
            height: 64,

            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  padding: const EdgeInsets.only(left: 28, right: 18),

                  icon: const Icon(
                    Icons.close,
                    color: Colors.white70,
                    size: 30,
                  ),
                ),

                const Text(
                  'App language',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          const Divider(height: 1, thickness: 1, color: Color(0xFF293238)),

          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),

              padding: const EdgeInsets.only(top: 4, bottom: 15),

              itemCount: languages.length,

              itemBuilder: (context, index) {
                final language = languages[index];

                final String nativeName = language['native']!;

                final String englishName = language['english']!;

                final bool isSelected = englishName == selectedLanguage;

                final bool isDeviceLanguage = language['device'] == 'true';

                return InkWell(
                  onTap: () {
                    Navigator.pop(context, englishName);
                  },

                  child: SizedBox(
                    height: 82,

                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 28),

                          child: _LanguageRadio(selected: isSelected),
                        ),

                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                nativeName,

                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),

                              Text(
                                isDeviceLanguage
                                    ? '(devices language)'
                                    : englishName,

                                style: const TextStyle(
                                  color: Colors.white54,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==================================================================
// CUSTOM RADIO BUTTON
// ==================================================================

class _LanguageRadio extends StatelessWidget {
  final bool selected;

  const _LanguageRadio({required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,

      decoration: BoxDecoration(
        shape: BoxShape.circle,

        border: Border.all(
          color: selected ? const Color(0xFF00D084) : const Color(0xFF899197),

          width: 2.5,
        ),
      ),

      child: selected
          ? Center(
              child: Container(
                width: 16,
                height: 16,

                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 2, 101, 39),
                ),
              ),
            )
          : null,
    );
  }
}
