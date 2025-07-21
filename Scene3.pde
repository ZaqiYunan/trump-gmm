//// Faktor skala untuk menyesuaikan elemen dari ukuran 800x600 ke 1300x720
//float scaleX = 1300.0 / 800.0;
//float scaleY = 720.0 / 600.0;
//PImage ustadDiam;
//PImage remajaDiam;

//void setup() {
//  size(1300, 720); // Ukuran kanvas baru
//  frameRate(30);
//  noStroke();
//  ustadDiam = loadImage("assets/characters/UstadDiam.png");
//  remajaDiam = loadImage("assets/characters/Remaja.png"); 

//}

//void draw() {
//  drawScene3();
//}

//// =========================
////      SCENE 3 FINAL
//// =========================
//void drawScene3() {
//  background(#79D2F6);
//  drawMovingClouds();

//  drawTexturedGround();
//  // Posisi setiap elemen disesuaikan dengan faktor skala
//  drawWarungScene2Style(100 * scaleX, 250 * scaleY);
//  drawTreeLarge(500 * scaleX, 210 * scaleY);   // Pohon utama
//  drawTreeLarge(650 * scaleX, 220 * scaleY);   // Pohon kanan
//  drawPot(630 * scaleX, 420 * scaleY);
//  drawBench(550 * scaleX, 430 * scaleY);
  
//  // TAMBAHKAN BARIS INI DI AKHIR FUNGSI
//  drawChattingCharacters();
//}

//// =========================
////       TEKSTUR TANAH
//// =========================
//void drawTexturedGround() {
//  // Tanah coklat terang (posisi Y dan tinggi disesuaikan)
//  fill(#AD8555);
//  rect(0, 400 * scaleY, width, 50 * scaleY);

//  // Guratan tanah terang bergelombang
//  stroke(120, 80, 50);
//  noFill();
//  for (int i = 0; i < width; i += (80 * scaleX)) {
//    beginShape();
//    for (int j = 0; j <= (80 * scaleX); j += 10) {
//      // Posisi Y dan amplitudo gelombang disesuaikan
//      float y = (410 * scaleY) + sin(radians(j * 10 / scaleX + i)) * (3 * scaleY);
//      vertex(i + j, y);
//    }
//    endShape();
//  }

//  // Tanah coklat gelap
//  fill(#814C26);
//  noStroke();
//  rect(0, 450 * scaleY, width, 150 * scaleY);

//  // Guratan tanah gelap bergelombang
//  stroke(90, 50, 30);
//  noFill();
//  for (int i = 0; i < width; i += (100 * scaleX)) {
//    beginShape();
//    for (int j = 0; j <= (100 * scaleX); j += 10) {
//      float y = (470 * scaleY) + sin(radians(j * 10 / scaleX + i)) * (4 * scaleY);
//      vertex(i + j, y);
//    }
//    endShape();
//  }
//  noStroke();
//}


//// =================================================================
////                 BAGIAN WARUNG (TELAH DIPERBARUI)
//// =================================================================
//void drawWarungScene2Style(float x, float y) {
//  float s = scaleX; // Faktor skala untuk menjaga proporsi

//  // =================================================
//  // ==  INI BAGIAN TEMBOK ORANYE YANG DITAMBAHKAN  ==
//  fill(#A0521D); // Warna dasar oranye/coklat-merah
//  rect(x, y, 300 * s, 150 * s);
//  // =================================================

//  // === Palet Warna (Gaya Pixel Coklat) ===
//  color roofColor = color(#6B4E31);
//  color wallColor = color(#D8B48A);
//  color textColor = color(#4E2A00);
//  color fishColor = color(#8B5A2B);
//  color accentColor = color(#7A3E00);
//  color stoolColor = color(#5C2E10);
//  color lineColor = color(30, 30, 30);

//  // ==== Atap ====
//  fill(roofColor);
//  noStroke();
//  rect(x + 10 * s, y + 10 * s, 280 * s, 25 * s);

//  // ==== Dinding Depan ====
//  fill(wallColor);
//  rect(x + 20 * s, y + 35 * s, 260 * s, 80 * s);

//  // ==== Teks Warung ====
//  fill(textColor);
//  textFont(createFont("Arial", 14 * s)); // Ukuran font juga diskalakan
//  textAlign(LEFT, TOP);
//  text("WARUNG", x + 100 * s, y + 50 * s);
//  text("SIMBOK", x + 110 * s, y + 70 * s);

//  // ==== Label Samping: ESTEH & 01 ====
//  fill(accentColor);
//  textFont(createFont("Arial", 8 * s));
//  text("ESTEH", x + 30 * s, y + 50 * s);
//  text("01", x + 230 * s, y + 50 * s);

//  // ==== Dekorasi Ikan ====
//  fill(fishColor);
//  // Ikan kiri
//  rect(x + 40 * s, y + 65 * s, 15 * s, 6 * s);
//  rect(x + 35 * s, y + 70 * s, 10 * s, 5 * s);
//  // Ikan kanan
//  rect(x + 215 * s, y + 65 * s, 15 * s, 6 * s);
//  rect(x + 230 * s, y + 70 * s, 10 * s, 5 * s);

