//// ==============================================
////   Complete and FIXED Version of Warung Sketch
//// ==============================================

//PGraphics backgroundLayer;
//ArrayList<Cloud> clouds = new ArrayList<Cloud>();
//Character ustad;
//Character remaja;
//float ustadStopX = 750; // Posisi X di mana ustad akan berhenti (di depan warung yang dipindah)
//boolean ustadHasStopped = false;
//float riverAnimOffset = 0;
//boolean isNight = false;

//// Dynamic speech variables for Scene 2
//String[] speechTexts = {
//  "Dalam perjalanannya menuju masjid, sang ustaz melihat dari kejauhan ada sekelompok anak muda yang sedang asyik berbincang di warung.",
//  "Suasana santai menyelimuti mereka, meskipun waktu sholat telah tiba."
//};
//String[] speakers = {
//  "--",
//  "--"
//};
//int currentSpeechIndex = 0;
//int speechDuration = 8000; // milliseconds per line
//int lastSpeechChange = 0;  // time of last change
//int typingSpeed = 95; // milliseconds per character
//int charsToShow = 0;
//int fadeDuration = 500; // milliseconds for fade in/out
//int boxAlpha = 0;       // current alpha value (0-255)
//int displayTime = 3000; // ms to show full text before fade out
//boolean dialogueFinished = false;

//PImage remajaIdle2Img;
//PGraphics shadowBuffer; // Shadow for characters

//void setup() {
//  size(1300, 720);
//  backgroundLayer = createGraphics(width, height);
//  generateStaticBackground();
//  initClouds();
//  ustad = new Character(
//  "assets/characters/UstadKanan.png",
//  "assets/characters/UstadKiri.png",
//  -150,
//  480,
//  1.0 // Skala 1 untuk Ustad
//);

//remaja = new Character(
//  "assets/characters/Remaja.png",
//  950,
//  395,
//  0.2 // Skala 0.5 untuk Remaja (coba nilai lain jika perlu)
//);

//remajaIdle2Img = loadImage("assets/characters/remaja_idle2_mirrored.png");
  
//  // Create shadow buffer
//  shadowBuffer = createGraphics(120, 40);
//  shadowBuffer.beginDraw();
//  shadowBuffer.noStroke();
//  for (int i = 20; i > 0; i--) {
//    shadowBuffer.fill(0, 30 - i, 60 - i * 2);
//    shadowBuffer.ellipse(shadowBuffer.width/2, shadowBuffer.height/2, 100 + i*2, 30 + i);
//  }
//  shadowBuffer.endDraw();
//}

//void draw() {
//  image(backgroundLayer, 0, 0);

//  drawMovingClouds();
//  if (!ustadHasStopped) {
//    ustad.move(0.4);
//    if (ustad.x >= ustadStopX) {
//      ustadHasStopped = true;
//      ustad.x = ustadStopX;
//    }
//  }

//  // Draw shadow under ustadz
//  float ustadWidth = 120 * ustad.scale;
//  float ustadHeight = 180 * ustad.scale;
//  drawCharacterShadow(ustad.x + ustadWidth/2, ustad.y + ustadHeight + 40, ustadWidth * 0.7, ustadHeight * 0.15);
//  ustad.display();

//  // Draw shadow under first remaja
//  float remajaWidth = 120 * remaja.scale;
//  float remajaHeight = 180 * remaja.scale;
//  drawCharacterShadow(remaja.x + remajaWidth/2 + 20, remaja.y + remajaHeight + 105, remajaWidth * 3, remajaHeight * 0.6);
//  remaja.display();

//  // Define remaja2 variables here
//  float remaja2Scale = 0.7;
//  float remaja2X = remaja.x + 150;
//  float remaja2Y = remaja.y + 75;
//  float remaja2Width = 120 * remaja2Scale;
//  float remaja2Height = 180 * remaja2Scale;

//  // Draw shadow for second remaja (before drawing the character)
//  drawCharacterShadow(remaja2X + remaja2Width/2-45, remaja2Y + remaja2Height - 58, remaja2Width * 0.7, remaja2Height * 0.18);

