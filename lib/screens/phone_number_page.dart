import 'package:flutter/material.dart';
import 'country.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({super.key});

  @override
  State<PhoneNumberPage> createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  Country selectedCountry = const Country(name: 'India', code: '+91');

  final TextEditingController phoneController = TextEditingController();

  bool get hasPhoneNumber => phoneController.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();

    phoneController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  // ----------------------------------------------------------
  // COUNTRY PICKER
  // ----------------------------------------------------------

  void showCountryPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF202C33),
      isScrollControlled: true,
      builder: (context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.80,
          child: Column(
            children: [
              const SizedBox(height: 12),

              // Small handle
              Container(
                width: 38,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Select country',
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: countries.length,
                  itemBuilder: (context, index) {
                    final country = countries[index];

                    return ListTile(
                      dense: true,

                      onTap: () {
                        setState(() {
                          selectedCountry = country;
                        });

                        Navigator.pop(context);
                      },

                      title: Text(
                        country.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),

                      trailing: Text(
                        country.code,
                        style: const TextStyle(
                          color: Color(0xFF8696A0),
                          fontSize: 15,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // ----------------------------------------------------------
  // NEXT
  // ----------------------------------------------------------

  void nextPage() {
    if (!hasPhoneNumber) return;

    // Day 4:
    // Navigate to OTP page here.

    /*
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const OtpVerificationPage(),
      ),
    );
    */
  }

  // ----------------------------------------------------------
  // BUILD
  // ----------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive horizontal padding
    final horizontalPadding = screenWidth < 360 ? 12.0 : 16.0;

    return Scaffold(
      backgroundColor: const Color(0xFF0B141A),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),

            child: Column(
              children: [
                // ==================================================
                // THREE DOT MENU
                // ==================================================
                SizedBox(
                  height: 45,

                  child: Align(
                    alignment: Alignment.centerRight,

                    child: PopupMenuButton<String>(
                      color: const Color(0xFF202C33),

                      icon: const Icon(
                        Icons.more_vert,
                        color: Color(0xFFE9EDEF),
                        size: 25,
                      ),

                      itemBuilder: (context) => const [
                        PopupMenuItem(
                          value: 'help',

                          child: Text(
                            'Help',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ==================================================
                // TITLE
                // ==================================================
                const SizedBox(height: 27),

                const Text(
                  'Enter your phone number',

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    color: Color(0xFFE9EDEF),
                    fontSize: 24,
                    fontWeight: FontWeight.w300,
                  ),
                ),

                // ==================================================
                // DESCRIPTION
                // ==================================================
                const SizedBox(height: 18),

                SizedBox(
                  width: double.infinity,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text:
                              'WhatsApp will need to verify your phone number.\n'
                              'Carrier charges may apply. ',
                        ),
                        TextSpan(
                          text: "What's my number?",
                          style: const TextStyle(color: Color(0xFF25D366)),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF8696A0),
                      fontSize: 17,
                      height: 1.4,
                    ),
                  ),
                ),
                // ==================================================
                // COUNTRY
                // ==================================================
                const SizedBox(height: 37),

                GestureDetector(
                  onTap: showCountryPicker,

                  child: Container(
                    width: screenWidth * 0.72,

                    padding: const EdgeInsets.only(bottom: 9),

                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFF25D366),
                          width: 1.4,
                        ),
                      ),
                    ),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        Text(
                          selectedCountry.name,

                          style: const TextStyle(
                            color: Color(0xFFE9EDEF),
                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(width: 7),

                        const Icon(
                          Icons.arrow_drop_down,
                          color: Color(0xFF25D366),
                          size: 25,
                        ),
                      ],
                    ),
                  ),
                ),

                // ==================================================
                // PHONE NUMBER
                // ==================================================
                const SizedBox(height: 23),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // COUNTRY CODE
                    SizedBox(
                      width: 82,

                      child: TextField(
                        readOnly: true,

                        controller: TextEditingController(
                          text: selectedCountry.code,
                        ),

                        style: const TextStyle(
                          color: Color(0xFFE9EDEF),
                          fontSize: 17,
                        ),

                        decoration: const InputDecoration(
                          isDense: true,

                          contentPadding: EdgeInsets.only(bottom: 8),

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF25D366),
                              width: 1.4,
                            ),
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF25D366),
                              width: 1.8,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    // PHONE NUMBER
                    Expanded(
                      child: TextField(
                        controller: phoneController,

                        keyboardType: TextInputType.phone,

                        style: const TextStyle(
                          color: Color(0xFFE9EDEF),
                          fontSize: 17,
                        ),

                        decoration: const InputDecoration(
                          isDense: true,

                          contentPadding: EdgeInsets.only(bottom: 8),

                          hintText: 'Phone number',

                          hintStyle: TextStyle(
                            color: Color(0xFF8696A0),
                            fontSize: 17,
                          ),

                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF25D366),
                              width: 1.4,
                            ),
                          ),

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF25D366),
                              width: 1.8,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // ==================================================
                // NEXT BUTTON
                // ==================================================
                const SizedBox(height: 32),

                SizedBox(
                  width: screenWidth * 0.88,
                  height: 58,

                  child: ElevatedButton(
                    onPressed: hasPhoneNumber ? nextPage : null,

                    style: ElevatedButton.styleFrom(
                      backgroundColor: hasPhoneNumber
                          ? const Color(0xFF25D366)
                          : const Color(0xFF20282C),

                      disabledBackgroundColor: const Color(0xFF20282C),

                      foregroundColor: Colors.white,

                      disabledForegroundColor: const Color(0xFF3B4549),

                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    child: const Text(
                      'Next',

                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),

                // Small bottom spacing
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
