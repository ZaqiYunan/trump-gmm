//// Faktor skala untuk menyesuaikan elemen dari ukuran 800x600 ke 1300x720
//float scaleX = 1300.0 / 800.0;
//float scaleY = 720.0 / 600.0;

//void setup() {
//  size(1300, 720); // Ukuran kanvas baru
//  // noLoop(); // Dihapus agar bisa ditambahkan animasi di kemudian hari jika perlu
//}

//void draw() {
//  background(#EAEAEA); // Warna dinding lembut

//  drawMihrab();
//  drawCarpet();
//  drawHangingLamp();
//  drawWallDecor();
//  drawWindows();
//}

//// =======================
//// MIHRAB (LEKUKAN IMAM)
//// =======================
//void drawMihrab() {
//  // Menggunakan skala X untuk menjaga proporsi ketebalan
//  float s = scaleX; 
  
//  fill(#D4AF37); // warna emas
//  stroke(0);
//  strokeWeight(2 * s); // Ketebalan garis disesuaikan
//  beginShape();
//  // Semua posisi vertex disesuaikan dengan faktor skala
//  vertex(350 * scaleX, 300 * scaleY);
//  bezierVertex(350 * scaleX, 200 * scaleY, 450 * scaleX, 200 * scaleY, 450 * scaleX, 300 * scaleY);
//  vertex(450 * scaleX, 450 * scaleY);
//  vertex(350 * scaleX, 450 * scaleY);
//  endShape(CLOSE);
//}

//// =======================
//// KARPET MERAH
//// =======================
//void drawCarpet() {
//  float s = scaleX;
//  noStroke();
//  fill(#B22222); // merah karpet
//  // Posisi dan ukuran karpet disesuaikan
//  rect(0, 450 * scaleY, width, 150 * scaleY);

//  // Garis putih karpet
//  stroke(255);
//  strokeWeight(2 * s);
//  // Jarak antar garis disesuaikan
//  for (int i = (int)(50 * s); i < width; i += (int)(100 * s)) {
//    line(i, 450 * scaleY, i, height);
//  }
//}

//// =======================
//// LAMPU GANTUNG
//// =======================
//void drawHangingLamp() {
//  float s = scaleX; // Gunakan satu faktor skala agar tidak lonjong
  
//  stroke(0);
//  strokeWeight(4 * s);
//  line(width/2, 0, width/2, 120 * s); // Tali lampu disesuaikan

//  fill(#FFD700); // warna lampu emas
//  noStroke();
//  ellipse(width/2, 140 * s, 100 * s, 60 * s); // Ukuran lampu disesuaikan
//  fill(255, 255, 150);
//  ellipse(width/2, 140 * s, 60 * s, 30 * s); // bagian terang
//}

//// =======================
//// ORNAMEN DINDING
//// =======================
//void drawWallDecor() {
//  fill(#A0522D);
//  textAlign(CENTER, CENTER); // Mengatur alignment agar lebih presisi
//  textSize(24 * scaleX); // Ukuran teks disesuaikan
  
//  // Posisi teks disesuaikan
//  text("اللّه", 200 * scaleX, 200 * scaleY);
//  text("محمد", 600 * scaleX, 200 * scaleY);
//}

//// =======================
//// JENDELA MELENGKUNG
//// =======================
//void drawWindows() {
//  float s = scaleX; // Gunakan satu faktor skala untuk menjaga proporsi
  
//  fill(#ADD8E6); // biru langit
//  stroke(0);
//  strokeWeight(2 * s);
  
//  // Jendela kiri (posisi dan ukuran disesuaikan)
//  arc(150 * s, 300 * scaleY, 60 * s, 120 * s, PI, TWO_PI);
//  rect(120 * s, 300 * scaleY, 60 * s, 100 * scaleY);

//  // Jendela kanan (posisi dan ukuran disesuaikan)
//  arc(650 * s, 300 * scaleY, 60 * s, 120 * s, PI, TWO_PI);
//  rect(620 * s, 300 * scaleY, 60 * s, 100 * scaleY);
//}
