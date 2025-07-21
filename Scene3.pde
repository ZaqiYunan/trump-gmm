//// Faktor skala untuk menyesuaikan elemen dari ukuran 800x600 ke 1300x720
//float scaleX = 1300.0 / 800.0;
//float scaleY = 720.0 / 600.0;
//PImage ustadDiam, ustadKanan, ustadKiri;
//PImage remajaDiam, remajaKanan, remajaKiri;
//PImage remajaIdle2;

//// ===============================================
//// == PERCAKAPAN DIPERPANJANG UNTUK DURASI 1 MENIT ==
//// ===============================================
//String[] speechTexts = {
//  "Assalamualaikum. Ayo, kita shalat berjamaah di masjid. Adzan sudah berkumandang...", // Ustad
//  "Wa'alaikumsalam. Aduh Pak Ustad, sebentar lagi ya, saya lapar sekali, belum makan.", // Remaja
//  "Justru itu, ayo kita sholat dulu. Nanti setelah sholat, urusan makan saya yang traktir.", // Ustad
//  "Wah, beneran nih Pak Ustad? Asyik dong!", // Remaja
//  "Tentu saja. Shalat itu tiang agama, lebih utama dari urusan dunia. Setelah itu, makanannya jadi lebih berkah.", // Ustad
//  "Hmm, benar juga ya Pak Ustad. Perut lapar, tapi panggilan Allah jauh lebih penting.", // Remaja
//  "Alhamdulillah. Itu baru pemuda yang hebat. Allah pasti suka. Yuk, kita berangkat sekarang.", // Ustad
//  "Siap, Pak! Baiklah, mari kita berangkat!" // Remaja
//};
//String[] speakers = {
//  "Ustad",
//  "Remaja",
//  "Ustad",
//  "Remaja",
//  "Ustad",
//  "Remaja",
//  "Ustad",
//  "Remaja"
//};
//int currentSpeechIndex = 0;
//int lastSpeechChange = 0;
//int typingSpeed = 65; // milidetik per karakter
//int charsToShow = 0;
//int fadeDuration = 500; // milidetik untuk fade in/out
//int displayTime = 3000; // Waktu menampilkan teks penuh sebelum fade out (sedikit diperpanjang)
//int boxAlpha = 0;
//boolean dialogueFinished = false;

//// Variabel animasi
//float remajaX = 270 * scaleX;
//float remajaIdle2X = 240 * scaleX;
//boolean remajaBerjalan = false;
//float ustadX = 130 * scaleX;

//ArrayList<Bird> birds;


//void setup() {
//  size(1300, 720);
//  frameRate(30);
//  noStroke();

//  // Muat semua gambar...
//  ustadDiam = loadImage("assets/characters/UstadDiam.png");
//  ustadKanan = loadImage("assets/characters/UstadKanan.png");
//  ustadKiri = loadImage("assets/characters/UstadKiri.png");
//  remajaDiam = loadImage("assets/characters/Remaja.png");
//  remajaIdle2 = loadImage("assets/characters/remaja_idle2.png");
//  remajaKanan = loadImage("assets/characters/RemajaKanan.png");
//  remajaKiri = loadImage("assets/characters/RemajaKiri.png");

//  if (ustadDiam == null) println("Gagal load UstadDiam.png");
//  if (ustadKanan == null) println("Gagal load UstadKanan.png");
//  if (ustadKiri == null) println("Gagal load UstadKiri.png");
//  if (remajaDiam == null) println("Gagal load Remaja.png");
//  if (remajaIdle2 == null) println("Gagal load remaja_idle2.png");
//  if (remajaKanan == null) println("Gagal load RemajaKanan.png");
//  if (remajaKiri == null) println("Gagal load RemajaKiri.png");

//  // Inisialisasi burung-burung
//  birds = new ArrayList<Bird>();
//  for (int i = 0; i < 7; i++) {
//    birds.add(new Bird(random(width), random(50, 250)));
//  }
//}

//void draw() {
//  drawScene3();

//  // Hanya proses dialog jika belum selesai
//  if (!dialogueFinished) {
//    handleDialogue();
//  }

