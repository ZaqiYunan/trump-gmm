//float scaleX = 1300.0 / 800.0;
//float scaleY = 720.0 / 600.0;

//void setup() {
//  size(1300, 720); // Ukuran kanvas baru
//  // noLoop(); // Dihapus agar bisa ditambahkan animasi di kemudian hari jika perlu

//  ustaz = new Character(
//    "assets/characters/UstadKanan-mirrored.png",
//    "assets/characters/UstadKiri-mirrored.png",
//    doorX,
//    doorY, // langsung di pintu
//    1.0
//  );
//  ustaz.setSholatImage("assets/characters/UstadSholat-mirrored.png");
//  // ustaz.setSholatScale(0.8); // fungsi ini tidak ada, jadi dihapus
//  remaja1 = new Character(
//    "assets/characters/RemajaKanan-mirrored.png",
//    "assets/characters/RemajaKiri-mirrored.png",
//    doorX,
//    doorY,
//    0.5
//  );
//  remaja2 = new Character(
//    "assets/characters/RemajaKanan.png",
//    "assets/characters/RemajaKiri.png",
//    900,
//    doorY,
//    0.5
//  );
//  remajaKananMirrored = loadImage("assets/characters/RemajaKanan-mirrored.png");
//  remajaKiriMirrored = loadImage("assets/characters/RemajaKiri-mirrored.png");
//  remajaSholat2Mirrored = loadImage("assets/characters/remaja_sholat2-mirrored.png");
//  ustadKananMirrored = loadImage("assets/characters/UstadKanan-mirrored.png");
//  ustazEntering = true;
//  remaja3 = new Character(
//    "assets/characters/RemajaKanan-mirrored.png",
//    "assets/characters/RemajaKiri-mirrored.png",
//    doorX,
//    doorY,
//    0.5
//  );
//}

//void draw() {
//  background(#EAEAEA); // Warna dinding lembut

//  drawMihrab();
//  drawCarpet();
//  drawHangingLamp();
//  drawWallDecor();
//  drawWindows();

//  // Animate ustaz: dari pintu langsung jalan ke kiri
//  if (ustazEntering && !ustazAtPosition) {
//    if (ustaz.x > targetX1) {
//      ustaz.move(-1.5); // jalan ke kiri
//    } else {
//      ustaz.x -= 30; // geser lebih maju ke kiri sebelum sholat
//      ustazAtPosition = true;
//      ustaz.isSholat = true; // animasi sholat
//      remaja1Entering = true;
//      remaja3StartTime = millis(); // catat waktu mulai remaja3
//    }
//  }

//  // Animate first remaja
//  float ustadWidth = ustadKananMirrored != null ? ustadKananMirrored.width * ustaz.scale : 50;
//  float ustadCenter = ustaz.x + ustadWidth / 2;
//  if (remaja1Entering && !remaja1AtPosition) {
//    if (remaja1.x > ustadCenter) {
//      remaja1.move(-1.5);
//    } else {
//      remaja1AtPosition = true;
//      remaja2Entering = true;
//    }
//  }

//  // Animate remaja3 (delay 1 detik setelah remaja1 mulai)
//  if (!remaja3Entering && remaja1Entering && millis() - remaja3StartTime > 1000) {
//    remaja3Entering = true;
//  }
//  if (remaja3Entering && !remaja3AtPosition) {
//    if (remaja3.x > ustadCenter) {
//      remaja3.move(-1.5);
//    } else {
//      remaja3AtPosition = true;
//    }
//  }

//  // Animate second remaja
//  if (remaja2Entering && !remaja2AtPosition) {
//    if (remaja2.x < targetX3) {
//      remaja2.move(1.5); // Use move() for walking animation
//    } else {
//      remaja2AtPosition = true;
//    }
//  }
  
//  // Draw characters in correct order: remaja3 (belakang), ustaz, remaja1 (depan)
//  if (remaja3Entering) {
//    float rw = remajaKananMirrored != null ? remajaKananMirrored.width * remaja3.scale : 50;
//    float rh = remajaKananMirrored != null ? remajaKananMirrored.height * remaja3.scale : 50;
//    if (remaja3AtPosition) {
//      if (remajaSholat2Mirrored != null) {
//        image(remajaSholat2Mirrored, remaja3.x, remaja3.y, rw, rh);
//      } else {
//        remaja3.display();
//      }
//    } else {
//      PImage remStep = (frameCount / 10) % 2 == 0 ? remajaKananMirrored : remajaKiriMirrored;
//      if (remStep != null) {
//        image(remStep, remaja3.x, remaja3.y, rw, rh);
//      } else {
//        remaja3.display();
//      }
//    }
//  }
//  if (ustazEntering) ustaz.display();
//  if (remaja1Entering) {
//    float rw = remajaKananMirrored != null ? remajaKananMirrored.width * remaja1.scale : 50;
//    float rh = remajaKananMirrored != null ? remajaKananMirrored.height * remaja1.scale : 50;
//    if (remaja1AtPosition) {
//      if (remajaSholat2Mirrored != null) {
//        image(remajaSholat2Mirrored, remaja1.x, remaja1.y, rw, rh);
//      } else {
//        remaja1.display();
//      }
//    } else {
//      PImage remStep = (frameCount / 10) % 2 == 0 ? remajaKananMirrored : remajaKiriMirrored;
//      if (remStep != null) {
//        image(remStep, remaja1.x, remaja1.y, rw, rh);
//      } else {
//        remaja1.display();
//      }
//    }
//  }
//  if (remaja2Entering) remaja2.display();

//  // Speechbox logic
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

//// Dynamic speech variables for Scene 5
//String[] speechTexts = {
//  "=",
//  "="
//};
//String[] speakers = {
//  "--",
//  "--"
//};
//int currentSpeechIndex = 0;
//int speechDuration = 8000; // milliseconds per line
//int lastSpeechChange = 0;  // time of last change
//int typingSpeed = 65; // milliseconds per character
//int charsToShow = 0;
//int fadeDuration = 500; // milliseconds for fade in/out
//int boxAlpha = 0;       // current alpha value (0-255)
//int displayTime = 2000; // ms to show full text before fade out
//boolean dialogueFinished = false;

//// Character declarations
//Character ustaz;
//Character remaja1;
//Character remaja2;
//Character remaja3;
//boolean remaja3Entering = false;
//boolean remaja3AtPosition = false;
//int remaja3StartTime = 0;

//// Position and state variables
//float doorX = 650;  // Door X position (adjust as needed)
//float doorY = 430;  // Door Y position (adjust as needed)
//float targetX1 = 250;  // Ustaz stop position
//float targetX2 = 225;  // Remaja1 stop position
//float targetX3 = 225;  // Remaja2 stop position

//boolean ustazEntering = false;
//boolean remaja1Entering = false;
//boolean remaja2Entering = false;
//boolean ustazAtPosition = false;
//boolean remaja1AtPosition = false;
//boolean remaja2AtPosition = false;

//boolean ustazWalkingDown = true;
//boolean ustazWalkingLeft = false;

//// Tambahkan variabel skala sholat ustaz
//double ustazSholatScale = 0.8;

//// Tambahkan variabel gambar remajaKananMirrored, remajaKiriMirrored, remajaSholat2Mirrored
//PImage remajaKananMirrored, remajaKiriMirrored, remajaSholat2Mirrored;

//// Tambahkan variabel gambar ustadKananMirrored
//PImage ustadKananMirrored;

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
