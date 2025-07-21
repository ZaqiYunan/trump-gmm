//import processing.sound.*;

//// 2. Deklarasi variabel untuk DUA file suara
//SoundFile musikPagi;
//SoundFile suaraBurung;
//PGraphics backgroundLayer;
//ArrayList<Cloud> clouds = new ArrayList<Cloud>();
//ArrayList<Star> stars = new ArrayList<Star>();
//Character ustad;
//Character remaja;
//float ustadStopX = 600;   // Posisi berhenti Ustad
//float remajaStopX = 550;  // Posisi berhenti Remaja
//boolean ustadHasStopped = false;
//boolean remajaHasStopped = false;
//float timeOfDay = 0; // 0 = pagi, 1 = siang, 2 = sore, 3 = malam
//boolean isNight = false;
//float ustadTargetY = 300;   // Y masjid (atur sesuai posisi masjid di background)
//float remajaTargetY = 300;
//boolean ustadMasukMasjid = false;
//boolean remajaMasukMasjid = false;

//void setup() {
//  size(1300, 720);
//  backgroundLayer = createGraphics(width, height);
//  generateStaticBackground();
//  initClouds();
//  initStars();
  
//  ustad = new Character(
//  "assets/characters/UstadKanan.png",
//  "assets/characters/UstadKiri.png",
//  -150,
//  400,
//  1.0 // Skala 1.0 berarti ukuran normal
//);
  
//remaja = new Character(
//  "assets/characters/RemajaKanan.png",
//  "assets/characters/RemajaKiri.png",
//  -250,
//  400,
//  0.3 // Skala 0.8 berarti 80% dari ukuran asli (lebih kecil)
//);
//musikPagi = new SoundFile(this, "morning.mp3");
//  suaraBurung = new SoundFile(this, "birds.mp3");
  
//  // Atur volume agar seimbang (opsional, tapi disarankan)
//  musikPagi.amp(0.7);   // Musik diatur ke 70% volume
//  suaraBurung.amp(0.5); // Suara burung lebih pelan, sebagai ambien
  
//  // Putar kedua suara secara berulang (loop)
//  musikPagi.loop();
//  suaraBurung.loop();
//}


//void draw() {
//  image(backgroundLayer, 0, 0);
//  drawMovingClouds();
  
//   if (!ustadHasStopped) {
//    ustad.move(1.0); // Kecepatan jalan Ustad
//    if (ustad.x >= ustadStopX) {
//      ustadHasStopped = true;
//      ustad.x = ustadStopX;
//    }
//  }
//  // Setelah ustad berhenti horizontal, jalan vertikal ke masjid
//  if (ustadHasStopped && !ustadMasukMasjid) {
//    if (ustad.y > ustadTargetY) {
//      ustad.y -= 2;
//      if (ustad.y <= ustadTargetY) {
//        ustad.y = ustadTargetY;
//        ustadMasukMasjid = true;
//      }
//    }
//  }
//  if (!ustadMasukMasjid) ustad.display();
  
//  // Logika untuk Remaja
//  if (!remajaHasStopped) {
//    remaja.move(1.0); // Remaja berjalan sedikit lebih cepat
//    if (remaja.x >= remajaStopX) {
//      remajaHasStopped = true;
//      remaja.x = remajaStopX;
//    }
//  }
//  // Setelah remaja berhenti horizontal, jalan vertikal ke masjid
//  if (remajaHasStopped && !remajaMasukMasjid) {
//    if (remaja.y > remajaTargetY) {
//      remaja.y -= 2;
//      if (remaja.y <= remajaTargetY) {
//        remaja.y = remajaTargetY;
//        remajaMasukMasjid = true;
//      }
//    }
//  }
//  if (!remajaMasukMasjid) remaja.display();
  
  
//  if (isNight) {
//    drawStars();
//  }
  
//  // Tekan spasi untuk mengubah waktu
//  if (keyPressed && key == ' ') {
//    timeOfDay = (timeOfDay + 0.01) % 4;
//    if (timeOfDay > 2.5) {
//      isNight = true;
//    } else {
//      isNight = false;
//    }
//    generateStaticBackground();
//  }