//  // Jika dialog selesai, karakter mulai berjalan
//  if (dialogueFinished) {
//    remajaBerjalan = true;
//  }
//}

//void handleDialogue() {
//  if (currentSpeechIndex >= speechTexts.length) {
//    dialogueFinished = true;
//    boxAlpha = 0;
//    return;
//  }

//  String currentText = speechTexts[currentSpeechIndex];
//  int totalChars = currentText.length();
//  int elapsed = millis() - lastSpeechChange;

//  int typingTime = totalChars * typingSpeed;
//  int fadeOutStart = fadeDuration + typingTime + displayTime;
//  int fadeOutEnd = fadeOutStart + fadeDuration;

//  if (elapsed < fadeDuration) {
//    boxAlpha = int(map(elapsed, 0, fadeDuration, 0, 255));
//    charsToShow = 0;
//  } else if (elapsed < fadeDuration + typingTime) {
//    boxAlpha = 255;
//    charsToShow = (elapsed - fadeDuration) / typingSpeed;
//  } else if (elapsed < fadeOutStart) {
//    boxAlpha = 255;
//    charsToShow = totalChars;
//  } else if (elapsed < fadeOutEnd) {
//    boxAlpha = int(map(elapsed, fadeOutStart, fadeOutEnd, 255, 0));
//    charsToShow = totalChars;
//  } else {
//    currentSpeechIndex++;
//    lastSpeechChange = millis();
//    boxAlpha = 0;
//    if (currentSpeechIndex >= speechTexts.length) {
//      dialogueFinished = true;
//    }
//  }

//  if (boxAlpha > 0) {
//    drawSpeechBox(
//      speakers[currentSpeechIndex],
//      currentText.substring(0, min(charsToShow, totalChars)),
//      300, height - 120 - 40, 700, 120,
//      boxAlpha
//    );
//  }
//}

//void drawSpeechBox(String speaker, String text, int x, int y, int w, int h, int alpha) {
//  fill(20, 22, 40, alpha);
//  stroke(80, 80, 120, alpha);
//  strokeWeight(4);
//  rect(x, y, w, h, 0);

//  int cornerSize = 12;
//  fill(60, 60, 100, alpha);
//  noStroke();
//  rect(x, y, cornerSize, cornerSize);
//  rect(x + w - cornerSize, y, cornerSize, cornerSize);
//  rect(x, y + h - cornerSize, cornerSize, cornerSize);
//  rect(x + w - cornerSize, y + h - cornerSize, cornerSize, cornerSize);

//  fill(150, 150, 200, alpha);
//  textAlign(LEFT, TOP);
//  textSize(24);
//  text(speaker, x + 20, y + 10);

//  fill(255, alpha);
//  textSize(20);
//  textLeading(28);
//  text(text, x + 20, y + 50, w - 40, h - 60);
//}


//void drawScene3() {
//  // Ganti background polos dengan gradasi langit magrib
//  drawGradientSky();
  
//  drawFlyingBirds();
//  drawMovingClouds();
//  drawTexturedGround();
//  drawWarungScene2Style(100 * scaleX, 250 * scaleY);
//  drawTreeLarge(500 * scaleX, 210 * scaleY);
//  drawTreeLarge(650 * scaleX, 220 * scaleY);
//  drawPot(630 * scaleX, 420 * scaleY);
//  drawBench(550 * scaleX, 430 * scaleY);
//  drawChattingCharacters();
//}

//// ===============================================
//// == FUNGSI BARU UNTUK MENGGAMBAR LANGIT MAGRIB ==
//// ===============================================
//void drawGradientSky() {
//  color colorAtas = color(100, 150, 220);     // 更明亮的蓝色上部
//  color colorBawah = color(255, 180, 70);    // 柔和的橙色下部
//  int horizonY = (int)(height * 0.6);       // 保持地平线位置

//  for (int y = 0; y < horizonY; y++) {
//    float inter = map(y, 0, horizonY, 0, 1);
//    color c = lerpColor(colorAtas, colorBawah, inter);
//    stroke(c);
//    line(0, y, width, y);
//  }

//  noStroke();
//}


