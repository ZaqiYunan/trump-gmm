//// Variabel Global
//import processing.sound.*;

//// 2. Deklarasi variabel untuk DUA file suara
//SoundFile musikPagi;
//SoundFile suaraBurung;
//float awanX1 = 100;
//float awanX2 = 300;
//Character ustad;
//PGraphics backgroundLayer;
//ArrayList<Cloud> clouds = new ArrayList<Cloud>();
//ArrayList<Star> stars = new ArrayList<Star>();
//ArrayList<Bird> birds = new ArrayList<Bird>(); // <-- Variabel baru untuk burung
//float timeOfDay = 0; // 0 = pagi, 1 = siang, 2 = sore, 3 = malam
//boolean isNight = false;

//// ===============================================
//// ==      NARASI BARU YANG DIPERPANJANG        ==
//// ===============================================
//String[] speechTexts = {
//  "Di ufuk barat, mentari mulai terbenam, menyisakan semburat jingga di langit sore.",
//  "Seorang ustaz berjalan tenang di pematang sawah, diiringi gemericik air sungai dan kicauan burung yang kembali ke sarang.",
//  "Gema azan Magrib mulai memanggil dari kejauhan, sebuah seruan damai yang menenangkan jiwa.",
//  "Dengan hati penuh syukur dan langkah yang mantap, beliau bergegas menuju masjid untuk menunaikan salat berjamaah."
//};
//String[] speakers = {
//  "--",
//  "--",
//  "--",
//  "--"
//};
//int currentSpeechIndex = 0;
//int speechDuration = 8000;
//int lastSpeechChange = 0;
//int typingSpeed = 65;
//int charsToShow = 0;
//int fadeDuration = 500;
//int boxAlpha = 0;
//int displayTime = 2000;
//boolean dialogueFinished = false;

//// Class Character (Asumsi sudah ada di sketch Anda)
//// Pastikan Anda memiliki class ini agar kode berjalan.
//class Character1 {
//  PImage imgRight, imgLeft;
//  float x, y, scale;
//  boolean facingRight = true;

//  Character1(String imgPathRight, String imgPathLeft, float x, float y, float scale) {
//    this.imgRight = loadImage(imgPathRight);
//    this.imgLeft = loadImage(imgPathLeft);
//    this.x = x;
//    this.y = y;
//    this.scale = scale;
//  }

//  void move(float speed) {
//    x += speed;
//    if (x > width + 200) { // Reset jika sudah jauh dari layar
//      x = -150;
//    }
//  }

//  void display() {
//    PImage currentImg = facingRight ? imgRight : imgLeft;
//    if (currentImg != null) {
//      image(currentImg, x, y, currentImg.width * scale, currentImg.height * scale);
//    }
//  }
//}


//// Enhanced Ripple class for detailed river animation
//class Ripple {
//  float x, y, length, speed, thickness, alpha, phase, waveAmp, waveFreq;
//  Ripple(float x, float y, float length, float speed, float thickness, float alpha, float waveAmp, float waveFreq) {
//    this.x = x;
//    this.y = y;
//    this.length = length;
//    this.speed = speed;
//    this.thickness = thickness;
//    this.alpha = alpha;
//    this.phase = random(TWO_PI);
//    this.waveAmp = waveAmp;
//    this.waveFreq = waveFreq;
//  }
//  void move() {
//    x += speed;
//    if (x > width) {
//      x = -length;
//      y = 385 + random(40);
//      phase = random(TWO_PI);
//    }
//    phase += 0.01;
//  }
//  void display() {
//    stroke(174, 234, 249, alpha);
//    strokeWeight(thickness);
//    noFill();
//    beginShape();
//    for (float i = 0; i < length; i += 2) {
//      float wave = sin(phase + i * waveFreq) * waveAmp;
//      vertex(x + i, y + wave);
//    }
//    endShape();
//    noStroke();
//  }
//}
//ArrayList<Ripple> ripples = new ArrayList<Ripple>();
//PGraphics shadowBuffer;

//void setup() {
//  size(1300, 720);
//  frameRate(30);
  
//  backgroundLayer = createGraphics(width, height);
//  generateBackground();
//  initClouds();
//  initStars();
//  initBirds();
  
//  ustad = new Character("assets/characters/UstadKanan.png", "assets/characters/UstadKiri.png", -150, 480, 1.0);
  
//  // Inisialisasi Riak Air
//  for (int i = 0; i < 15; i++) {
//    ripples.add(new Ripple(random(width), 385 + random(40), random(20, 60), random(0.4, 1.0), random(1, 2.5), random(80, 180), random(1, 4), random(0.08, 0.18)));
//  }
  