//  // Dynamic speech variables for Scene 4
//  String[] speechTexts = {
//    "Anak-anak muda tersebut menerima ajakan dari ustaz tersebut. Mereka pun berjalan bersama menuju masjid sambil berbincang ringan."
//  };
//  String[] speakers = {
//    "--"
//  };
//  int currentSpeechIndex = 0;
//  int speechDuration = 8000; // milliseconds per line
//  int lastSpeechChange = 0;  // time of last change
//  int typingSpeed = 65; // milliseconds per character
//  int charsToShow = 0;
//  int fadeDuration = 500; // milliseconds for fade in/out
//  int boxAlpha = 0;       // current alpha value (0-255)
//  int displayTime = 2000; // ms to show full text before fade out
//  boolean dialogueFinished = false;

//  int totalChars = speechTexts[currentSpeechIndex].length();
//  int elapsed = millis() - lastSpeechChange;
//  int typingTime = totalChars * typingSpeed;
//  int fadeOutStart = fadeDuration + typingTime + displayTime;
//  int fadeOutEnd = fadeOutStart + fadeDuration;

//  if (dialogueFinished) {
//    boxAlpha = 0;
//  } else if (elapsed < fadeDuration) {
//    boxAlpha = int(map(elapsed, 0, fadeDuration, 0, 255));
//  } else if (elapsed < fadeDuration + typingTime) {
//    boxAlpha = 255;
//  } else if (elapsed < fadeOutStart) {
//    boxAlpha = 255;
//  } else if (elapsed < fadeOutEnd) {
//    boxAlpha = int(map(elapsed, fadeOutStart, fadeOutEnd, 255, 0));
//  } else if (!dialogueFinished) {
//    currentSpeechIndex++;
//    if (currentSpeechIndex >= speechTexts.length) {
//      dialogueFinished = true;
//      currentSpeechIndex = speechTexts.length - 1;
//      boxAlpha = 0;
//    } else {
//      lastSpeechChange = millis();
//      charsToShow = 0;
//      boxAlpha = 0;
//    }
//  }

//  if (!dialogueFinished && elapsed < fadeDuration + typingTime) {
//    charsToShow = min(totalChars, max(0, (elapsed - fadeDuration) / typingSpeed));
//  } else {
//    charsToShow = totalChars;
//  }

//  if (!dialogueFinished || boxAlpha > 0) {
//    drawSpeechBox(
//      speakers[currentSpeechIndex],
//      speechTexts[currentSpeechIndex].substring(0, min(charsToShow, speechTexts[currentSpeechIndex].length())),
//      300, height - 120 - 40, 700, 120,
//      boxAlpha
//    );
//  }
//}

//// ==========================
////      BACKGROUND STATIC
//// ==========================
//void generateStaticBackground() {
//  backgroundLayer.beginDraw();
  
//  // Langit dengan gradasi berdasarkan waktu
//  drawGradientSky(backgroundLayer);
  
//  // Gunung berlapis dengan perspektif
//  drawMountainLayers(backgroundLayer);
  
//  // Sawah dengan detail
//  drawRiceFields(backgroundLayer);
  
//  // Tanah dan jalan dengan tekstur
//  drawGround(backgroundLayer);
  
//  // Pohon-pohon dengan variasi
//  drawStaticTree(backgroundLayer, 80, 320, 1.2);
//  drawStaticTree(backgroundLayer, 180, 315, 1.0);
//  drawStaticTree(backgroundLayer, 280, 325, 0.8);
//  drawStaticTree(backgroundLayer, 950, 310, 1.1);
//  drawStaticTree(backgroundLayer, 1050, 315, 0.9);
  
//  // Masjid yang diperbesar dengan detail yang sangat bagus
//  drawBeautifulMasjid(backgroundLayer, 400, 250);
  
//  // Lampu jalan dan elemen tambahan
//  drawStreetLights(backgroundLayer);
  
//  backgroundLayer.endDraw();
//}

//void drawGradientSky(PGraphics pg) {
//  pg.noFill();
//  for (int i = 0; i <= height / 2; i++) {
//    float inter = map(i, 0, height / 2, 0, 1);
//    color c;
//    if (isNight) {
//      c = lerpColor(color(10, 10, 30), color(30, 30, 60), inter);
//    } else {
//      // WARNA LANGIT SENJA (MAGRIB)
//      color biruAtas = color(135, 206, 250); // Biru muda di bagian atas
//      color jinggaBawah = color(255, 165, 0, 200); // Oranye/jingga di cakrawala
//      c = lerpColor(biruAtas, jinggaBawah, inter);
//    }
//    pg.stroke(c);
//    pg.line(0, i, width, i);
//  }
//}