//void drawChattingCharacters() {
//  float ustadScale = 0.8;
//  float remajaScale = 0.2;
//  float remajaWidth = remajaDiam != null ? remajaDiam.width * scaleX * remajaScale : 0;
//  float remajaHeight = remajaDiam != null ? remajaDiam.height * scaleY * remajaScale : 0;

//  if (remajaBerjalan) {
//    remajaX += 3;
//    remajaIdle2X += 3;
//    ustadX += 3;
//  }
  
//  float remajaIdle2Y = 360 * scaleY;
//  float ustadY = 320 * scaleY;
//  float remajaY = 360 * scaleY;

//  if (remajaIdle2 != null) {
//    pushMatrix();
//    if (remajaBerjalan) {
//      PImage remajaStep = (frameCount / 10) % 2 == 0 ? remajaKanan : remajaKiri;
//      translate(remajaIdle2X, remajaIdle2Y);
//      scale(1, 1);
//      image(remajaStep, 0, 0, remajaWidth, remajaHeight);
//    } else {
//      translate(remajaIdle2X + remajaWidth, remajaIdle2Y);
//      scale(-1, 1);
//      image(remajaIdle2, 0, 0, remajaWidth, remajaHeight);
//    }
//    popMatrix();
//  }

//  float ustadWidth = ustadDiam != null ? ustadDiam.width * scaleX * ustadScale : 0;
//  float ustadHeight = ustadDiam != null ? ustadDiam.height * scaleY * ustadScale : 0;
//  if (ustadDiam != null) {
//    pushMatrix();
//    translate(ustadX, ustadY);
//    if (remajaBerjalan) {
//      PImage ustadStep = (frameCount / 10) % 2 == 0 ? ustadKanan : ustadKiri;
//      scale(1, 1);
//      image(ustadStep, 0, 0, ustadWidth, ustadHeight);
//    } else {
//      scale(1, 1);
//      image(ustadDiam, 0, 0, ustadWidth, ustadHeight);
//    }
//    popMatrix();
//  }

//  if (remajaDiam != null) {
//    pushMatrix();
//    if (remajaBerjalan) {
//      PImage remajaStep = (frameCount / 10) % 2 == 0 ? remajaKanan : remajaKiri;
//      translate(remajaX, remajaY);
//      scale(1, 1);
//      image(remajaStep, 0, 0, remajaWidth, remajaHeight);
//    } else {
//      translate(remajaX + remajaWidth, remajaY);
//      scale(-1, 1);
//      image(remajaDiam, 0, 0, remajaWidth, remajaHeight);
//    }
//    popMatrix();
//  }
//}

//void drawTexturedGround() {
//  fill(#AD8555);
//  rect(0, 400 * scaleY, width, 50 * scaleY);
//  stroke(120, 80, 50);
//  noFill();
//  for (int i = 0; i < width; i += (80 * scaleX)) {
//    beginShape();
//    for (int j = 0; j <= (80 * scaleX); j += 10) {
//      float y = (410 * scaleY) + sin(radians(j * 10 / scaleX + i)) * (3 * scaleY);
//      vertex(i + j, y);
//    }
//    endShape();
//  }
//  fill(#814C26);
//  noStroke();
//  rect(0, 450 * scaleY, width, 150 * scaleY);
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