//  // Inisialisasi Bayangan
//  shadowBuffer = createGraphics(120, 40);
//  shadowBuffer.beginDraw();
//  shadowBuffer.noStroke();
//  for (int i = 20; i > 0; i--) {
//    shadowBuffer.fill(0, 30 - i, 60 - i * 2);
//    shadowBuffer.ellipse(shadowBuffer.width/2, shadowBuffer.height/2, 100 + i*2, 30 + i);
//  }
//  shadowBuffer.endDraw();
  
//  // ================================================
//  // ==  3. MUAT DAN PUTAR KEDUA FILE SUARA DI SINI ==
//  // ================================================
  
//  // Muat file dari folder 'data'
//  musikPagi = new SoundFile(this, "morning.mp3");
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

//  // Awan bergerak dari kode lama (bisa dihapus jika tidak ingin ada 2 jenis awan)
//  // drawCloud(awanX1, 80);
//  // drawCloud(awanX2, 120);
//  // awanX1 += 0.3;
//  // awanX2 += 0.2;
//  // if (awanX1 > width + 100) awanX1 = -100;
//  // if (awanX2 > width + 100) awanX2 = -100;

//  // Awan bergerak dari kode baru
//  drawMovingClouds();

//  // Burung terbang
//  drawFlyingBirds(); // <-- Panggil fungsi untuk menggambar burung

//  // Bintang untuk malam
//  if (isNight) {
//    drawStars();
//  }

//  // Riak air sungai
//  drawRiverRipples();

//  // ===============================================
//  // ==  KECEPATAN DISESUAIKAN UNTUK DURASI 30 DETIK ==
//  // ===============================================
//  ustad.move(1.6); // Kecepatan diubah agar durasi ~30 detik

//  // Gambar bayangan
//  float charWidth = 120 * ustad.scale;
//  float charHeight = 180 * ustad.scale;
//  float shadowX = ustad.x + charWidth / 2;
//  float shadowY = ustad.y + charHeight + 40 * ustad.scale;
//  float shadowW = charWidth * 0.7;
//  float shadowH = charHeight * 0.18;
//  pushMatrix();
//  translate(shadowX, shadowY);
//  scale(shadowW / shadowBuffer.width, shadowH / shadowBuffer.height);
//  imageMode(CENTER);
//  image(shadowBuffer, 0, 0);
//  imageMode(CORNER);
//  popMatrix();
//  ustad.display();

//  // Logika Teks Narasi
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
//      300, 125, 700, 120,
//      boxAlpha
//    );
//  }
//}

//void generateBackground() {
//  backgroundLayer.beginDraw();
//  drawGradientSky(backgroundLayer);
//  drawMountainLayers(backgroundLayer);
//  drawRiceFields(backgroundLayer);
//  backgroundLayer.fill(#4AC7F2);
//  backgroundLayer.rect(0, 380, width, 50);
//  backgroundLayer.fill(#B07D53);
//  backgroundLayer.rect(0, 430, width, height - 430);
//  drawStaticTree(backgroundLayer, 100, 330, 1.2);
//  drawStaticTree(backgroundLayer, 180, 330, 1.0);
//  drawStaticTree(backgroundLayer, 260, 330, 0.8);
//  drawStaticTree(backgroundLayer, 580, 330, 1.1);
//  drawStaticTree(backgroundLayer, 680, 330, 0.9);
//  backgroundLayer.stroke(#000000);
//  backgroundLayer.strokeWeight(4);
//  for (int x = 0; x <= width; x += 50) {
//    backgroundLayer.line(x, 440, x, 460);
//    if (x + 50 <= width) {
//      backgroundLayer.line(x, 440, x + 50, 440);
//    } else {
//      backgroundLayer.line(x, 440, width, 440);
//    }
//  }
//  backgroundLayer.endDraw();
//}

//void drawGradientSky(PGraphics pg) {
//  pg.noFill();
//  if (isNight) {
//    for (int i = 0; i <= height/2; i++) {
//      float inter = map(i, 0, height/2, 0, 1);
//      color c = lerpColor(color(10, 10, 30), color(30, 30, 60), inter);
//      pg.stroke(c);
//      pg.line(0, i, width, i);
//    }
//  } else {
//    for (int i = 0; i <= height/2; i++) {
//      float inter = map(i, 0, height/2, 0, 1);
//      // Warna langit sore
//      color c1 = color(255, 150, 100); // Jingga
//      color c2 = color(135, 206, 250); // Biru muda
//      color c = lerpColor(c2, c1, inter * 0.8);
//      pg.stroke(c);
//      pg.line(0, i, width, i);
//    }
//  }
//}