//void drawMountainLayers(PGraphics pg) {
//  pg.noStroke();
  
//  // Gunung latar belakang (jauh)
//  pg.fill(120, 150, 180, 150);
//  pg.beginShape();
//  pg.vertex(0, 200);
//  for (int x = 0; x <= width; x += 15) {
//    float y = 180 + 40 * noise(x * 0.005, 1000);
//    pg.vertex(x, y);
//  }
//  pg.vertex(width, 250);
//  pg.vertex(0, 250);
//  pg.endShape(CLOSE);
  
//  // Gunung tengah
//  pg.fill(80, 120, 100, 200);
//  pg.beginShape();
//  pg.vertex(0, 220);
//  for (int x = 0; x <= width; x += 20) {
//    float y = 200 + 50 * noise(x * 0.008, 2000);
//    pg.vertex(x, y);
//  }
//  pg.vertex(width, 280);
//  pg.vertex(0, 280);
//  pg.endShape(CLOSE);
  
//  // Gunung depan
//  pg.fill(60, 100, 70);
//  pg.beginShape();
//  pg.vertex(0, 250);
//  for (int x = 0; x <= width; x += 25) {
//    float y = 230 + 60 * noise(x * 0.01, 3000);
//    pg.vertex(x, y);
//  }
//  pg.vertex(width, 320);
//  pg.vertex(0, 320);
//  pg.endShape(CLOSE);
//}

//void drawRiceFields(PGraphics pg) {
//  // Sawah dengan garis-garis detail
//  pg.fill(108, 217, 77);
//  pg.rect(0, 320, width, 80);
  
//  // Garis-garis sawah
//  pg.stroke(90, 180, 60);
//  pg.strokeWeight(1);
//  for (int i = 0; i < 15; i++) {
//    float y = 320 + i * 5;
//    pg.line(0, y, width, y);
//  }
  
//  // Pematang sawah
//  pg.stroke(70, 140, 50);
//  pg.strokeWeight(2);
//  for (int x = 100; x < width; x += 200) {
//    pg.line(x, 320, x, 400);
//  }
//  pg.noStroke();
//}

//void drawGround(PGraphics pg) {
//  // Jalan tanah
//  pg.fill(#B07D53);
//  pg.rect(0, 430, width, height - 430);
//}

//// ==========================
////        Awan & Bintang
//// ==========================
//class Cloud {
//  float x, y, speed, size;
//  Cloud(float x, float y, float speed, float size) {
//    this.x = x;
//    this.y = y;
//    this.speed = speed;
//    this.size = size;
//  }
  
//  void move() {
//    x += speed;
//    if (x > width + 100) x = -150;
//  }
  
//  void display() {
//    fill(255, isNight ? 100 : 230);
//    noStroke();
//    ellipse(x, y, 80 * size, 50 * size);
//    ellipse(x + 25 * size, y + 12 * size, 60 * size, 35 * size);
//    ellipse(x - 25 * size, y + 12 * size, 60 * size, 35 * size);
//    ellipse(x + 10 * size, y - 8 * size, 50 * size, 30 * size);
//    ellipse(x - 10 * size, y - 8 * size, 50 * size, 30 * size);
//  }
//}

//class Star {
//  float x, y, brightness;
//  Star(float x, float y) {
//    this.x = x;
//    this.y = y;
//    this.brightness = random(100, 255);
//  }
  
//  void display() {
//    fill(255, brightness);
//    noStroke();
//    ellipse(x, y, 2, 2);
    
//    // Efek berkilau
//    if (random(1) < 0.1) {
//      stroke(255, brightness/2);
//      strokeWeight(1);
//      line(x-4, y, x+4, y);
//      line(x, y-4, x, y+4);
//      noStroke();
//    }
//  }
//}