//  // Draw remaja_idle2.png
//  pushMatrix();
//  translate(remaja2X, remaja2Y);
//  scale(remaja2Scale);
//  imageMode(CENTER);
//  image(remajaIdle2Img, 0, 0);
//  imageMode(CORNER);
//  popMatrix();

//  riverAnimOffset += 0.01;
//  riverAnimOffset += 0.01;

//  // --- Speechbox logic from Scene 1 ---
//  int totalChars = speechTexts[currentSpeechIndex].length();
//  int elapsed = millis() - lastSpeechChange;
//  int typingTime = totalChars * typingSpeed;
//  int fadeOutStart = fadeDuration + typingTime + displayTime;
//  int fadeOutEnd = fadeOutStart + fadeDuration;

//  if (dialogueFinished) {
//    // After finished, keep boxAlpha at 0 (hidden)
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

//  // Draw the speech box above the warung only if not finished or fading out
//  if (!dialogueFinished || boxAlpha > 0) {
//    drawSpeechBox(
//      speakers[currentSpeechIndex],
//      speechTexts[currentSpeechIndex].substring(0, min(charsToShow, speechTexts[currentSpeechIndex].length())),
//      300, 125, 700, 120,
//      boxAlpha
//    );
//  }
//}

//// Draw speech box function (copied from Scene 1)
//void drawSpeechBox(String speaker, String text, int x, int y, int w, int h, int alpha) {
//  fill(20, 22, 40, alpha); // dark blue
//  stroke(80, 80, 120, alpha); // lighter border
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

//// Helper function to draw character shadows
//void drawCharacterShadow(float x, float y, float w, float h) {
//  pushMatrix();
//  translate(x, y);
//  scale(w / shadowBuffer.width, h / shadowBuffer.height);
//  imageMode(CENTER);
//  image(shadowBuffer, 0, 0);
//  imageMode(CORNER);
//  popMatrix();
//}

//// ==========================
////      BACKGROUND STATIC
//// ==========================
//void generateStaticBackground() {
//  backgroundLayer.beginDraw();

//  drawGradientSky(backgroundLayer);
//  drawMountainLayers(backgroundLayer);
//  drawRiver(backgroundLayer, 80, 320);
//  drawGround(backgroundLayer);

//  // Pohon-pohon dengan variasi
//  drawStaticTree(backgroundLayer, 150, 285);
//  drawStaticTree(backgroundLayer, 300, 285);
//  drawStaticTree(backgroundLayer, 1100, 285);

//  // Warung dipindah ke kanan
//  drawImprovedWarung(backgroundLayer, 850, 270);
  
//  // Tambahkan elemen-elemen di samping warung
//  drawBench(backgroundLayer, 650, 380);
//  drawSmallGarden(backgroundLayer, 600, 350);
//  drawWell(backgroundLayer, 500, 360);
//  drawFence(backgroundLayer, 480, 420);

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
//      c = lerpColor(color(135, 206, 250), color(255, 255, 255), inter);
//    }
//    pg.stroke(c);
//    pg.line(0, i, width, i);
//  }
//}

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

//void drawRiver(PGraphics pg, int x, int y) {
//  pg.fill(#79D2F6);
//  pg.rect(0, 320, width, 50);
//}

//void drawGround(PGraphics pg) {
//  pg.fill(#B07D53);
//  pg.rect(0, 430, width, height - 430);
//}

//// ==========================
////    Elemen Tambahan
//// ==========================

//// Bangku kayu
//void drawBench(PGraphics pg, int x, int y) {
//  pg.fill(#8B4513);
//  // Tempat duduk
//  pg.rect(x, y, 80, 8);
//  // Sandaran
//  pg.rect(x + 5, y - 25, 70, 8);
//  // Kaki bangku
//  pg.rect(x + 10, y + 8, 6, 20);
//  pg.rect(x + 64, y + 8, 6, 20);
//  // Penyangga sandaran
//  pg.rect(x + 15, y - 17, 4, 17);
//  pg.rect(x + 61, y - 17, 4, 17);
//}