//  // ==== Meja (Pagar) ====
//  fill(wallColor);
//  rect(x + 30 * s, y + 100 * s, 240 * s, 20 * s);

//  // Garis vertikal pagar
//  stroke(lineColor);
//  strokeWeight(1 * s);
//  for (int i = 0; i <= 8; i++) {
//    float lineX = x + 40 * s + i * 25 * s;
//    line(lineX, y + 100 * s, lineX, y + 120 * s);
//  }
//  noStroke();

//  // ==== Bangku Kecil (Stools) ====
//  fill(stoolColor);
//  for (int i = 0; i < 5; i++) {
//    float sx = x + 45 * s + i * 45 * s;
//    rect(sx, y + 125 * s, 12 * s, 5 * s);    // dudukan
//    rect(sx + 4 * s, y + 130 * s, 4 * s, 10 * s); // kaki
//  }
//}


//// =========================
////         POHON BESAR
//// =========================
//void drawTreeLarge(float x, float y) {
//  float s = scaleX; // Gunakan satu faktor skala untuk menjaga proporsi
//  fill(#5C3317);
//  rect(x, y + (100 * s), 30 * s, 120 * s); // batang tinggi
//  fill(#99CC33);
//  ellipse(x + (15 * s), y + (50 * s), 140 * s, 140 * s);
//  fill(#77AA22);
//  ellipse(x - (30 * s), y + (70 * s), 100 * s, 100 * s);
//  ellipse(x + (50 * s), y + (70 * s), 100 * s, 100 * s);
//}

//// =========================
////         POT BUNGA
//// =========================
//void drawPot(float x, float y) {
//  float s = scaleX;
//  fill(#B97A57);
//  rect(x, y, 30 * s, 20 * s);
//  fill(#228B22);
//  ellipse(x + (15 * s), y, 35 * s, 20 * s);
//}

//// =========================
////          BANGKU
//// =========================
//void drawBench(float x, float y) {
//  float s = scaleX;
//  fill(#654321);
//  rect(x, y, 60 * s, 10 * s);
//  rect(x + (5 * s), y + (10 * s), 5 * s, 10 * s);
//  rect(x + (50 * s), y + (10 * s), 5 * s, 10 * s);
//}

//// =========================
////       AWAN BERGERAK
//// =========================
//void drawMovingClouds() {
//  float s = scaleX;
//  float spacing = 200 * s;
//  for (int i = 0; i < 4; i++) {
//    float cloudX = (frameCount * 0.5 * s + i * spacing) % (width + 150 * s) - (100 * s);
//    drawCloud(cloudX, (100 + i * 15) * scaleY);
//  }
//}

//void drawCloud(float x, float y) {
//  float s = scaleX;
//  fill(255);
//  ellipse(x, y, 60 * s, 40 * s);
//  ellipse(x + (25 * s), y + (5 * s), 50 * s, 30 * s);
//  ellipse(x - (25 * s), y + (5 * s), 50 * s, 30 * s);
//}

//// =========================
////      KARAKTER NGOBROL
//// =========================
//void drawChattingCharacters() {
//  // ATUR SKALA MASING-MASING KARAKTER SECARA TERPISAH
//  float ustadScale = 0.8;  // Skala untuk Ustad
//  float remajaScale = 0.2; // Skala untuk Remaja (dibuat lebih kecil)
  
//  // === MENGGAMBAR USTAD (Menghadap Kanan) ===
//  // Tentukan posisi Ustad
//  float ustadX = 280 * scaleX;
//  float ustadY = 350 * scaleY; // POSISI Y DINAIKKAN (angka lebih kecil = lebih ke atas)
//  // Tentukan ukuran gambar Ustad dengan skalanya sendiri
//  float ustadWidth = ustadDiam.width * scaleX * ustadScale;
//  float ustadHeight = ustadDiam.height * scaleY * ustadScale;
  
//  // Gambar Ustad seperti biasa
//  image(ustadDiam, ustadX, ustadY, ustadWidth, ustadHeight);

//  // === MENGGAMBAR REMAJA (Dibalik/Flip agar Menghadap Kiri) ===
//  // Tentukan posisi Remaja
//  float remajaX = 360 * scaleX;
//  float remajaY = 360 * scaleY; // POSISI Y DINAIKKAN (disamakan dengan Ustad)
//  // Tentukan ukuran gambar Remaja dengan skalanya sendiri
//  float remajaWidth = remajaDiam.width * scaleX * remajaScale;
//  float remajaHeight = remajaDiam.height * scaleY * remajaScale;
  
//  pushMatrix();
//  translate(remajaX + remajaWidth, remajaY); 
//  scale(-1, 1);
//  image(remajaDiam, 0, 0, remajaWidth, remajaHeight);
//  popMatrix();
//}