//void initClouds() {
//  clouds.add(new Cloud(100, 80, 0.4, 1.0));
//  clouds.add(new Cloud(300, 100, 0.3, 1.2));
//  clouds.add(new Cloud(600, 70, 0.2, 0.8));
//  clouds.add(new Cloud(800, 90, 0.5, 1.1));
//  clouds.add(new Cloud(1000, 110, 0.35, 0.9));
//}

//void initStars() {
//  for (int i = 0; i < 200; i++) {
//    stars.add(new Star(random(width), random(height/2)));
//  }
//}

//void drawMovingClouds() {
//  for (Cloud c : clouds) {
//    c.move();
//    c.display();
//  }
//}

//void drawStars() {
//  for (Star s : stars) {
//    s.display();
//  }
//}

//// ==========================
////     Pohon dengan Variasi
//// ==========================
//void drawStaticTree(PGraphics pg, int x, int y, float scale) {
//  pg.pushMatrix();
//  pg.translate(x, y);
//  pg.scale(scale);
  
//  // Batang pohon dengan tekstur
//  pg.fill(74, 47, 29);
//  pg.rect(-5, 0, 10, 40);
  
//  // Tekstur batang
//  pg.stroke(60, 35, 20);
//  pg.strokeWeight(1);
//  for (int i = 0; i < 5; i++) {
//    pg.line(-4, i * 8, 4, i * 8);
//  }
//  pg.noStroke();
  
//  // Daun berlapis
//  pg.fill(47, 112, 51, 200);
//  pg.ellipse(0, -15, 45, 45);
//  pg.ellipse(-15, -5, 40, 40);
//  pg.ellipse(15, -5, 40, 40);
//  pg.ellipse(0, 5, 35, 35);
  
//  // Highlight daun
//  pg.fill(80, 150, 80, 150);
//  pg.ellipse(-5, -20, 25, 25);
//  pg.ellipse(5, -10, 20, 20);
  
//  pg.popMatrix();
//}

//// ==========================
////     Masjid yang Sangat Indah dengan Desain Baru
//// ==========================
//void drawBeautifulMasjid(PGraphics pg, int x, int y) {
//  pg.pushMatrix();
//  pg.translate(x, y);
  
//  // Bayangan bangunan dengan gradasi
//  pg.fill(0, 0, 0, 70);
//  pg.rect(28, 12, 380, 220);
  
//  // ===== FONDASI DAN TERAS =====
//  pg.fill(200, 200, 205);
//  pg.stroke(160, 160, 165);
//  pg.strokeWeight(2);
//  pg.rect(0, 180, 420, 30);
  
//  // Tangga masjid
//  for (int i = 0; i < 4; i++) {
//    pg.fill(220 - i * 10, 220 - i * 10, 225 - i * 10);
//    pg.rect(40 + i * 5, 180 + i * 5, 340 - i * 10, 8);
//  }
  
//  // ===== BANGUNAN UTAMA =====
//  pg.fill(248, 248, 253);
//  pg.stroke(210, 210, 215);
//  pg.strokeWeight(3);
//  pg.rect(25, 0, 370, 180);
  
//  // Ornamen horizontal bangunan
//  pg.fill(235, 235, 240);
//  pg.rect(20, 5, 380, 12);
//  pg.rect(20, 162, 380, 12);
  
//  // Motif geometris pada dinding
//  drawGeometricPattern(pg, 35, 25, 350, 130);
  
//  // ===== KUBAH UTAMA DENGAN DETAIL =====
//  drawEnhancedDome(pg, 210, -30, 220, 140, color(255, 220, 30), color(255, 240, 120));
  
//  // ===== KUBAH SAMPING =====
//  drawEnhancedDome(pg, 100, 10, 110, 75, color(255, 220, 30), color(255, 240, 120));
//  drawEnhancedDome(pg, 320, 10, 110, 75, color(255, 220, 30), color(255, 240, 120));
  
//  // ===== MENARA DENGAN DETAIL LEBIH BAGUS =====
//  drawEnhancedMinaret(pg, -90, -150, 55, 330);
//  drawEnhancedMinaret(pg, 455, -150, 55, 330);
  
//  // ===== PINTU UTAMA YANG LEBIH INDAH =====
//  drawEnhancedMainDoor(pg, 170, 50);
  