//// Taman kecil dengan bunga
//void drawSmallGarden(PGraphics pg, int x, int y) {
//  // Tanah taman
//  pg.fill(#654321);
//  pg.ellipse(x, y, 60, 40);
  
//  // Bunga-bunga kecil
//  pg.fill(#FF69B4);
//  pg.ellipse(x - 15, y - 5, 8, 8);
//  pg.ellipse(x + 10, y - 8, 8, 8);
//  pg.ellipse(x - 5, y + 5, 8, 8);
  
//  pg.fill(#FFD700);
//  pg.ellipse(x + 15, y - 2, 6, 6);
//  pg.ellipse(x - 10, y + 10, 6, 6);
  
//  // Batang bunga
//  pg.stroke(#228B22);
//  pg.strokeWeight(2);
//  pg.line(x - 15, y - 5, x - 15, y + 15);
//  pg.line(x + 10, y - 8, x + 10, y + 15);
//  pg.line(x - 5, y + 5, x - 5, y + 15);
//  pg.line(x + 15, y - 2, x + 15, y + 15);
//  pg.line(x - 10, y + 10, x - 10, y + 15);
//  pg.noStroke();
//}

//// Sumur kecil
//void drawWell(PGraphics pg, int x, int y) {
//  // Dinding sumur
//  pg.fill(#696969);
//  pg.ellipse(x, y, 40, 40);
//  pg.fill(#2F4F4F);
//  pg.ellipse(x, y, 30, 30);
  
//  // Atap sumur
//  pg.fill(#8B4513);
//  pg.rect(x - 25, y - 40, 50, 8);
  
//  // Tiang penyangga
//  pg.fill(#654321);
//  pg.rect(x - 20, y - 32, 4, 25);
//  pg.rect(x + 16, y - 32, 4, 25);
  
//  // Katrol
//  pg.fill(#8B4513);
//  pg.ellipse(x, y - 36, 12, 12);
  
//  // Tali
//  pg.stroke(#D2691E);
//  pg.strokeWeight(2);
//  pg.line(x, y - 30, x, y - 10);
//  pg.noStroke();
  
//  // Ember kecil
//  pg.fill(#708090);
//  pg.rect(x - 4, y - 12, 8, 6);
//}

//// Pagar kecil
//void drawFence(PGraphics pg, int x, int y) {
//  pg.fill(#8B4513);
//  pg.stroke(#654321);
//  pg.strokeWeight(1);
  
//  // Tiang pagar
//  for (int i = 0; i < 6; i++) {
//    pg.rect(x + i * 25, y, 4, 30);
//    // Papan horizontal
//    if (i < 5) {
//      pg.rect(x + i * 25 + 4, y + 8, 21, 3);
//      pg.rect(x + i * 25 + 4, y + 18, 21, 3);
//    }
//  }
//  pg.noStroke();
//}

//// ==========================
////        Awan Bergerak
//// ==========================
//class Cloud {
//  float x, y, speed;

//  Cloud(float x, float y, float speed) {
//    this.x = x;
//    this.y = y;
//    this.speed = speed;
//  }

//  void move() {
//    x += speed;
//    if (x > width + 50) x = -100;
//  }

//  void display() {
//    fill(255, 230);
//    noStroke();
//    ellipse(x, y, 60, 40);
//    ellipse(x + 20, y + 10, 50, 30);
//    ellipse(x - 20, y + 10, 50, 30);
//  }
//}

//void initClouds() {
//  clouds.add(new Cloud(100, 80, 0.4));
//  clouds.add(new Cloud(300, 100, 0.3));
//  clouds.add(new Cloud(600, 70, 0.2));
//}

//void drawMovingClouds() {
//  for (Cloud c : clouds) {
//    c.move();
//    c.display();
//  }
//}

//// ==========================
////    Sungai Bertekstur
//// ==========================
//void drawFlowingRiver() {
//  noStroke();
//  fill(#5DC8F2);

