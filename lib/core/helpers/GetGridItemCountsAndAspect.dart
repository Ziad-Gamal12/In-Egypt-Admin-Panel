// ignore_for_file: file_names

double getItemAspectRatio(double maxWidth) {
  int crossAxisCount = getCrossAxisCount(maxWidth);
  double spacing = 16;
  double totalSpacing = spacing * (crossAxisCount - 1);
  double itemWidth = (maxWidth - totalSpacing) / crossAxisCount;

  double itemHeight = itemWidth * 1.3;
  return itemWidth / itemHeight;
}

int getCrossAxisCount(double maxWidth) {
  if (maxWidth >= 1200) return 5;
  if (maxWidth >= 900) return 4;
  if (maxWidth >= 600) return 3;
  return 2; // For phones
}