//  // ===== JENDELA DENGAN ORNAMEN ISLAMIK =====
//  drawEnhancedIslamicWindow(pg, 60, 50);
//  drawEnhancedIslamicWindow(pg, 290, 50);
  
//  // ===== KALIGRAFI DAN ORNAMEN =====
//  drawEnhancedCalligraphy(pg, 135, -80);
  
//  // ===== BULAN SABIT DAN BINTANG =====
//  drawEnhancedCrescentMoon(pg, 210, -130);
  
//  // ===== LAMPU MASJID =====
//  drawEnhancedMasjidLights(pg);
  
//  // ===== ORNAMEN TAMBAHAN =====
//  drawAdditionalOrnaments(pg);
  
//  pg.noStroke();
//  pg.popMatrix();
//}

//void drawGeometricPattern(PGraphics pg, float x, float y, float w, float h) {
//  pg.stroke(200, 200, 205);
//  pg.strokeWeight(1);
  
//  // Pola berlian
//  for (int i = 0; i < 8; i++) {
//    for (int j = 0; j < 3; j++) {
//      float px = x + 20 + i * 40;
//      float py = y + 20 + j * 40;
      
//      pg.noFill();
//      pg.beginShape();
//      pg.vertex(px, py - 8);
//      pg.vertex(px + 8, py);
//      pg.vertex(px, py + 8);
//      pg.vertex(px - 8, py);
//      pg.endShape(CLOSE);
//    }
//  }
  
//  // Pola bintang kecil
//  pg.fill(220, 220, 225);
//  for (int i = 0; i < 12; i++) {
//    for (int j = 0; j < 4; j++) {
//      float px = x + 15 + i * 28;
//      float py = y + 15 + j * 28;
//      drawSmallStar(pg, px, py, 3);
//    }
//  }
  
//  pg.noStroke();
//}

//void drawEnhancedDome(PGraphics pg, float x, float y, float w, float h, color c1, color c2) {
//  // Gradasi kubah dengan detail lebih halus
//  for (int i = 0; i < h/2; i++) {
//    float inter = map(i, 0, h/2, 0, 1);
//    color c = lerpColor(c1, c2, inter);
//    pg.stroke(c);
//    pg.strokeWeight(1);
//    pg.line(x - w/2 + i/2, y + i, x + w/2 - i/2, y + i);
//  }
  
//  // Ornamen kubah
//  pg.stroke(200, 160, 0);
//  pg.strokeWeight(3);
//  pg.noFill();
//  pg.arc(x, y + h/4, w, h, PI, TWO_PI);
  
//  // Garis-garis ornamen pada kubah
//  pg.strokeWeight(2);
//  for (int i = 0; i < 8; i++) {
//    float angle = map(i, 0, 8, PI, TWO_PI);
//    float x1 = x + cos(angle) * w/2.5;
//    float y1 = y + sin(angle) * h/4 + h/4;
//    float x2 = x + cos(angle) * w/3;
//    float y2 = y + sin(angle) * h/5 + h/4;
//    pg.line(x1, y1, x2, y2);
//  }
  
//  // Puncak kubah
//  pg.fill(255, 215, 0);
//  pg.noStroke();
//  pg.ellipse(x, y - 5, 15, 10);
  
//  pg.noStroke();
//}

//void drawEnhancedMinaret(PGraphics pg, float x, float y, float w, float h) {
//  // Fondasi menara
//  pg.fill(240, 240, 245);
//  pg.stroke(200, 200, 205);
//  pg.strokeWeight(3);
//  pg.rect(x - 5, y + h - 30, w + 10, 30);
  
//  // Batang menara dengan detail
//  pg.fill(248, 248, 253);
//  pg.rect(x, y, w, h);
  
//  // Ornamen horizontal berlapis
//  pg.fill(235, 235, 240);
//  for (int i = 0; i < 12; i++) {
//    float yPos = y + i * 27;
//    pg.rect(x - 3, yPos, w + 6, 6);
    
//    // Detail ornamen
//    pg.fill(220, 220, 225);
//    pg.rect(x + 5, yPos + 1, w - 10, 4);
//    pg.fill(235, 235, 240);
//  }
  
//  // Balkon menara
//  pg.fill(230, 230, 235);
//  pg.rect(x - 8, y + h/2 - 20, w + 16, 25);
  
