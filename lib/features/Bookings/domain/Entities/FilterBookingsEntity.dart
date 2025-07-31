class FilterBookingsEntity {
  String? status, bookingID;
  DateTime? startDate, endDate;
  bool? isCreatedAtDescending;
  FilterBookingsEntity({
    this.status,
    this.startDate,
    this.endDate,
    this.isCreatedAtDescending,
    this.bookingID,
  });
}
