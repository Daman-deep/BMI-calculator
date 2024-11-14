Widget _buildSlider(String label, double value, double min, double max,
    Function(double) onChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$label: ${value.toStringAsFixed(1)}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
      ),
      Slider(
        value: value,
        min: min,
        max: max,
        divisions: (max - min).toInt(),
        label: value.toStringAsFixed(1),
        onChanged: onChanged,
        activeColor: Colors.teal,
      ),
    ],
  );
}
}