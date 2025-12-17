class FamousCity {
  final String name;
  final double lat;
  final double lon;

  const FamousCity({required this.name, required this.lat, required this.lon});
}

// List of famous cities as a constant
List<FamousCity> famousCities = const [
  // --- India (Major Cities) ---
  FamousCity(name: 'Bengaluru', lat: 12.9716, lon: 77.5946),
  FamousCity(name: 'Mysuru', lat: 12.2958, lon: 76.6394),
  FamousCity(name: 'Shivamogga', lat: 13.9299, lon: 75.5681),
  // FamousCity(name: 'Mangalore', lat: 12.9141, lon: 74.8560),
  FamousCity(name: 'Hyderabad', lat: 17.3850, lon: 78.4867),
  FamousCity(name: 'Chennai', lat: 13.0827, lon: 80.2707),
  FamousCity(name: 'Mumbai', lat: 19.0760, lon: 72.8777),
  FamousCity(name: 'New Delhi', lat: 28.5833, lon: 77.2),
  FamousCity(name: 'Pune', lat: 18.5204, lon: 73.8567),
  FamousCity(name: 'Kolkata', lat: 22.5726, lon: 88.3639),
  FamousCity(name: 'Ahmedabad', lat: 23.0225, lon: 72.5714),

  // --- Karnataka  ---
  FamousCity(name: 'Hubballi', lat: 15.3647, lon: 75.1240),
  FamousCity(name: 'Belagavi', lat: 15.8497, lon: 74.4977),
  FamousCity(name: 'Ballari', lat: 15.1394, lon: 76.9214),
  FamousCity(name: 'Udupi', lat: 13.3409, lon: 74.7421),
  FamousCity(name: 'Hassan', lat: 13.0033, lon: 76.1020),

  // --- Global (Popular Cities) ---
  FamousCity(name: 'Tokyo', lat: 35.6833, lon: 139.7667),
  FamousCity(name: 'Paris', lat: 48.8566, lon: 2.3522),
  FamousCity(name: 'London', lat: 51.5074, lon: -0.1278),
  FamousCity(name: 'New York', lat: 40.7128, lon: -74.0060),
  FamousCity(name: 'Dubai', lat: 25.2048, lon: 55.2708),
  FamousCity(name: 'Singapore', lat: 1.3521, lon: 103.8198),
];