//  // Railing balkon
//  pg.stroke(200, 200, 205);
//  pg.strokeWeight(2);
//  for (int i = 0; i < 8; i++) {
//    pg.line(x - 5 + i * 8, y + h/2 - 20, x - 5 + i * 8, y + h/2 - 5);
//  }
  
//  // Kubah menara yang lebih detail
//  drawEnhancedDome(pg, x + w/2, y - 20, w + 20, 50, color(255, 220, 30), color(255, 240, 120));
  
//  // Bulan sabit di atas menara
//  pg.stroke(255, 215, 0);
//  pg.strokeWeight(5);
//  pg.noFill();
//  pg.arc(x + w/2, y - 40, 30, 30, QUARTER_PI, PI + QUARTER_PI);
//  pg.strokeWeight(4);
//  pg.line(x + w/2, y - 55, x + w/2, y - 75);
  
//  // Bintang di samping bulan
//  pg.fill(255, 215, 0);
//  pg.noStroke();
//  drawStar(pg, x + w/2 + 25, y - 50, 6);
  
//  pg.noStroke();
//}

//void drawEnhancedMainDoor(PGraphics pg, float x, float y) {
//  // Pintu utama dengan arch
//  pg.fill(120, 80, 40);
//  pg.stroke(90, 60, 30);
//  pg.strokeWeight(3);
//  pg.rect(x, y, 90, 130);
  
//  // Arch di atas pintu
//  pg.noFill();
//  pg.strokeWeight(4);
//  pg.arc(x + 45, y, 90, 60, PI, TWO_PI);
  
//  // Ornamen pintu berlapis
//  pg.fill(140, 100, 60);
//  pg.rect(x + 5, y + 5, 80, 120);
  
//  // Pola geometris Islam detail
//  pg.fill(120, 80, 40);
//  for (int i = 0; i < 8; i++) {
//    for (int j = 0; j < 6; j++) {
//      float px = x + 12 + j * 12;
//      float py = y + 15 + i * 14;
      
//      pg.beginShape();
//      pg.vertex(px, py - 4);
//      pg.vertex(px + 4, py);
//      pg.vertex(px, py + 4);
//      pg.vertex(px - 4, py);
//      pg.endShape(CLOSE);
//    }
//  }
  
//  // Handle pintu yang lebih detail
//  pg.fill(255, 215, 0);
//  pg.ellipse(x + 75, y + 65, 18, 18);
//  pg.fill(200, 170, 0);
//  pg.ellipse(x + 75, y + 65, 12, 12);
  
//  // Knocker
//  pg.stroke(255, 215, 0);
//  pg.strokeWeight(3);
//  pg.noFill();
//  pg.ellipse(x + 75, y + 65, 25, 25);
  
//  pg.noStroke();
//}

//void drawEnhancedIslamicWindow(PGraphics pg, float x, float y) {
//  // Jendela dengan bentuk lengkung yang lebih detail
//  pg.fill(160, 200, 240);
//  pg.stroke(120, 160, 200);
//  pg.strokeWeight(3);
//  pg.rect(x, y, 70, 90);
//  pg.arc(x + 35, y, 70, 70, PI, TWO_PI);
  
//  // Frame jendela
//  pg.fill(130, 170, 210);
//  pg.rect(x + 3, y + 3, 64, 84);
//  pg.arc(x + 35, y, 64, 64, PI, TWO_PI);
  
//  // Ornamen jendela dengan pola Islamik
//  pg.fill(120, 160, 200);
//  pg.line(x + 35, y, x + 35, y + 87);
//  pg.line(x + 3, y + 45, x + 67, y + 45);
  
//  // Kisi-kisi jendela yang lebih detail
//  pg.stroke(100, 140, 180);
//  pg.strokeWeight(2);
//  for (int i = 0; i < 8; i++) {
//    pg.line(x + 8 + i * 8, y + 8, x + 8 + i * 8, y + 82);
//  }
//  for (int i = 0; i < 10; i++) {
//    pg.line(x + 8, y + 8 + i * 8, x + 62, y + 8 + i * 8);
//  }
  