//// ... (Sisa fungsi tidak berubah: drawMountainLayers, drawRiceFields, drawStaticTree, dll.)
//void drawMountainLayers(PGraphics pg) {
//  pg.noStroke();
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
//  pg.fill(108, 217, 77);
//  pg.rect(0, 320, width, 60);
//  pg.stroke(90, 180, 60);
//  pg.strokeWeight(1);
//  for (int i = 0; i < 12; i++) {
//    float y = 320 + i * 5;
//    pg.line(0, y, width, y);
//  }
//  pg.stroke(70, 140, 50);
//  pg.strokeWeight(2);
//  for (int x = 100; x < width; x += 200) {
//    pg.line(x, 320, x, 380);
//  }
//  pg.noStroke();
//}

//void drawStaticTree(PGraphics pg, int x, int y, float scale) {
//  pg.pushMatrix();
//  pg.translate(x, y);
//  pg.scale(scale);
//  pg.fill(74, 47, 29);
//  pg.rect(-5, 0, 10, 40);
//  pg.stroke(60, 35, 20);
//  pg.strokeWeight(1);
//  for (int i = 0; i < 5; i++) {
//    pg.line(-4, i * 8, 4, i * 8);
//  }
//  pg.noStroke();
//  pg.fill(47, 112, 51, 200);
//  pg.ellipse(0, -15, 45, 45);
//  pg.ellipse(-15, -5, 40, 40);
//  pg.ellipse(15, -5, 40, 40);
//  pg.ellipse(0, 5, 35, 35);
//  pg.fill(80, 150, 80, 150);
//  pg.ellipse(-5, -20, 25, 25);
//  pg.ellipse(5, -10, 20, 20);
//  pg.popMatrix();
//}

//// ==========================
////    Awan & Bintang
//// ==========================
//class Cloud {
//  float x, y, speed, size;
//  Cloud(float x, float y, float speed, float size) {
//    this.x = x; this.y = y; this.speed = speed; this.size = size;
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
//    this.x = x; this.y = y; this.brightness = random(100, 255);
//  }
//  void display() {
//    fill(255, brightness);
//    noStroke();
//    ellipse(x, y, 2, 2);
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
//    c.move(); c.display();
//  }
//}

//void drawStars() {
//  for (Star s : stars) {
//    s.display();
//  }
//}

//void drawCloud(float x, float y) {
//  fill(255);
//  noStroke();
//  ellipse(x, y, 40, 30);
//  ellipse(x + 20, y + 5, 40, 30);
//  ellipse(x - 20, y + 5, 40, 30);
//  ellipse(x, y + 10, 40, 30);
//}

//void drawRiverRipples() {
//  for (Ripple r : ripples) {
//    r.move(); r.display();
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

//// ==========================
////    Kontrol
//// ==========================
//void keyPressed() {
//  if (key == 'r' || key == 'R') {
//    // Reset
//    timeOfDay = 0;
//    isNight = false;
//    generateBackground();
//  }
//}

//// ===============================================
//// ==      FUNGSI DAN CLASS BARU UNTUK BURUNG   ==
//// ===============================================

//// Class untuk objek burung
//class Bird {
//  PVector position;
//  PVector velocity;
//  float size;
//  int flapSpeed;

//  Bird(float x, float y) {
//    position = new PVector(x, y);
//    velocity = new PVector(random(1.5, 3.0), random(-0.5, 0.5)); // Bergerak ke kanan
//    size = random(8, 15);
//    flapSpeed = int(random(5, 10));
//  }

//  void update() {
//    position.add(velocity);
//    if (position.x > width + size * 2) {
//      position.x = -size * 2; // Reset ke kiri
//      position.y = random(50, 200); // Ketinggian baru
//    }
//  }

//  void display() {
//    fill(50, 50, 50);
//    noStroke();
//    pushMatrix();
//    translate(position.x, position.y);
//    float angle = sin(frameCount * 0.5 / flapSpeed) * PI / 6;
//    // Sayap atas
//    beginShape();
//    vertex(0, 0);
//    vertex(-size, -size/3 + angle * 5);
//    vertex(-size * 0.8, 0);
//    endShape(CLOSE);
//    // Sayap bawah
//    beginShape();
//    vertex(0, 0);
//    vertex(-size, size/3 - angle * 5);
//    vertex(-size * 0.8, 0);
//    endShape(CLOSE);
//    popMatrix();
//  }
//}

//// Inisialisasi burung
//void initBirds() {
//  for (int i = 0; i < 7; i++) {
//    birds.add(new Bird(random(width), random(50, 200)));
//  }
//}

//// Menggambar burung
//void drawFlyingBirds() {
//  for (Bird b : birds) {
//    b.update();
//    b.display();
//  }
//}
