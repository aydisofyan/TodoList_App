
class Tugas {
  String? id;
  String? tekstugas;
  bool isDone;

  Tugas({required this.id, required this.tekstugas, this.isDone = false});

  static List<Tugas> TugasItem() {
    return [
      Tugas(id: '01', tekstugas: 'Menyapu Rumah', isDone: true),
      Tugas(id: '02', tekstugas: 'Nyiram Tanaman', isDone: true),
      Tugas(id: '03', tekstugas: 'Cuci baju'),
      Tugas(id: '04', tekstugas: 'Tugas Mobile '),
      Tugas(id: '05', tekstugas: 'Sholat dzuhur'),
    ];
  }
}