//  // Ornamen bintang di tengah
//  pg.fill(255, 215, 0);
//  pg.noStroke();
//  drawStar(pg, x + 35, y + 30, 8);
  
//  pg.noStroke();
//}

//void drawEnhancedCalligraphy(PGraphics pg, float x, float y) {
//  // Panel kaligrafi dengan ornamen
//  pg.fill(40, 120, 70);
//  pg.stroke(30, 100, 60);
//  pg.strokeWeight(2);
//  pg.rect(x, y, 170, 55);
  
//  // Ornamen frame
//  pg.fill(50, 140, 80);
//  pg.rect(x + 3, y + 3, 164, 49);
  
//  // Border ornamen
//  pg.stroke(255, 215, 0);
//  pg.strokeWeight(2);
//  pg.noFill();
//  pg.rect(x + 5, y + 5, 160, 45);
  
//  // Teks kaligrafi
//  pg.fill(255, 215, 0);
//  pg.textSize(22);
//  pg.textAlign(CENTER);
//  pg.text("بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ", x + 85, y + 20);
//  pg.textSize(16);
//  pg.text("MASJID AL-IKHLAS", x + 85, y + 40);
  
//  // Ornamen sudut
//  pg.fill(255, 215, 0);
//  pg.noStroke();
//  for (int i = 0; i < 4; i++) {
//    float cornerX = x + (i % 2) * 160;
//    float cornerY = y + (i / 2) * 45;
//    drawSmallStar(pg, cornerX + 8, cornerY + 8, 4);
//  }
  
//  pg.textAlign(LEFT);
//  pg.noStroke();
//}

//void drawEnhancedCrescentMoon(PGraphics pg, float x, float y) {
//  // Bulan sabit emas dengan detail
//  pg.stroke(255, 215, 0);
//  pg.strokeWeight(8);
//  pg.noFill();
//  pg.arc(x, y, 60, 60, QUARTER_PI, PI + QUARTER_PI);
  
//  // Highlight bulan
//  pg.stroke(255, 240, 150);
//  pg.strokeWeight(4);
//  pg.arc(x - 3, y - 3, 50, 50, QUARTER_PI, PI + QUARTER_PI);
  
//  // Tiang yang lebih detail
//  pg.stroke(255, 215, 0);
//  pg.strokeWeight(6);
//  pg.line(x, y - 30, x, y - 70);
  
//  // Ornamen pada tiang
//  pg.fill(255, 215, 0);
//  pg.noStroke();
//  for (int i = 0; i < 3; i++) {
//    pg.ellipse(x, y - 40 - i * 10, 8, 8);
//  }
  
//  // Bintang yang lebih besar
//  pg.fill(255, 215, 0);
//  drawStar(pg, x + 35, y - 15, 10);
  
//  // Bintang kecil di sekitar
//  drawStar(pg, x + 25, y - 35, 5);
//  drawStar(pg, x + 45, y - 25, 4);
  
//  pg.noStroke();
//}

//void drawEnhancedMasjidLights(PGraphics pg) {
//  if (isNight) {
//    // Lampu-lampu masjid yang lebih detail
//    pg.fill(255, 255, 150, 220);
//    pg.ellipse(60, 90, 20, 20);
//    pg.ellipse(360, 90, 20, 20);
//    pg.ellipse(210, 20, 25, 25);
//    pg.ellipse(140, 140, 15, 15);
//    pg.ellipse(280, 140, 15, 15);
    
//    // Efek cahaya berlapis
//    pg.fill(255, 255, 0, 60);
//    pg.ellipse(60, 90, 50, 50);
//    pg.ellipse(360, 90, 50, 50);
//    pg.ellipse(210, 20, 60, 60);
    
//    pg.fill(255, 255, 0, 30);
//    pg.ellipse(60, 90, 80, 80);
//    pg.ellipse(360, 90, 80, 80);
//    pg.ellipse(210, 20, 90, 90);
    
//    // Lampu dalam jendela
//    pg.fill(255, 255, 100, 150);
//    pg.ellipse(95, 95, 40, 40);
//    pg.ellipse(325, 95, 40, 40);
//  }
//}

//void drawAdditionalOrnaments(PGraphics pg) {
//  // Ornamen tambahan di dinding
//  pg.fill(220, 220, 225);
//  pg.noStroke();
  
