class AppLatLong {
  const AppLatLong({
    this.lat = 55.755863,
    this.long = 37.617700,
  });
  final double lat;
  final double long;
}

class MoscowLocation extends AppLatLong {
  const MoscowLocation({
    super.lat = 55.755863,
    super.long = 37.617700,
  });
}
