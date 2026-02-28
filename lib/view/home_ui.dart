import 'package:flutter/material.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  double totalFare = 0.00;
  TextEditingController distanceController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  void calculateTaxi() {
    double distance = double.tryParse(distanceController.text) ?? 0;

    double time = double.tryParse(timeController.text) ?? 0;

    double fare = 35;

    if (distance > 1) {
      double remain = distance - 1;

      // 1 - 10 km
      if (remain > 0) {
        double step = remain > 10 ? 10 : remain;
        fare += step * 6.5;
        remain -= step;
      }

      // 10 - 20 km
      if (remain > 0) {
        double step = remain > 10 ? 10 : remain;
        fare += step * 7;
        remain -= step;
      }

      // 20 - 40 km
      if (remain > 0) {
        double step = remain > 20 ? 20 : remain;
        fare += step * 8;
        remain -= step;
      }

      // 40 - 60 km
      if (remain > 0) {
        double step = remain > 20 ? 20 : remain;
        fare += step * 8.5;
        remain -= step;
      }

      // 60 - 80 km
      if (remain > 0) {
        double step = remain > 20 ? 20 : remain;
        fare += step * 9;
        remain -= step;
      }

      // มากกว่า 80
      if (remain > 0) {
        fare += remain * 10.5;
      }
    }

    // รถติด
    fare += time * 3;

    setState(() {
      totalFare = fare;
    });
  }

  void clearData() {
    distanceController.clear();
    timeController.clear();

    setState(() {
      totalFare = 0.00;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: SafeArea(
        child: Center(
          child: Container(
            width: 330,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  "assets/images/taxi.png",
                  height: 200,
                ),
                const SizedBox(height: 5),
                const Text(
                  "คำนวณค่าแท็กซี่",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      TextField(
                        controller: distanceController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "ระยะทาง (กิโลเมตร)",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: timeController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "เวลา (นาที)",
                          filled: true,
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: calculateTaxi,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff1ABC9C),
                              ),
                              child: const Text("คำนวณ"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: clearData,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Text("ล้าง"),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xff2C3E50),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        "ค่าบริการทั้งหมด",
                        style: TextStyle(color: Colors.white70),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        totalFare.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 34,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "บาท",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