//  // Medallion di dinding
//  for (int i = 0; i < 3; i++) {
//    float x = 80 + i * 120;
//    float y = 30;
//    pg.ellipse(x, y, 25, 25);
//    pg.fill(200, 200, 205);
//    pg.ellipse(x, y, 20, 20);
//    pg.fill(220, 220, 225);
//    drawStar(pg, x, y, 6);
//  }
  
//  // Ornamen di bagian atas dinding
//  pg.stroke(200, 200, 205);
//  pg.strokeWeight(2);
//  for (int i = 0; i < 15; i++) {
//    float x = 30 + i * 25;
//    pg.line(x, 8, x + 10, 15);
//    pg.line(x + 10, 15, x + 20, 8);
//  }
  
//  pg.noStroke();
//}

//void drawStar(PGraphics pg, float x, float y, float radius) {
//  pg.beginShape();
//  for (int i = 0; i < 10; i++) {
//    float angle = map(i, 0, 10, 0, TWO_PI);
//    float r = (i % 2 == 0) ? radius : radius * 0.5;
//    float sx = x + cos(angle) * r;
//    float sy = y + sin(angle) * r;
//    pg.vertex(sx, sy);
//  }
//  pg.endShape(CLOSE);
//}

//void drawSmallStar(PGraphics pg, float x, float y, float radius) {
//  pg.beginShape();
//  for (int i = 0; i < 8; i++) {
//    float angle = map(i, 0, 8, 0, TWO_PI);
//    float r = (i % 2 == 0) ? radius : radius * 0.4;
//    float sx = x + cos(angle) * r;
//    float sy = y + sin(angle) * r;
//    pg.vertex(sx, sy);
//  }
//  pg.endShape(CLOSE);
//}

//// ==========================
////     Lampu Jalan
//// ==========================
//void drawStreetLights(PGraphics pg) {
//  for (int i = 200; i < width; i += 300) {
//    // Tiang lampu
//    pg.fill(80, 80, 80);
//    pg.rect(i, 430, 8, 60);
    
//    // Lampu
//    pg.fill(isNight ? color(255, 255, 150) : color(200, 200, 200));
//    pg.ellipse(i + 4, 460, 20, 15);
    
//    // Efek cahaya malam
//    if (isNight) {
//      pg.fill(255, 255, 0, 30);
//      pg.ellipse(i + 4, 480, 100, 80);
//    }
//  }
//}

//// ==========================
////     Kontrol
//// ==========================
//void keyPressed() {
//  if (key == ' ') {
//    // Logika pergantian waktu sudah ada di draw()
//  }
//  if (key == 'r' || key == 'R') {
//    // Reset
//    timeOfDay = 0;
//    isNight = false;
//    generateStaticBackground();
//  }
//}

//// Instruksi penggunaan
//void drawInstructions() {
//  fill(0, 150);
//  rect(10, 10, 300, 60);
//  fill(255);
//  textSize(12);
//  text("Tekan SPASI untuk mengubah waktu", 20, 30);
//  text("Tekan R untuk reset", 20, 45);
//  text("Awan bergerak otomatis", 20, 60);
//}

//void drawSpeechBox(String speaker, String text, int x, int y, int w, int h, int alpha) {
//  // Box background
//  fill(20, 22, 40, alpha); // dark blue
//  stroke(80, 80, 120, alpha); // lighter border
//  strokeWeight(4);
//  rect(x, y, w, h, 0);

//  // Pixel corners (optional, for extra style)
//  int cornerSize = 12;
//  fill(60, 60, 100, alpha);
//  noStroke();
//  rect(x, y, cornerSize, cornerSize);
//  rect(x + w - cornerSize, y, cornerSize, cornerSize);
//  rect(x, y + h - cornerSize, cornerSize, cornerSize);
//  rect(x + w - cornerSize, y + h - cornerSize, cornerSize, cornerSize);

//  // Speaker name
//  fill(150, 150, 200, alpha);
//  textAlign(LEFT, TOP);
//  textSize(24);
//  text(speaker, x + 20, y + 10);

//  // Speech text
//  fill(255, alpha);
//  textSize(20);
//  textLeading(28);
//  text(text, x + 20, y + 50, w - 40, h - 60);
//}