//  beginShape();
//  float riverWidth = 60;
//  for (int y = 300; y <= 400; y += 10) {
//    float x = 300 + 50 * sin(radians(y * 3));
//    vertex(x - riverWidth / 2, y);
//  }
//  for (int y = 400; y >= 300; y -= 10) {
//    float x = 300 + 50 * sin(radians(y * 3));
//    vertex(x + riverWidth / 2, y);
//  }
//  endShape(CLOSE);

//  stroke(255, 150);
//  for (int y = 305; y < 395; y += 4) {
//    float x = 300 + 50 * sin(radians(y * 3));
//    float offset = 10 * noise(y * 0.05, riverAnimOffset);
//    line(x - 25 + offset, y, x + 25 + offset, y);
//  }
//  noStroke();
//}

//// ==========================
////     Pohon & Warung
//// ==========================
//void drawStaticTree(PGraphics pg, int x, int y) {
//  pg.fill(#4A2F1D);
//  pg.rect(x, y, 45, 145);
//  pg.fill(#2F7033);
//  pg.ellipse(x + 10, y - 50, 75, 75);
//  pg.ellipse(x - 25, y, 65, 65);
//  pg.ellipse(x + 45, y, 80, 60);
//}

//void drawImprovedWarung(PGraphics pg, int x, int y) {
//  int w = 300;
//  int h = 150;

//  // === Color Palette (Brown Pixel Style) ===
//  color roofColor = color(#6B4E31);
//  color wallColor = color(#D8B48A);
//  color textColor = color(#4E2A00);
//  color fishColor = color(#8B5A2B);
//  color accentColor = color(#7A3E00);
//  color stoolColor = color(#5C2E10);
//  color lineColor = color(30, 30, 30);

//  // ==== Background Base ====
//  pg.fill(#A0521D); // optional background
//  pg.noStroke();
//  pg.rect(x, y, w, h);

//  // ==== Roof ====
//  pg.fill(roofColor);
//  pg.rect(x + 10, y + 10, 280, 25);

//  // ==== Front Wall ====
//  pg.fill(wallColor);
//  pg.rect(x + 20, y + 35, 260, 80);

//  // ==== Warung Text ====
//  pg.fill(textColor);
//  pg.textSize(14);
//  pg.text("WARUNG", x + 100, y + 60);
//  pg.text("SIMBOK", x + 110, y + 80);

//  // ==== Side Labels: ESTEH & 01 ====
//  pg.fill(accentColor);
//  pg.textSize(8);
//  pg.text("ESTEH", x + 30, y + 50);
//  pg.text("01", x + 230, y + 50);

//  // ==== Fish Decorations ====
//  pg.fill(fishColor);
//  // Left fish
//  pg.rect(x + 40, y + 65, 15, 6);
//  pg.rect(x + 35, y + 70, 10, 5);
//  // Right fish
//  pg.rect(x + 215, y + 65, 15, 6);
//  pg.rect(x + 230, y + 70, 10, 5);

//  // ==== Counter (Fence) ====
//  pg.fill(wallColor);
//  pg.rect(x + 30, y + 100, 240, 20);

//  // Fence vertical lines
//  pg.stroke(lineColor);
//  pg.strokeWeight(1);
//  for (int i = 0; i <= 8; i++) {
//    float lineX = x + 40 + i * 25;
//    pg.line(lineX, y + 100, lineX, y + 120);
//  }
//  pg.noStroke();

//  // ==== Stools ====
//  pg.fill(stoolColor);
//  for (int i = 0; i < 5; i++) {
//    float sx = x + 45 + i * 45;
//    pg.rect(sx, y + 125, 12, 5);     // seat
//    pg.rect(sx + 4, y + 130, 4, 10); // leg
//  }

//  // ==== Optional Outer Outline ====
//  pg.noFill();
//  pg.stroke(0);
//  pg.strokeWeight(1);
//  pg.rect(x, y, w, h); // outer box
//}
