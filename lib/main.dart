import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';



void main() {
  runApp(const MyApp());
}



// This should be declared globally

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        return MaterialApp(
          title: 'Meter Monitoring Login',
          debugShowCheckedModeBanner: false,

          // Light Theme
          theme: ThemeData(
            brightness: Brightness.light,
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlueAccent,

              brightness: Brightness.light,
              
            ),
            useMaterial3: true,
          ),

          // Dark Theme
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            scaffoldBackgroundColor: Colors.black,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.lightBlueAccent,
              
              brightness: Brightness.dark,
            ),
            useMaterial3: true,
          ),

          // This controls which theme is active
          themeMode: mode,

          home: const LoginScreen(),
        );
      },
    );
  }
}



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Full-screen background image
          Image.asset(
            'assests/wire.jpg', // Make sure path is correct
            fit: BoxFit.cover,
          ),

          // Centered Card
          Center(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Welcome Back",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Sign in to continue",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Username Field
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline),
                          labelText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password Field with Eye Icon
                      TextField(
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Sign In Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const HomePage(),
                              ),
                            );
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Sign Up Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Don't have an account? "),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => const SignupScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Sign Up",
                              
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------- Signup Screen ----------------------

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool obscurePassword = true;
    bool obscureConfirmPassword = true;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Full-screen background image
          Image.asset(
            'assests/wire.jpg',
            fit: BoxFit.cover,
          ),

          // Centered Card
          Center(
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white.withOpacity(0.9),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Username Field
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person_outline),
                          labelText: "Username",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password Field
                      StatefulBuilder(
                        builder: (context, setState) {
                          return TextField(
                            obscureText: obscurePassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_outline),
                              labelText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscurePassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    obscurePassword = !obscurePassword;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 20),

                      // Confirm Password Field
                      StatefulBuilder(
                        builder: (context, setState) {
                          return TextField(
                            obscureText: obscureConfirmPassword,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock_outline),
                              labelText: "Confirm Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obscureConfirmPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    obscureConfirmPassword =
                                        !obscureConfirmPassword;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(height: 30),

                      // Sign Up Button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {
                            // Handle signup action
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Back to Login
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Already have an account? ",
                            
                            ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    DashboardPage(),
    MeterStatusPage(),
    MapPage(),
    ProfilePage(),
  ];

  final List<String> _titles = [
    "Dashboard",
    "Meter Status",
    "Map",
    "Profile",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Row(
        children: [
          // Side Navigation
          Container(
            width: 110,
            decoration: BoxDecoration(
              color: theme.cardColor, // 🔹 Adapts to theme
              border: Border(
                right: BorderSide(
                  color: theme.dividerColor, // 🔹 Dynamic divider
                  width: 0.5,
                ),
              ),
              boxShadow: [
                if (!isDark) // 🔹 Only show shadow in light mode
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),

                // Logo
                Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.asset(
                        'assests/cool.png', // ✅ fixed spelling
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 2),
                  ],
                ),

                // Navigation Items
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _titles.length,
                      itemBuilder: (context, index) {
                        bool isSelected = _selectedIndex == index;
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 5),
                          child: Tooltip(
                            message: _titles[index],
                            child: InkWell(
                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: isSelected
                                      ? colorScheme.primary.withOpacity(0.2)
                                      : Colors.transparent,
                                ),
                                child: Icon(
                                  _getIconForIndex(index, isSelected),
                                  size: 28,
                                  color: isSelected
                                      ? colorScheme.primary
                                      : theme.iconTheme.color?.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // Settings Button at Bottom
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Tooltip(
                    message: "Settings",
                    child: InkWell(
                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        // Handle settings tap
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isDark
                              ? Colors.white.withOpacity(0.05)
                              : Colors.grey.withOpacity(0.1),
                        ),
                        child: Icon(
                          Icons.settings,
                          size: 28,
                          color: theme.iconTheme.color?.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }

  IconData _getIconForIndex(int index, bool isSelected) {
    switch (index) {
      case 0:
        return isSelected ? Icons.home : Icons.home_outlined;
      case 1:
        return isSelected
            ? Icons.electric_meter
            : Icons.electric_meter_outlined;
      case 2:
        return isSelected ? Icons.map : Icons.map_outlined;
      case 3:
        return isSelected ? Icons.person : Icons.person_outline;
      default:
        return Icons.dashboard_outlined;
    }
  }
}




class CustomerSearchCard extends StatefulWidget {
  final List<String> states;
  const CustomerSearchCard({super.key, required this.states});

  @override
  State<CustomerSearchCard> createState() => _CustomerSearchCardState();
}

class _CustomerSearchCardState extends State<CustomerSearchCard> {
  String? selectedState;
  String searchQuery = "";

  final List<Map<String, String>> customers = [
    {"name": "John Doe", "meter": "MTR12345", "address": "Garki, Abuja"},
    {"name": "Jane Smith", "meter": "MTR67890", "address": "Lekki, Lagos"},
    {"name": "Aliyu Musa", "meter": "MTR11223", "address": "Nassarawa, Kano"},
    {"name": "Chika Obi", "meter": "MTR44556", "address": "Enugu South, Enugu"},
    {"name": "Fatima Bello", "meter": "MTR77889", "address": "Kaduna, Kaduna"},
    {"name": "Emeka Okafor", "meter": "MTR99001", "address": "Port Harcourt, Rivers"},
    {"name": "Aisha Ibrahim", "meter": "MTR22334", "address": "Ikeja, Lagos"},
    {"name": "Tunde Adeyemi", "meter": "MTR55667", "address": "Ibadan, Oyo"},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final filteredCustomers = customers.where((c) {
      final matchName =
          c["name"]!.toLowerCase().contains(searchQuery.toLowerCase());
      final matchState = selectedState == null ||
          c["address"]!.toLowerCase().contains(selectedState!.toLowerCase());
      return matchName && matchState;
    }).toList();

    return Card(
      color: theme.cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      shadowColor: colorScheme.primary.withOpacity(0.3),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + Filter Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Customer Search",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 8),
                  ),
                  onPressed: () async {
                    final selected = await showDialog<String>(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: theme.dialogBackgroundColor,
                        title: const Text("Select State"),
                        content: SizedBox(
                          width: double.minPositive,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: widget.states.length,
                            itemBuilder: (context, index) {
                              final state = widget.states[index];
                              return ListTile(
                                title: Text(state),
                                trailing: selectedState == state
                                    ? Icon(Icons.check,
                                        color: colorScheme.secondary)
                                    : null,
                                onTap: () => Navigator.pop(context, state),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                    if (selected != null) {
                      setState(() {
                        selectedState = selected;
                      });
                    }
                  },
                  icon: const Icon(Icons.filter_list),
                  label: Text(
                    selectedState == null ? "Filter" : selectedState!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Search Field with border
            TextField(
              decoration: InputDecoration(
                hintText: "Search by customer name...",
                hintStyle: theme.textTheme.bodyMedium
                    ?.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
                prefixIcon:
                    Icon(Icons.search, color: colorScheme.primary),
                filled: true,
                fillColor: theme.inputDecorationTheme.fillColor ??
                    colorScheme.surfaceVariant,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                      color: colorScheme.primary, width: 1.2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                      color: colorScheme.primary, width: 1.2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(
                      color: colorScheme.primary, width: 1.8),
                ),
              ),
              onChanged: (val) {
                setState(() {
                  searchQuery = val;
                });
              },
            ),

            const SizedBox(height: 14),

            // Filtered Results
            Expanded(
              child: filteredCustomers.isEmpty
                  ? Center(
                      child: Text(
                        "No customers found",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurface.withOpacity(0.6),
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredCustomers.length,
                      itemBuilder: (context, index) {
                        final customer = filteredCustomers[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          color: theme.cardColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                            side: BorderSide(
                              color: colorScheme.primary,
                              width: 1.2,
                            ),
                          ),
                          child: ListTile(
                            tileColor: theme.cardColor,
                            contentPadding: const EdgeInsets.all(12),
                            leading: CircleAvatar(
                              backgroundColor:
                                  colorScheme.primary.withOpacity(0.2),
                              child: Icon(Icons.person,
                                  color: colorScheme.primary),
                            ),
                            title: Text(
                              customer["name"]!,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              "Meter: ${customer["meter"]}\nAddress: ${customer["address"]}",
                              style: theme.textTheme.bodySmall,
                            ),
                            isThreeLine: true,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}



// Assume themeNotifier is a global ValueNotifier<ThemeMode>
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? selectedState;
  String? selectedLocality;
  String? selectedManufacturer;

  final List<String> states = [
    "Abuja",
    "Lagos",
    "Kano",
    "Kaduna",
    "Rivers",
    "Enugu",
    "Oyo",
    "Katsina",
  ];

  final Map<String, List<String>> localities = {
    "Abuja": ["Garki", "Wuse", "Maitama"],
    "Lagos": ["Ikeja", "Lekki", "Yaba"],
    "Kano": ["Fagge", "Nassarawa", "Tarauni"],
    "Kaduna": ["Kaduna", "Katsina", "Kano"],
    "Rivers": ["Port Harcourt", "Obio-Akpor", "Eleme"],
    "Enugu": ["Enugu North", "Enugu South", "Enugu East"],
    "Oyo": ["Ibadan", "Ogbomosho", "Oyo"],
    "Katsina": ["Katsina", "Kaduna", "Kano"],
  };

  final Map<String, int> stateMeters = {
    "Abuja": 2500,
    "Lagos": 4200,
    "Kano": 3100,
    "Kaduna": 1800,
    "Rivers": 2000,
    "Enugu": 1500,
    "Oyo": 1700,
    "Katsina": 1300,
  };

  final Map<String, int> manufacturerMeters = {
    "Manufacturer A": 1200,
    "Manufacturer B": 900,
    "Manufacturer C": 1500,
  };

  final List<int> dailyKW = [1200, 1500, 1100, 1800, 2000, 1600, 2100];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView( // ✅ Make screen scrollable
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- TOP BAR ----------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Dashboard",
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      // 🌗 Custom Theme Toggle Switch
                      ThemeToggleSwitch(themeNotifier: themeNotifier),
                      const SizedBox(width: 16),
                      CircleAvatar(
                        radius: 22,
                        backgroundColor:
                            isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                        child: IconButton(
                          icon: const Icon(Icons.notifications),
                          color: isDark
                              ? Colors.grey.shade200
                              : Colors.grey.shade800,
                          iconSize: 22,
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(width: 12),
                      const CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage('assets/some.jpg'),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ---------- DASHBOARD CARDS ----------
              Row(
                children: [
                  Expanded(
                    child: _buildDashboardCard(
                      context,
                      title: "Total Meters",
                      value: "10,500",
                      icon: Icons.electric_meter,
                      color: colorScheme.primaryContainer,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDashboardCard(
                      context,
                      title: selectedState == null
                          ? "Meters in Abuja"
                          : "Meters in $selectedState",
                      value: selectedState == null
                          ? "2,500"
                          : "${stateMeters[selectedState] ?? 0}",
                      icon: Icons.location_city,
                      actionIcon: Icons.search,
                      color: colorScheme.tertiaryContainer,
                      onActionTap: () async {
                        await showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Select State"),
                            content: DropdownButton<String>(
                              isExpanded: true,
                              value: selectedState,
                              hint: const Text("Choose a state"),
                              items: states
                                  .map((s) => DropdownMenuItem(
                                      value: s, child: Text(s)))
                                  .toList(),
                              onChanged: (val) {
                                setState(() {
                                  selectedState = val;
                                });
                              },
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  if (selectedState != null) {
                                    _showLocalities(selectedState!);
                                  }
                                },
                                child: const Text("Next"),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDashboardCard(
                      context,
                      title: "Manufacturers",
                      value: "${manufacturerMeters.length}",
                      icon: Icons.factory,
                      actionIcon: Icons.search,
                      color: colorScheme.secondaryContainer,
                      onActionTap: () async {
                        await showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Manufacturers"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: manufacturerMeters.entries
                                  .map((entry) => ListTile(
                                        title: Text(entry.key),
                                        trailing: Text(
                                          "${entry.value}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ))
                                  .toList(),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Close"),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDashboardCard(
                      context,
                      title: "New Meters",
                      value: "1,200",
                      icon: Icons.add_box,
                      color: colorScheme.primary.withOpacity(0.2),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildDashboardCard(
                      context,
                      title: "Total kW Today",
                      value: "8,500 kW",
                      icon: Icons.bolt,
                      color: colorScheme.errorContainer,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // ---------- BAR CHART + EXTRA CARDS + SEARCH CARD ----------
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Bar Chart ---
                  SizedBox(
                    height: 380,
                    width: 470,
                    child: Card(
                      color: theme.cardColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Daily Kilowatt Usage",
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Breakdown of power consumption across the week",
                              style: theme.textTheme.bodySmall,
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: BarChart(
                                BarChartData(
                                  alignment: BarChartAlignment.spaceAround,
                                  maxY: 2500,
                                  borderData: FlBorderData(show: false),
                                  gridData: FlGridData(
                                      show: true, horizontalInterval: 500),
                                  titlesData: FlTitlesData(
                                    leftTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        interval: 500,
                                        reservedSize: 40,
                                        getTitlesWidget: (value, meta) =>
                                            Text(value.toInt().toString(),
                                                style: theme.textTheme.bodySmall),
                                      ),
                                    ),
                                    bottomTitles: AxisTitles(
                                      sideTitles: SideTitles(
                                        showTitles: true,
                                        getTitlesWidget: (value, meta) {
                                          const days = [
                                            "Mon", "Tue", "Wed",
                                            "Thu", "Fri", "Sat", "Sun"
                                          ];
                                          return Text(
                                            days[value.toInt()],
                                            style: theme.textTheme.bodyMedium
                                                ?.copyWith(
                                                    fontWeight: FontWeight.bold),
                                          );
                                        },
                                      ),
                                    ),
                                    topTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                    rightTitles: AxisTitles(
                                        sideTitles:
                                            SideTitles(showTitles: false)),
                                  ),
                                  barGroups: List.generate(
                                    dailyKW.length,
                                    (i) => BarChartGroupData(
                                      x: i,
                                      barRods: [
                                        BarChartRodData(
                                          toY: dailyKW[i].toDouble(),
                                          color: colorScheme.primary,
                                          width: 18,
                                          borderRadius: BorderRadius.circular(4),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // --- Three Cards + Search Card side by side ---
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: 220,
                              child: _buildDashboardCard(
                                context,
                                title: "Active Meters",
                                value: "7,800",
                                icon: Icons.check_circle,
                                color: colorScheme.secondaryContainer,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: 220,
                              child: _buildDashboardCard(
                                context,
                                title: "Online Meters",
                                value: "6,200",
                                icon: Icons.wifi,
                                color: colorScheme.primaryContainer,
                              ),
                            ),
                            const SizedBox(height: 25),
                            SizedBox(
                              width: 220,
                              child: _buildDashboardCard(
                                context,
                                title: "Offline Meters",
                                value: "1,600",
                                icon: Icons.wifi_off,
                                color: colorScheme.errorContainer,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: SizedBox(
                            height: 380,
                            child:
                                CustomerSearchCard(states: states), // Replace with CustomerSearchCard
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ------------------ Helper: Build Card ------------------
  Widget _buildDashboardCard(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    IconData? actionIcon,
    VoidCallback? onActionTap,
  }) {
    final theme = Theme.of(context);
    final ValueNotifier<bool> isHovered = ValueNotifier(false);

    return MouseRegion(
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: isHovered,
        builder: (context, hovered, _) {
          return AnimatedScale(
            scale: hovered ? 1.05 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  if (theme.brightness == Brightness.light)
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(icon, size: 24, color: theme.colorScheme.primary),
                      if (actionIcon != null)
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(actionIcon,
                              size: 20, color: theme.iconTheme.color),
                          onPressed: onActionTap,
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(title, style: theme.textTheme.bodySmall),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ------------------ Helper: Show Localities ------------------
  void _showLocalities(String state) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Localities in $state"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: (localities[state] ?? [])
              .map((loc) => ListTile(
                    title: Text(loc),
                    onTap: () {
                      Navigator.pop(context);
                      _showLocalityMeters(state, loc);
                    },
                  ))
              .toList(),
        ),
      ),
    );
  }

  void _showLocalityMeters(String state, String locality) async {
    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Meters in $locality"),
        content: Text(
          "Total meters in $locality: ${stateMeters[state] != null ? (stateMeters[state]! ~/ 3) : 0}",
          style: const TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          )
        ],
      ),
    );
  }
}

// 🌗 Custom Toggle Switch Widget
class ThemeToggleSwitch extends StatelessWidget {
  final ValueNotifier<ThemeMode> themeNotifier;

  const ThemeToggleSwitch({super.key, required this.themeNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (context, mode, _) {
        bool isDark = mode == ThemeMode.dark;

        return GestureDetector(
          onTap: () {
            themeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: 65,
            height: 34,
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: isDark ? Colors.grey[850] : Colors.yellow[600],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedAlign(
                  duration: const Duration(milliseconds: 300),
                  alignment:
                      isDark ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    width: 26,
                    height: 26,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark ? Colors.black : Colors.white,
                    ),
                    child: Icon(
                      isDark ? Icons.nights_stay : Icons.wb_sunny,
                      size: 18,
                      color: isDark ? Colors.white : Colors.orange[700],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




class MeterStatusPage extends StatefulWidget {
  const MeterStatusPage({super.key});

  @override
  State<MeterStatusPage> createState() => _MeterStatusPageState();
}

class _MeterStatusPageState extends State<MeterStatusPage> {
  String searchQuery = "";
  String? selectedState;
  bool showMessageButton = false;
  Map<String, String>? selectedCustomer;

  final List<String> states = ["Abuja", "Lagos", "Kano", "Enugu"];

  final List<Map<String, String>> customers = [
    {
      "name": "John Doe",
      "meter": "MTR12345",
      "mobile": "08012345678",
      "state": "Abuja",
      "lastLoaded": "2025-08-12",
      "status": "Active"
    },
    {
      "name": "Jane Smith",
      "meter": "MTR67890",
      "mobile": "08098765432",
      "state": "Lagos",
      "lastLoaded": "2025-08-10",
      "status": "Inactive"
    },
    {
      "name": "Aliyu Musa",
      "meter": "MTR11223",
      "mobile": "08011223344",
      "state": "Kano",
      "lastLoaded": "2025-08-11",
      "status": "Pending"
    },
    {
      "name": "Chika Obi",
      "meter": "MTR44556",
      "mobile": "08055667788",
      "state": "Enugu",
      "lastLoaded": "2025-08-09",
      "status": "Active"
    },
    {
      "name": "Fatima Bello",
      "meter": "MTR77889",
      "mobile": "08066778899",
      "state": "Abuja",
      "lastLoaded": "2025-08-08",
      "status": "Inactive"
    },
    {
      "name": "Emeka Okafor",
      "meter": "MTR99001",
      "mobile": "08099887766",
      "state": "Lagos",
      "lastLoaded": "2025-08-07",
      "status": "Active"
    },
    {
      "name": "Aisha Ibrahim",
      "meter": "MTR22334",
      "mobile": "08033445566",
      "state": "Kano",
      "lastLoaded": "2025-08-06",
      "status": "Pending"
    },
    {
      "name": "Tunde Adeyemi",
      "meter": "MTR55667",
      "mobile": "08044556677",
      "state": "Enugu",
      "lastLoaded": "2025-08-05",
      "status": "Active"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // current theme
    final filteredCustomers = customers.where((c) {
      final matchesName =
          c["name"]!.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesState =
          selectedState == null || c["state"] == selectedState;
      return matchesName && matchesState;
    }).toList();

    /// Status distribution for Pie Chart
    final activeCount =
        customers.where((c) => c["status"] == "Active").length.toDouble();
    final inactiveCount =
        customers.where((c) => c["status"] == "Inactive").length.toDouble();
    final abnormalCount =
        customers.where((c) => c["status"] == "Pending").length.toDouble();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Top Row with Title & Actions
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Meter Status",
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: theme.colorScheme.surface,
                          child: IconButton(
                            icon: Icon(Icons.notifications,
                                color: theme.colorScheme.onSurface),
                            onPressed: () {},
                          ),
                        ),
                        const SizedBox(width: 10),
                        const CircleAvatar(
                          backgroundImage: AssetImage("assests/some.jpg"),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),

                /// Main Content Row (Table + Chart)
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Customer List Card
                      Expanded(
                        flex: 3,
                        child: Card(
                          color: theme.cardColor,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                /// Search + Filter
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        style: theme.textTheme.bodyMedium,
                                        decoration: InputDecoration(
                                          hintText: "Search customer",
                                          prefixIcon: Icon(Icons.search,
                                              color: theme.iconTheme.color),
                                          filled: true,
                                          fillColor: theme.colorScheme.surface,
                                          border: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                          ),
                                        ),
                                        onChanged: (value) {
                                          setState(() {
                                            searchQuery = value;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    PopupMenuButton<String>(
                                      icon: Icon(Icons.filter_alt,
                                          color: theme.iconTheme.color),
                                      onSelected: (value) {
                                        setState(() {
                                          selectedState = value;
                                        });
                                      },
                                      itemBuilder: (context) => states
                                          .map((s) => PopupMenuItem(
                                                value: s,
                                                child: Text(s),
                                              ))
                                          .toList(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),

                                /// Table Header
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 8),
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.surfaceVariant,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: const [
                                      SizedBox(width: 40),
                                      Expanded(
                                          child: Text("Customer Name",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Expanded(
                                          child: Text("Meter Number",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Expanded(
                                          child: Text("Mobile Number",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Expanded(
                                          child: Text("State",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Expanded(
                                          child: Text("Last Loaded",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                      Expanded(
                                          child: Text("Status",
                                              style: TextStyle(
                                                  fontWeight:
                                                      FontWeight.bold))),
                                    ],
                                  ),
                                ),

                                const SizedBox(height: 10),

                                /// Customer Rows
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: filteredCustomers.length,
                                    itemBuilder: (context, index) {
                                      final customer =
                                          filteredCustomers[index];
                                      return InkWell(
                                        onTap: () {
                                          if (customer["status"] == "Inactive" ||
                                              customer["status"] == "Pending") {
                                            setState(() {
                                              selectedCustomer = customer;
                                              showMessageButton = true;
                                            });
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 8),
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: theme.dividerColor),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    theme.colorScheme.primary
                                                        .withOpacity(0.2),
                                                child: Text(
                                                  customer["name"]![0],
                                                  style: theme
                                                      .textTheme.bodyMedium
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              Expanded(
                                                  child: Text(
                                                      customer["name"]!,
                                                      style: theme.textTheme
                                                          .bodyMedium)),
                                              Expanded(
                                                  child: Text(
                                                      customer["meter"]!,
                                                      style: theme.textTheme
                                                          .bodyMedium)),
                                              Expanded(
                                                  child: Text(
                                                      customer["mobile"]!,
                                                      style: theme.textTheme
                                                          .bodyMedium)),
                                              Expanded(
                                                  child: Text(
                                                      customer["state"]!,
                                                      style: theme.textTheme
                                                          .bodyMedium)),
                                              Expanded(
                                                  child: Text(
                                                      customer["lastLoaded"]!,
                                                      style: theme.textTheme
                                                          .bodyMedium)),
                                              Expanded(
                                                child: Text(
                                                  customer["status"]!,
                                                  style: TextStyle(
                                                    color: customer["status"] ==
                                                            "Active"
                                                        ? Colors.green
                                                        : customer["status"] ==
                                                                "Inactive"
                                                            ? Colors.red
                                                            : Colors.orange,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      /// Pie Chart Card
                      Expanded(
                        flex: 1,
                        child: Card(
                          color: theme.cardColor,
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Status Distribution",
                                  style: theme.textTheme.titleMedium?.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 20),
                                Expanded(
                                  child: PieChart(
                                    PieChartData(
                                      sections: [
                                        PieChartSectionData(
                                          value: activeCount,
                                          color: Colors.green,
                                          title: "Active\n$activeCount",
                                          radius: 60,
                                          titleStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        PieChartSectionData(
                                          value: inactiveCount,
                                          color: Colors.red,
                                          title: "Inactive\n$inactiveCount",
                                          radius: 60,
                                          titleStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        PieChartSectionData(
                                          value: abnormalCount,
                                          color: Colors.orange,
                                          title: "Pending\n$abnormalCount",
                                          radius: 60,
                                          titleStyle: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                      ],
                                      sectionsSpace: 4,
                                      centerSpaceRadius: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          /// Floating Message Button
          if (showMessageButton)
            Positioned(
              bottom: 80,
              right: 20,
              child: FloatingActionButton.extended(
                icon: const Icon(Icons.message),
                label: const Text("Message"),
                onPressed: () {
                  setState(() {
                    showMessageButton = false;
                  });
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          "Message sent to ${selectedCustomer?["name"]} (${selectedCustomer?["status"]})",
                          style: theme.textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    },
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}




class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String? selectedState;

  // Sample user data
  final List<Map<String, String>> users = [
    {"name": "Alice Johnson", "state": "Lagos", "location": "Ikeja", "phone": "08011111111", "meter": "#12345"},
    {"name": "Michael Smith", "state": "Abuja", "location": "Garki", "phone": "08022222222", "meter": "#12346"},
    {"name": "Sarah Williams", "state": "Kano", "location": "Sabon Gari", "phone": "08033333333", "meter": "#12347"},
    {"name": "David Brown", "state": "Kaduna", "location": "Barnawa", "phone": "08044444444", "meter": "#12348"},
    {"name": "Emily Davis", "state": "Enugu", "location": "New Haven", "phone": "08055555555", "meter": "#12349"},
    {"name": "James Wilson", "state": "Rivers", "location": "Port Harcourt", "phone": "08066666666", "meter": "#12350"},
    {"name": "Grace Miller", "state": "Lagos", "location": "Lekki", "phone": "08077777777", "meter": "#12351"},
    {"name": "Daniel Taylor", "state": "Abuja", "location": "Wuse", "phone": "08088888888", "meter": "#12352"},
    {"name": "Olivia Anderson", "state": "Kano", "location": "Nassarawa", "phone": "08099999999", "meter": "#12353"},
    {"name": "Liam Thomas", "state": "Kaduna", "location": "Kawo", "phone": "08010101010", "meter": "#12354"},
    {"name": "Sophia Jackson", "state": "Enugu", "location": "GRA", "phone": "08012121212", "meter": "#12355"},
    {"name": "Mason White", "state": "Rivers", "location": "Obio-Akpor", "phone": "08013131313", "meter": "#12356"},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // 👈 Get current theme
    final isDark = theme.brightness == Brightness.dark;

    // Filter users by selected state
    final filteredUsers = selectedState == null
        ? users
        : users.where((user) => user["state"] == selectedState).toList();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          // 🔹 Top Section
          Container(
            color: theme.scaffoldBackgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Map",
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style: theme.textTheme.bodyLarge,
                        decoration: InputDecoration(
                          hintText: "Search location...",
                          prefixIcon: Icon(Icons.search, color: theme.iconTheme.color),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: isDark ? Colors.grey[850] : Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: isDark ? Colors.grey[850] : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: theme.dividerColor),
                      ),
                      child: DropdownButton<String>(
                        value: selectedState,
                        underline: const SizedBox(),
                        hint: Text("State", style: theme.textTheme.bodyLarge),
                        icon: Icon(Icons.arrow_drop_down, color: theme.iconTheme.color),
                        items: [
                          "Lagos",
                          "Abuja",
                          "Kano",
                          "Kaduna",
                          "Enugu",
                          "Rivers",
                        ]
                            .map((state) => DropdownMenuItem(
                                  value: state,
                                  child: Text(state, style: theme.textTheme.bodyLarge),
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedState = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // 🔹 Scrollable Grid
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return _buildProfileCard(
                  user["name"]!,
                  user["state"]!,
                  user["location"]!,
                  user["phone"]!,
                  user["meter"]!,
                  theme,
                  isDark,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Profile Card Widget
  Widget _buildProfileCard(
    String name,
    String state,
    String location,
    String phone,
    String meter,
    ThemeData theme,
    bool isDark,
  ) {
    return Card(
      color: theme.colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Profile Avatar
            CircleAvatar(
              radius: 28,
              backgroundColor: theme.colorScheme.primary,
              child: Text(
                name[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Name
            Text(
              name,
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Details
            _infoRow(Icons.location_city, "State: $state", theme),
            _infoRow(Icons.location_on, "Location: $location", theme),
            _infoRow(Icons.phone, phone, theme),
            _infoRow(Icons.bolt, "Meter: $meter", theme),
          ],
        ),
      ),
    );
  }

  // Info Row
  Widget _infoRow(IconData icon, String text, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
            child: Icon(icon, size: 21, color: theme.colorScheme.primary),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: theme.textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}



class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Example data
  String firstName = "John";
  String lastName = "Doe";
  String email = "johndoe@email.com";
  String bio = "A passionate developer with expertise in Flutter and Web.";
  String phone = "+234 812 345 6789";
  String address = "123 Main Street, Lagos";
  String stateOfOrigin = "Kwara";
  String state = "Lagos";
  String postalCode = "100001";
  String role = "Service Center Manager";

  void _openEditDialog(String title, List<Widget> fields, VoidCallback onSave) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit $title"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: fields,
          ),
        ),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: const Text("Save"),
            onPressed: () {
              onSave();
              Navigator.pop(context);
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    ShapeBorder outlinedShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: BorderSide(
        color: theme.colorScheme.outline.withOpacity(0.5),
        width: 1.2,
      ),
    );

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),

              // Profile Card
              Card(
                shape: outlinedShape,
                elevation: 0,
                color: theme.colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage("assets/some.jpg"),
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(firstName + " " + lastName,
                                  style: theme.textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(role, style: theme.textTheme.bodyMedium),
                              const SizedBox(height: 4),
                              Text(address, style: theme.textTheme.bodyMedium),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () {
                            final roleCtrl = TextEditingController(text: role);
                            final addrCtrl = TextEditingController(text: address);
                            _openEditDialog("Profile Info", [
                              TextField(
                                controller: roleCtrl,
                                decoration:
                                    const InputDecoration(labelText: "Role"),
                              ),
                              TextField(
                                controller: addrCtrl,
                                decoration:
                                    const InputDecoration(labelText: "Address"),
                              ),
                            ], () {
                              role = roleCtrl.text;
                              address = addrCtrl.text;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Personal Info
              Card(
                shape: outlinedShape,
                elevation: 0,
                color: theme.colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Personal Information",
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: const Text("First Name"),
                                  subtitle: Text(firstName),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: const Text("Last Name"),
                                  subtitle: Text(lastName),
                                ),
                              ),
                            ],
                          ),
                          ListTile(
                              title: const Text("Email"),
                              subtitle: Text(email)),
                          ListTile(
                              title: const Text("Bio"), subtitle: Text(bio)),
                          ListTile(
                              title: const Text("Phone"),
                              subtitle: Text(phone)),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () {
                            final fCtrl = TextEditingController(text: firstName);
                            final lCtrl = TextEditingController(text: lastName);
                            final eCtrl = TextEditingController(text: email);
                            final bCtrl = TextEditingController(text: bio);
                            final pCtrl = TextEditingController(text: phone);
                            _openEditDialog("Personal Information", [
                              TextField(
                                controller: fCtrl,
                                decoration:
                                    const InputDecoration(labelText: "First Name"),
                              ),
                              TextField(
                                controller: lCtrl,
                                decoration:
                                    const InputDecoration(labelText: "Last Name"),
                              ),
                              TextField(
                                controller: eCtrl,
                                decoration:
                                    const InputDecoration(labelText: "Email"),
                              ),
                              TextField(
                                controller: bCtrl,
                                decoration:
                                    const InputDecoration(labelText: "Bio"),
                              ),
                              TextField(
                                controller: pCtrl,
                                decoration:
                                    const InputDecoration(labelText: "Phone"),
                              ),
                            ], () {
                              firstName = fCtrl.text;
                              lastName = lCtrl.text;
                              email = eCtrl.text;
                              bio = bCtrl.text;
                              phone = pCtrl.text;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Address Card
              Card(
                shape: outlinedShape,
                elevation: 0,
                color: theme.colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address",
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold)),
                          const Divider(),
                          Row(
                            children: [
                              Expanded(
                                  child: ListTile(
                                      title: const Text("State of Origin"),
                                      subtitle: Text(stateOfOrigin))),
                              Expanded(
                                  child: ListTile(
                                      title: const Text("State"),
                                      subtitle: Text(state))),
                            ],
                          ),
                          ListTile(
                              title: const Text("Postal Code"),
                              subtitle: Text(postalCode)),
                        ],
                      ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          icon: const Icon(Icons.edit_outlined),
                          onPressed: () {
                            final soCtrl =
                                TextEditingController(text: stateOfOrigin);
                            final sCtrl = TextEditingController(text: state);
                            final pcCtrl =
                                TextEditingController(text: postalCode);
                            _openEditDialog("Address", [
                              TextField(
                                controller: soCtrl,
                                decoration: const InputDecoration(
                                    labelText: "State of Origin"),
                              ),
                              TextField(
                                controller: sCtrl,
                                decoration:
                                    const InputDecoration(labelText: "State"),
                              ),
                              TextField(
                                controller: pcCtrl,
                                decoration: const InputDecoration(
                                    labelText: "Postal Code"),
                              ),
                            ], () {
                              stateOfOrigin = soCtrl.text;
                              state = sCtrl.text;
                              postalCode = pcCtrl.text;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
