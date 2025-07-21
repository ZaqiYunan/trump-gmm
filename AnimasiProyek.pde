//// Variabel untuk menyimpan scene yang sedang aktif
//// 1 = Scene 1 (Jalan Raya)
//// 2 = Scene 2 (Warung)
//// 4 = Scene 4 (Masjid)
//int currentScene = 1;

//void setup() {
//  // Atur ukuran canvas sesuai scene yang paling baru/pas
//  size(1300, 720);
  
  

//void draw() {
//  // Gunakan if-else if untuk memilih scene mana yang akan digambar
//  // if (currentScene == 1) {
//  //   drawScene1();
//  // } else if (currentScene == 2) {
//  //   drawScene2();
//  // } else if (currentScene == 4) {
//  //   drawScene4();
//  // }
  
//  // Untuk sementara, kita hanya jalankan scene 4 karena scene lain mungkin belum ada
//  // Hapus komentar di atas jika kamu sudah punya semua file scene-nya
//  drawScene4();
//}

//void keyPressed() {
//  // Logika untuk berpindah scene dengan menekan tombol angka
//  if (key == '1') {
//    currentScene = 1;
//    println("Berpindah ke Scene 1");
//  } else if (key == '2') {
//    currentScene = 2;
//    println("Berpindah ke Scene 2");
//  } else if (key == '4') {
//    currentScene = 4;
//    println("Berpindah ke Scene 4");
//  }
  
//  // Jalankan juga fungsi keyPressed dari scene yang sedang aktif
//  // Ini agar tombol seperti 'r' atau 'n' tetap berfungsi di scene masing-masing
//  // if (currentScene == 1) {
//  //   keyPressedScene1();
//  // } else if (currentScene == 2) {
//  //   keyPressedScene2();
//  // } else if (currentScene == 4) {
//  //   keyPressedScene4();
//  // }
//}