//void drawWarungScene2Style(float x, float y) {
//  float s = scaleX;
//  fill(#A0521D);
//  rect(x, y, 300 * s, 150 * s);
//  color roofColor = color(#6B4E31);
//  color wallColor = color(#D8B48A);
//  color textColor = color(#4E2A00);
//  color fishColor = color(#8B5A2B);
//  color accentColor = color(#7A3E00);
//  color stoolColor = color(#5C2E10);
//  color lineColor = color(30, 30, 30);
//  fill(roofColor);
//  noStroke();
//  rect(x + 10 * s, y + 10 * s, 280 * s, 25 * s);
//  fill(wallColor);
//  rect(x + 20 * s, y + 35 * s, 260 * s, 80 * s);
//  fill(textColor);
//  textFont(createFont("Arial", 14 * s));
//  textAlign(LEFT, TOP);
//  text("WARUNG", x + 100 * s, y + 50 * s);
//  text("SIMBOK", x + 110 * s, y + 70 * s);
//  fill(accentColor);
//  textFont(createFont("Arial", 8 * s));
//  text("ESTEH", x + 30 * s, y + 50 * s);
//  text("01", x + 230 * s, y + 50 * s);
//  fill(fishColor);
//  rect(x + 40 * s, y + 65 * s, 15 * s, 6 * s);
//  rect(x + 35 * s, y + 70 * s, 10 * s, 5 * s);
//  rect(x + 215 * s, y + 65 * s, 15 * s, 6 * s);
//  rect(x + 230 * s, y + 70 * s, 10 * s, 5 * s);
//  fill(wallColor);
//  rect(x + 30 * s, y + 100 * s, 240 * s, 20 * s);
//  stroke(lineColor);
//  strokeWeight(1 * s);
//  for (int i = 0; i <= 8; i++) {
//    float lineX = x + 40 * s + i * 25 * s;
//    line(lineX, y + 100 * s, lineX, y + 120 * s);
//  }
//  noStroke();
//  fill(stoolColor);
//  for (int i = 0; i < 5; i++) {
//    float sx = x + 45 * s + i * 45 * s;
//    rect(sx, y + 125 * s, 12 * s, 5 * s);
//    rect(sx + 4 * s, y + 130 * s, 4 * s, 10 * s);
//  }
//}

//void drawTreeLarge(float x, float y) {
//  float s = scaleX;
//  fill(#5C3317);
//  rect(x, y + (100 * s), 30 * s, 120 * s);
//  fill(#99CC33);
//  ellipse(x + (15 * s), y + (50 * s), 140 * s, 140 * s);
//  fill(#77AA22);
//  ellipse(x - (30 * s), y + (70 * s), 100 * s, 100 * s);
//  ellipse(x + (50 * s), y + (70 * s), 100 * s, 100 * s);
//}

//void drawPot(float x, float y) {
//  float s = scaleX;
//  fill(#B97A57);
//  rect(x, y, 30 * s, 20 * s);
//  fill(#228B22);
//  ellipse(x + (15 * s), y, 35 * s, 20 * s);
//}

//void drawBench(float x, float y) {
//  float s = scaleX;
//  fill(#654321);
//  rect(x, y, 60 * s, 10 * s);
//  rect(x + (5 * s), y + (10 * s), 5 * s, 10 * s);
//  rect(x + (50 * s), y + (10 * s), 5 * s, 10 * s);
//}

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
//  // Warna awan diubah menjadi putih hangat agar sesuai dengan cahaya senja
//  color cloudColor = color(255, 245, 230, 200);
//  fill(cloudColor);
//  noStroke();
//  ellipse(x, y, 60 * s, 40 * s);
//  ellipse(x + (25 * s), y + (5 * s), 50 * s, 30 * s);
//  ellipse(x - (25 * s), y + (5 * s), 50 * s, 30 * s);
//}

//void drawFlyingBirds() {
//  for (Bird b : birds) {
//    b.update();
//    b.display();
//  }
//}

//class Bird {
//  PVector position;
//  PVector velocity;
//  float size;
//  int flapSpeed;
  
//  Bird(float x, float y) {
//    position = new PVector(x, y);
//    velocity = new PVector(random(-3.5, -1.5), random(-0.5, 0.5));
//    size = random(8, 15);
//    flapSpeed = int(random(5, 10));
//  }

//  void update() {
//    position.add(velocity);
//    if (position.x < -size * 2) {
//      position.x = width + size * 2;
//      position.y = random(50, 250);
//    }
//  }

//  void display() {
//    // Burung menjadi siluet gelap karena melawan cahaya matahari terbenam
//    fill(50, 50, 50); 
//    noStroke();
    
//    pushMatrix();
//    translate(position.x, position.y);
    
//    float angle = sin(frameCount * 0.5 / flapSpeed) * PI / 6;
    
//    beginShape();
//    vertex(0, 0);
//    vertex(-size, -size/3 + angle * 5);
//    vertex(-size * 0.8, 0);
//    endShape(CLOSE);
    
//    beginShape();
//    vertex(0, 0);
//    vertex(-size, size/3 - angle * 5);
//    vertex(-size * 0.8, 0);
//    endShape(CLOSE);
    
//    popMatrix();
//  }
//}
