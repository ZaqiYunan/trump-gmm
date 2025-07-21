
//import processing.sound.*;

//// Global Variables
//SoundFile musikPagi;
//SoundFile suaraBurung;
//PGraphics backgroundLayer;
//ArrayList<Cloud> clouds = new ArrayList<Cloud>();
//ArrayList<Star> stars = new ArrayList<Star>();
//ArrayList<Bird> birds = new ArrayList<Bird>();

//Character ustad;
//Character remaja;
//Character ustaz;
//Character remaja1;
//Character remaja2;
//Character remaja3;

//float awanX1 = 100;
//float awanX2 = 300;
//float ustadStopX = 750; // Posisi X di mana ustad akan berhenti (di depan warung yang dipindah)
//boolean ustadHasStopped = false;
//boolean remajaHasStopped = false;
//float remajaStopX = 730;
//float riverAnimOffset = 0;
//boolean isNight = false;
//float ustadTargetY = 300;   // Y masjid (atur sesuai posisi masjid di background)
//float remajaTargetY = 300;
//boolean ustadMasukMasjid = false;
//boolean remajaMasukMasjid = false;

//float scaleX = 1300.0 / 800.0;
//float scaleY = 720.0 / 600.0;

//// Scene 3 specific variables
//PImage ustadDiam, ustadKanan, ustadKiri;
//PImage remajaDiam, remajaKanan, remajaKiri;
//PImage remajaIdle2;
//float remajaX = 270 * scaleX;
//float remajaIdle2X = 240 * scaleX;
//boolean remajaBerjalan = false;
//float ustadX = 130 * scaleX;

//// Scene 5 specific variables
//float doorX = 650;  // Door X position (adjust as needed)
//float doorY = 430;  // Door Y position (adjust as needed)
//float targetX1 = 250;  // Ustaz stop position
//float targetX2 = 225;  // Remaja1 stop position
//float targetX3 = 225;  // Remaja2 stop position

//boolean ustazEntering = false;
//boolean ustazAtPosition = false;
//boolean remaja1Entering = false;
//boolean remaja1AtPosition = false;
//boolean remaja2Entering = false;
//boolean remaja2AtPosition = false;
//boolean remaja3Entering = false;
//boolean remaja3AtPosition = false;
//int remaja3StartTime = 0;

//boolean ustazWalkingDown = true;
//boolean ustazWalkingLeft = false;

//double ustazSholatScale = 0.8;
//PImage remajaKananMirrored, remajaKiriMirrored, remajaSholat2Mirrored;
//PImage ustadKananMirrored;

//PGraphics shadowBuffer;

//// Scene Management
//int currentScene = 1;
//int sceneStartTime = 0;

//// Dialogue Variables (Unified)
//String[] speechTexts;
//String[] speakers;
//int currentSpeechIndex = 0;
//int speechDuration = 8000; // milliseconds per line
//int lastSpeechChange = 0;  // time of last change
//int typingSpeed = 65; // milliseconds per character
//int charsToShow = 0;
//int fadeDuration = 500; // milliseconds for fade in/out
//int boxAlpha = 0;       // current alpha value (0-255)
//int displayTime = 2000; // ms to show full text before fade out
//boolean dialogueFinished = false;


//// File: Character.pde
//class Character {
//  PImage walkRight;
//  PImage walkLeft;
//  PImage standImage;
//  PImage sholatImage;
//  boolean isSholat = false;
//  float x, y;
//  float scale; // VARIABEL BARU untuk menyimpan skala
//  float sholatScale = 1.0;
//  int frameCount = 0;
//  int frameDelay = 10;

//  // Constructor untuk karakter bergerak (dengan parameter scale)
//  Character(String pathRight, String pathLeft, float startX, float startY, float scale) {
//    walkRight = loadImage(pathRight);
//    walkLeft = loadImage(pathLeft);
//    this.standImage = null;
//    this.x = startX;
//    this.y = startY;
//    this.scale = scale; // Simpan nilai scale
//  }

//  // Constructor untuk karakter diam (dengan parameter scale)
//  Character(String pathStand, float startX, float startY, float scale) {
//    this.standImage = loadImage(pathStand);
//    this.walkRight = null;
//    this.walkLeft = null;
//    this.x = startX;
//    this.y = startY;
//    this.scale = scale; // Simpan nilai scale
//  }
  
//  void move(float speed) {
//    x += speed;
//    frameCount++;
//  }

//  void setSholatImage(String path) {
//    sholatImage = loadImage(path);
//  }

//  void setSholatScale(float scale) {
//    sholatScale = scale;
//  }

//  // Method display yang sekarang menggunakan scale
//  void display() {
//    if (isSholat && sholatImage != null) {
//      image(sholatImage, x, y, sholatImage.width * sholatScale, sholatImage.height * sholatScale);
//    } else if (standImage != null) {
//      // Gambar karakter diam dengan ukuran yang sudah diskalakan
//      image(standImage, x, y, standImage.width * scale, standImage.height * scale);
//    } 
//    else if (walkRight != null && walkLeft != null) {
//      // Pilih frame yang akan ditampilkan
//      PImage currentFrame = ((frameCount / frameDelay) % 2 == 0) ? walkRight : walkLeft;
//      // Gambar karakter bergerak dengan ukuran yang sudah diskalakan
//      image(currentFrame, x, y, currentFrame.width * scale, currentFrame.height * scale);
//    }
//  }
//}


//void setup() {
//  size(1300, 720);
//  frameRate(30);
//  noStroke();

//  // Initialize common assets
//  backgroundLayer = createGraphics(width, height);
//  initClouds();
//  initStars();
//  initBirds();

//  // Load sounds
//  musikPagi = new SoundFile(this, "morning.mp3");
//  suaraBurung = new SoundFile(this, "birds.mp3");
//  musikPagi.amp(0.7);
//  suaraBurung.amp(0.5);
//  musikPagi.loop();
//  suaraBurung.loop();

//  // Initialize shadow buffer
//  shadowBuffer = createGraphics(120, 40);
//  shadowBuffer.beginDraw();
//  shadowBuffer.noStroke();
//  for (int i = 20; i > 0; i--) {
//    shadowBuffer.fill(0, 30 - i, 60 - i * 2);
//    shadowBuffer.ellipse(shadowBuffer.width/2, shadowBuffer.height/2, 100 + i*2, 30 + i);
//  }
//  shadowBuffer.endDraw();

//  // Load Scene 3 specific images
//  ustadDiam = loadImage("assets/characters/UstadDiam.png");
//  ustadKanan = loadImage("assets/characters/UstadKanan.png");
//  ustadKiri = loadImage("assets/characters/UstadKiri.png");
//  remajaDiam = loadImage("assets/characters/Remaja.png");
//  remajaIdle2 = loadImage("assets/characters/remaja_idle2.png");
//  remajaKanan = loadImage("assets/characters/RemajaKanan.png");
//  remajaKiri = loadImage("assets/characters/RemajaKiri.png");

//  // Load Scene 5 specific images
//  remajaKananMirrored = loadImage("assets/characters/RemajaKanan-mirrored.png");
//  remajaKiriMirrored = loadImage("assets/characters/RemajaKiri-mirrored.png");
//  remajaSholat2Mirrored = loadImage("assets/characters/remaja_sholat2-mirrored.png");
//  ustadKananMirrored = loadImage("assets/characters/UstadKanan-mirrored.png");

//  // Initialize characters for Scene 1
//  ustad = new Character("assets/characters/UstadKanan.png", "assets/characters/UstadKiri.png", -150, 480, 1.0);

//  // Initialize characters for Scene 2
//  remaja = new Character("assets/characters/Remaja.png", 950, 395, 0.2);

//  // Initialize characters for Scene 4
//  ustad = new Character("assets/characters/UstadKanan.png", "assets/characters/UstadKiri.png", -150, 400, 1.0);
//  remaja = new Character("assets/characters/RemajaKanan.png", "assets/characters/RemajaKiri.png", -250, 400, 0.3);

//  // Initialize characters for Scene 5
//  ustaz = new Character("assets/characters/UstadKanan-mirrored.png", "assets/characters/UstadKiri-mirrored.png", doorX, doorY, 1.0);
//  ustaz.setSholatImage("assets/characters/UstadSholat-mirrored.png");
//  remaja1 = new Character("assets/characters/RemajaKanan-mirrored.png", "assets/characters/RemajaKiri-mirrored.png", doorX, doorY, 0.5);
//  remaja2 = new Character("assets/characters/RemajaKanan.png", "assets/characters/RemajaKiri.png", 900, doorY, 0.5);
//  remaja3 = new Character("assets/characters/RemajaKanan-mirrored.png", "assets/characters/RemajaKiri-mirrored.png", doorX, doorY, 0.5);

//  // Set initial scene and start time
//  currentScene = 1;
//  sceneStartTime = millis();
//  setSpeechForScene(currentScene);
//  generateBackgroundScene1();
//}

//void draw() {
//  switch (currentScene) {
//    case 1:
//      drawScene1();
//      break;
//    case 2:
//      drawScene2();
//      break;
//    case 3:
//      drawScene3();
//      break;
//    case 4:
//      drawScene4();
//      break;
//    case 5:
//      drawScene5();
//      break;
//  }

//  handleDialogue();

//  // Scene transition logic
//  if (dialogueFinished && millis() - sceneStartTime > (speechTexts.length * (speechDuration + fadeDuration * 2))) {
//    currentScene++;
//    if (currentScene > 5) {
//      // End of animation, loop or stop
//      currentScene = 1; // Loop back to scene 1 for demonstration
//    }
//    sceneStartTime = millis();
//    resetSceneState(currentScene);
//    setSpeechForScene(currentScene);
//  }
//}

//void setSpeechForScene(int sceneNum) {
//  dialogueFinished = false;
//  currentSpeechIndex = 0;
//  lastSpeechChange = millis();
//  charsToShow = 0;
//  boxAlpha = 0;

//  switch (sceneNum) {
//    case 1:
//      speechTexts = new String[]{
//        "Di ufuk barat, mentari mulai terbenam, menyisakan semburat jingga di langit sore.",
//        "Seorang ustaz berjalan tenang di pematang sawah, diiringi gemericik air sungai dan kicauan burung yang kembali ke sarang.",
//        "Gema azan Magrib mulai memanggil dari kejauhan, sebuah seruan damai yang menenangkan jiwa.",
//        "Dengan hati penuh syukur dan langkah yang mantap, beliau bergegas menuju masjid untuk menunaikan salat berjamaah."
//      };
//      speakers = new String[]{
//        "--", "--", "--", "--"
//      };
//      break;
//    case 2:
//      speechTexts = new String[]{
//        "Dalam perjalanannya menuju masjid, sang ustaz melihat dari kejauhan ada sekelompok anak muda yang sedang asyik berbincang di warung.",
//        "Suasana santai menyelimuti mereka, meskipun waktu sholat telah tiba."
//      };
//      speakers = new String[]{
//        "--", "--"
//      };
//      break;
//    case 3:
//      speechTexts = new String[]{
//        "Assalamualaikum. Ayo, kita shalat berjamaah di masjid. Adzan sudah berkumandang...",
//        "Wa'alaikumsalam. Aduh Pak Ustad, sebentar lagi ya, saya lapar sekali, belum makan.",
//        "Justru itu, ayo kita sholat dulu. Nanti setelah sholat, urusan makan saya yang traktir.",
//        "Wah, beneran nih Pak Ustad? Asyik dong!",
//        "Tentu saja. Shalat itu tiang agama, lebih utama dari urusan dunia. Setelah itu, makanannya jadi lebih berkah.",
//        "Hmm, benar juga ya Pak Ustad. Perut lapar, tapi panggilan Allah jauh lebih penting.",
//        "Alhamdulillah. Itu baru pemuda yang hebat. Allah pasti suka. Yuk, kita berangkat sekarang.",
//        "Siap, Pak! Baiklah, mari kita berangkat!"
//      };
//      speakers = new String[]{
//        "Ustad", "Remaja", "Ustad", "Remaja", "Ustad", "Remaja", "Ustad", "Remaja"
//      };
//      break;
//    case 4:
//      speechTexts = new String[]{
//        "Anak-anak muda tersebut menerima ajakan dari ustaz tersebut. Mereka pun berjalan bersama menuju masjid sambil berbincang ringan."
//      };
//      speakers = new String[]{
//        "--"
//      };
//      break;
//    case 5:
//      speechTexts = new String[]{
//        "Akhirnya, mereka semua tiba di masjid dan menunaikan sholat berjamaah.",
//        "Semoga kita semua selalu istiqomah dalam menjalankan ibadah."
//      };
//      speakers = new String[]{
//        "--", "--"
//      };
//      break;
//  }
//}

//void resetSceneState(int sceneNum) {
//  // Reset character positions and states for each scene
//  switch (sceneNum) {
//    case 1:
//      ustad = new Character("assets/characters/UstadKanan.png", "assets/characters/UstadKiri.png", -150, 480, 1.0);
//      initRipples();
//      break;
//    case 2:
//      ustad = new Character("assets/characters/UstadKanan.png", "assets/characters/UstadKiri.png", -150, 480, 1.0);
//      remaja = new Character("assets/characters/Remaja.png", 950, 395, 0.2);
//      ustadHasStopped = false;
//      generateStaticBackgroundScene2();
//      break;
//    case 3:
//      remajaX = 270 * scaleX;
//      remajaIdle2X = 240 * scaleX;
//      remajaBerjalan = false;
//      ustadX = 130 * scaleX;
//      // No specific background generation function for Scene 3, as it's drawn directly in drawScene3
//      break;
//    case 4:
//      ustad = new Character("assets/characters/UstadKanan.png", "assets/characters/UstadKiri.png", -150, 400, 1.0);
//      remaja = new Character("assets/characters/RemajaKanan.png", "assets/characters/RemajaKiri.png", -250, 400, 0.3);
//      ustadHasStopped = false;
//      remajaHasStopped = false;
//      ustadMasukMasjid = false;
//      remajaMasukMasjid = false;
//      generateStaticBackgroundScene4();
//      break;
//    case 5:
//      ustaz = new Character("assets/characters/UstadKanan-mirrored.png", "assets/characters/UstadKiri-mirrored.png", doorX, doorY, 1.0);
//      ustaz.setSholatImage("assets/characters/UstadSholat-mirrored.png");
//      remaja1 = new Character("assets/characters/RemajaKanan-mirrored.png", "assets/characters/RemajaKiri-mirrored.png", doorX, doorY, 0.5);
//      remaja2 = new Character("assets/characters/RemajaKanan.png", "assets/characters/RemajaKiri.png", 900, doorY, 0.5);
//      remaja3 = new Character("assets/characters/RemajaKanan-mirrored.png", "assets/characters/RemajaKiri-mirrored.png", doorX, doorY, 0.5);
//      ustazEntering = true;
//      ustazAtPosition = false;
//      remaja1Entering = false;
//      remaja1AtPosition = false;
//      remaja2Entering = false;
//      remaja2AtPosition = false;
//      remaja3Entering = false;
//      remaja3AtPosition = false;
//      remaja3StartTime = 0;
//      break;
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

//// Scene 1 Functions
//void drawScene1() {
//  image(backgroundLayer, 0, 0);
//  drawMovingClouds();
//  drawFlyingBirds();
//  if (isNight) {
//    drawStars();
//  }
//  drawRiverRipples();
//  ustad.move(1.6);
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
//  // generateBackgroundScene1();
//}

//void generateBackgroundScene1() {
//  backgroundLayer.beginDraw();
//  drawGradientSkyScene1(backgroundLayer);
//  drawMountainLayersScene1(backgroundLayer);
//  drawRiceFieldsScene1(backgroundLayer);
//  backgroundLayer.fill(#4AC7F2);
//  backgroundLayer.rect(0, 380, width, 50);
//  backgroundLayer.fill(#B07D53);
//  backgroundLayer.rect(0, 430, width, height - 430);
//  drawStaticTreeScene1(backgroundLayer, 100, 330, 1.2);
//  drawStaticTreeScene1(backgroundLayer, 180, 330, 1.0);
//  drawStaticTreeScene1(backgroundLayer, 260, 330, 0.8);
//  drawStaticTreeScene1(backgroundLayer, 580, 330, 1.1);
//  drawStaticTreeScene1(backgroundLayer, 680, 330, 0.9);
//  backgroundLayer.stroke(#000000);
//  backgroundLayer.strokeWeight(4);
//  for (int x = 0; x <= width; x += 50) {
//    backgroundLayer.line(x, 440, x, 460);
//    if (x + 50 <= width) {
//      backgroundLayer.line(x, 440, x + 50, 440);
//    }
//  }
//  backgroundLayer.endDraw();
//}

//void drawGradientSkyScene1(PGraphics pg) {
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
//      color c1 = color(255, 150, 100); // Jingga
//      color c2 = color(135, 206, 250); // Biru muda
//      color c = lerpColor(c2, c1, inter * 0.8);
//      pg.stroke(c);
//      pg.line(0, i, width, i);
//    }
//  }
//}

//void drawMountainLayersScene1(PGraphics pg) {
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

//void drawRiceFieldsScene1(PGraphics pg) {
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

//void drawStaticTreeScene1(PGraphics pg, int x, int y, float scale) {
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

//class Ripple {
//  float x, y, length, speed, thickness, alpha, phase, waveAmp, waveFreq;
//  Ripple(float x, float y, float length, float speed, float thickness, float alpha, float waveAmp, float waveFreq) {
//    this.x = x; this.y = y; this.length = length; this.speed = speed; this.thickness = thickness; this.alpha = alpha; this.phase = random(TWO_PI); this.waveAmp = waveAmp; this.waveFreq = waveFreq;
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

//void initRipples() {
//  for (int i = 0; i < 15; i++) {
//    ripples.add(new Ripple(random(width), 385 + random(40), random(20, 60), random(0.4, 1.0), random(1, 2.5), random(80, 180), random(1, 4), random(0.08, 0.18)));
//  }
//}

//void drawRiverRipples() {
//  for (Ripple r : ripples) {
//    r.move(); r.display();
//  }
//}

//// Scene 2 Functions
//void drawScene2() {
//  image(backgroundLayer, 0, 0);
//  drawMovingClouds();
//  if (!ustadHasStopped) {
//    ustad.move(0.4);
//    if (ustad.x >= ustadStopX) {
//      ustadHasStopped = true;
//      ustad.x = ustadStopX;
//    }
//  }
//  float ustadWidth = 120 * ustad.scale;
//  float ustadHeight = 180 * ustad.scale;
//  drawCharacterShadow(ustad.x + ustadWidth/2, ustad.y + ustadHeight + 40, ustadWidth * 0.7, ustadHeight * 0.15);
//  ustad.display();

//  float remajaWidth = 120 * remaja.scale;
//  float remajaHeight = 180 * remaja.scale;
//  drawCharacterShadow(remaja.x + remajaWidth/2 + 20, remaja.y + remajaHeight + 105, remajaWidth * 3, remajaHeight * 0.6);
//  remaja.display();

//  float remaja2Scale = 0.7;
//  float remaja2X = remaja.x + 150;
//  float remaja2Y = remaja.y + 75;
//  float remaja2Width = 120 * remaja2Scale;
//  float remaja2Height = 180 * remaja2Scale;
//  drawCharacterShadow(remaja2X + remaja2Width/2-45, remaja2Y + remaja2Height - 58, remaja2Width * 0.7, remaja2Height * 0.18);
//  pushMatrix();
//  translate(remaja2X, remaja2Y);
//  scale(remaja2Scale);
//  imageMode(CENTER);
//  image(remajaIdle2, 0, 0);
//  imageMode(CORNER);
//  popMatrix();

//  riverAnimOffset += 0.01;
//  // generateStaticBackgroundScene2();
//}

//void drawCharacterShadow(float x, float y, float w, float h) {
//  pushMatrix();
//  translate(x, y);
//  scale(w / shadowBuffer.width, h / shadowBuffer.height);
//  imageMode(CENTER);
//  image(shadowBuffer, 0, 0);
//  imageMode(CORNER);
//  popMatrix();
//}

//void generateStaticBackgroundScene2() {
//  backgroundLayer.beginDraw();
//  drawGradientSkyScene2(backgroundLayer);
//  drawMountainLayersScene2(backgroundLayer);
//  drawRiverScene2(backgroundLayer, 80, 320);
//  drawGroundScene2(backgroundLayer);
//  drawStaticTreeScene2(backgroundLayer, 150, 285);
//  drawStaticTreeScene2(backgroundLayer, 300, 285);
//  drawStaticTreeScene2(backgroundLayer, 1100, 285);
//  drawImprovedWarungScene2(backgroundLayer, 850, 270);
//  drawBenchScene2(backgroundLayer, 650, 380);
//  drawSmallGardenScene2(backgroundLayer, 600, 350);
//  drawWellScene2(backgroundLayer, 500, 360);
//  drawFenceScene2(backgroundLayer, 480, 420);
//  backgroundLayer.endDraw();
//}

//void drawGradientSkyScene2(PGraphics pg) {
//  pg.noFill();
//  for (int i = 0; i <= height / 2; i++) {
//    float inter = map(i, 0, height / 2, 0, 1);
//    color c;
//    if (isNight) {
//      c = lerpColor(color(10, 10, 30), color(30, 30, 60), inter);
//    } else {
//      color biruAtas = color(135, 206, 250);
//      color jinggaBawah = color(255, 165, 0, 200);
//      c = lerpColor(biruAtas, jinggaBawah, inter);
//    }
//    pg.stroke(c);
//    pg.line(0, i, width, i);
//  }
//}

//void drawMountainLayersScene2(PGraphics pg) {
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

//void drawRiverScene2(PGraphics pg, int x, int y) {
//  pg.fill(#79D2F6);
//  pg.rect(0, 320, width, 50);
//}

//void drawGroundScene2(PGraphics pg) {
//  pg.fill(#B07D53);
//  pg.rect(0, 430, width, height - 430);
//}

//void drawBenchScene2(PGraphics pg, int x, int y) {
//  pg.fill(#8B4513);
//  pg.rect(x, y, 80, 8);
//  pg.rect(x + 5, y - 25, 70, 8);
//  pg.rect(x + 10, y + 8, 6, 20);
//  pg.rect(x + 64, y + 8, 6, 20);
//  pg.rect(x + 15, y - 17, 4, 17);
//  pg.rect(x + 61, y - 17, 4, 17);
//}

//void drawSmallGardenScene2(PGraphics pg, int x, int y) {
//  pg.fill(#654321);
//  pg.ellipse(x, y, 60, 40);
//  pg.fill(#FF69B4);
//  pg.ellipse(x - 15, y - 5, 8, 8);
//  pg.ellipse(x + 10, y - 8, 8, 8);
//  pg.ellipse(x - 5, y + 5, 8, 8);
//  pg.fill(#FFD700);
//  pg.ellipse(x + 15, y - 2, 6, 6);
//  pg.ellipse(x - 10, y + 10, 6, 6);
//  pg.stroke(#228B22);
//  pg.strokeWeight(2);
//  pg.line(x - 15, y - 5, x - 15, y + 15);
//  pg.line(x + 10, y - 8, x + 10, y + 15);
//  pg.line(x - 5, y + 5, x - 5, y + 15);
//  pg.line(x + 15, y - 2, x + 15, y + 15);
//  pg.line(x - 10, y + 10, x - 10, y + 15);
//  pg.noStroke();
//}

//void drawWellScene2(PGraphics pg, int x, int y) {
//  pg.fill(#696969);
//  pg.ellipse(x, y, 40, 40);
//  pg.fill(#2F4F4F);
//  pg.ellipse(x, y, 30, 30);
//  pg.fill(#8B4513);
//  pg.rect(x - 25, y - 40, 50, 8);
//  pg.fill(#654321);
//  pg.rect(x - 20, y - 32, 4, 25);
//  pg.rect(x + 16, y - 32, 4, 25);
//  pg.fill(#8B4513);
//  pg.ellipse(x, y - 36, 12, 12);
//  pg.stroke(#D2691E);
//  pg.strokeWeight(2);
//  pg.line(x, y - 30, x, y - 10);
//  pg.noStroke();
//  pg.fill(#708090);
//  pg.rect(x - 4, y - 12, 8, 6);
//}

//void drawFenceScene2(PGraphics pg, int x, int y) {
//  pg.fill(#8B4513);
//  pg.stroke(#654321);
//  pg.strokeWeight(1);
//  for (int i = 0; i < 6; i++) {
//    pg.rect(x + i * 25, y, 4, 30);
//    if (i < 5) {
//      pg.rect(x + i * 25 + 4, y + 8, 21, 3);
//      pg.rect(x + i * 25 + 4, y + 18, 21, 3);
//    }
//  }
//  pg.noStroke();
//}

//void drawStaticTreeScene2(PGraphics pg, int x, int y) {
//  pg.fill(#4A2F1D);
//  pg.rect(x, y, 45, 145);
//  pg.fill(#2F7033);
//  pg.ellipse(x + 10, y - 50, 75, 75);
//  pg.ellipse(x - 25, y, 65, 65);
//  pg.ellipse(x + 45, y, 80, 60);
//}

//void drawImprovedWarungScene2(PGraphics pg, int x, int y) {
//  int w = 300;
//  int h = 150;
//  color roofColor = color(#6B4E31);
//  color wallColor = color(#D8B48A);
//  color textColor = color(#4E2A00);
//  color fishColor = color(#8B5A2B);
//  color accentColor = color(#7A3E00);
//  color stoolColor = color(#5C2E10);
//  color lineColor = color(30, 30, 30);
//  pg.fill(#A0521D);
//  pg.noStroke();
//  pg.rect(x, y, w, h);
//  pg.fill(roofColor);
//  pg.rect(x + 10, y + 10, 280, 25);
//  pg.fill(wallColor);
//  pg.rect(x + 20, y + 35, 260, 80);
//  pg.fill(textColor);
//  pg.textSize(14);
//  pg.text("WARUNG", x + 100, y + 60);
//  pg.text("SIMBOK", x + 110, y + 80);
//  pg.fill(accentColor);
//  pg.textSize(8);
//  pg.text("ESTEH", x + 30, y + 50);
//  pg.text("01", x + 230, y + 50);
//  pg.fill(fishColor);
//  pg.rect(x + 40, y + 65, 15, 6);
//  pg.rect(x + 35, y + 70, 10, 5);
//  pg.rect(x + 215, y + 65, 15, 6);
//  pg.rect(x + 230, y + 70, 10, 5);
//  pg.fill(wallColor);
//  pg.rect(x + 30, y + 100, 240, 20);
//  pg.stroke(lineColor);
//  pg.strokeWeight(1);
//  for (int i = 0; i <= 8; i++) {
//    float lineX = x + 40 + i * 25;
//    pg.line(lineX, y + 100, lineX, y + 120);
//  }
//  pg.noStroke();
//  pg.fill(stoolColor);
//  for (int i = 0; i < 5; i++) {
//    float sx = x + 45 + i * 45;
//    pg.rect(sx, y + 125, 12, 5);
//    pg.rect(sx + 4, y + 130, 4, 10);
//  }
//}

//// Scene 3 Functions
//void drawScene3() {
//  drawGradientSkyScene3();
//  drawFlyingBirds();
//  drawMovingClouds();
//  drawTexturedGroundScene3();
//  drawWarungScene2StyleScene3(100 * scaleX, 250 * scaleY);
//  drawTreeLargeScene3(500 * scaleX, 210 * scaleY);
//  drawTreeLargeScene3(650 * scaleX, 220 * scaleY);
//  drawPotScene3(630 * scaleX, 420 * scaleY);
//  drawBenchScene3(550 * scaleX, 430 * scaleY);
//  drawChattingCharactersScene3();
//}

//void drawGradientSkyScene3() {
//  color colorAtas = color(100, 150, 220);
//  color colorBawah = color(255, 180, 70);
//  int horizonY = (int)(height * 0.6);
//  for (int y = 0; y < horizonY; y++) {
//    float inter = map(y, 0, horizonY, 0, 1);
//    color c = lerpColor(colorAtas, colorBawah, inter);
//    stroke(c);
//    line(0, y, width, y);
//  }
//  noStroke();
//}

//void drawChattingCharactersScene3() {
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

//void drawTexturedGroundScene3() {
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

//void drawWarungScene2StyleScene3(float x, float y) {
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

//void drawTreeLargeScene3(float x, float y) {
//  float s = scaleX;
//  fill(#5C3317);
//  rect(x, y + (100 * s), 30 * s, 120 * s);
//  fill(#99CC33);
//  ellipse(x + (15 * s), y + (50 * s), 140 * s, 140 * s);
//  fill(#77AA22);
//  ellipse(x - (30 * s), y + (70 * s), 100 * s, 100 * s);
//  ellipse(x + (50 * s), y + (70 * s), 100 * s, 100 * s);
//}

//void drawPotScene3(float x, float y) {
//  float s = scaleX;
//  fill(#B97A57);
//  rect(x, y, 30 * s, 20 * s);
//  fill(#228B22);
//  ellipse(x + (15 * s), y, 35 * s, 20 * s);
//}

//void drawBenchScene3(float x, float y) {
//  float s = scaleX;
//  fill(#654321);
//  rect(x, y, 60 * s, 10 * s);
//  rect(x + (5 * s), y + (10 * s), 5 * s, 10 * s);
//  rect(x + (50 * s), y + (10 * s), 5 * s, 10 * s);
//}

//// Scene 4 Functions
//void drawScene4() {
//  image(backgroundLayer, 0, 0);
//  drawMovingClouds();
//  if (!ustadHasStopped) {
//    ustad.move(1.0);
//    if (ustad.x >= ustadStopX) {
//      ustadHasStopped = true;
//      ustad.x = ustadStopX;
//    }
//  }
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
  
//  if (!remajaHasStopped) {
//    remaja.move(1.0);
//    if (remaja.x >= remajaStopX) {
//      remajaHasStopped = true;
//      remaja.x = remajaStopX;
//    }
//  }
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
//  // generateStaticBackgroundScene4();
//}

//void generateStaticBackgroundScene4() {
//  backgroundLayer.beginDraw();
//  drawGradientSkyScene4(backgroundLayer);
//  drawMountainLayersScene4(backgroundLayer);
//  drawRiceFieldsScene4(backgroundLayer);
//  drawGroundScene4(backgroundLayer);
//  drawStaticTreeScene4(backgroundLayer, 80, 320, 1.2);
//  drawStaticTreeScene4(backgroundLayer, 180, 315, 1.0);
//  drawStaticTreeScene4(backgroundLayer, 280, 325, 0.8);
//  drawStaticTreeScene4(backgroundLayer, 950, 310, 1.1);
//  drawStaticTreeScene4(backgroundLayer, 1050, 315, 0.9);
//  drawBeautifulMasjidScene4(backgroundLayer, 400, 250);
//  drawStreetLightsScene4(backgroundLayer);
//  backgroundLayer.endDraw();
//}

//void drawGradientSkyScene4(PGraphics pg) {
//  pg.noFill();
//  for (int i = 0; i <= height / 2; i++) {
//    float inter = map(i, 0, height / 2, 0, 1);
//    color c;
//    if (isNight) {
//      c = lerpColor(color(10, 10, 30), color(30, 30, 60), inter);
//    } else {
//      color biruAtas = color(135, 206, 250);
//      color jinggaBawah = color(255, 165, 0, 200);
//      c = lerpColor(biruAtas, jinggaBawah, inter);
//    }
//    pg.stroke(c);
//    pg.line(0, i, width, i);
//  }
//}

//void drawMountainLayersScene4(PGraphics pg) {
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

//void drawRiceFieldsScene4(PGraphics pg) {
//  pg.fill(108, 217, 77);
//  pg.rect(0, 320, width, 80);
//  pg.stroke(90, 180, 60);
//  pg.strokeWeight(1);
//  for (int i = 0; i < 15; i++) {
//    float y = 320 + i * 5;
//    pg.line(0, y, width, y);
//  }
//  pg.stroke(70, 140, 50);
//  pg.strokeWeight(2);
//  for (int x = 100; x < width; x += 200) {
//    pg.line(x, 320, x, 400);
//  }
//  pg.noStroke();
//}

//void drawGroundScene4(PGraphics pg) {
//  pg.fill(#B07D53);
//  pg.rect(0, 430, width, height - 430);
//}

//void drawStaticTreeScene4(PGraphics pg, int x, int y, float scale) {
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

//void drawBeautifulMasjidScene4(PGraphics pg, int x, int y) {
//  pg.pushMatrix();
//  pg.translate(x, y);
//  pg.fill(0, 0, 0, 70);
//  pg.rect(28, 12, 380, 220);
//  pg.fill(200, 200, 205);
//  pg.stroke(160, 160, 165);
//  pg.strokeWeight(2);
//  pg.rect(0, 180, 420, 30);
//  for (int i = 0; i < 4; i++) {
//    pg.fill(220 - i * 10, 220 - i * 10, 225 - i * 10);
//    pg.rect(40 + i * 5, 180 + i * 5, 340 - i * 10, 8);
//  }
//  pg.fill(248, 248, 253);
//  pg.stroke(210, 210, 215);
//  pg.strokeWeight(3);
//  pg.rect(25, 0, 370, 180);
//  pg.fill(235, 235, 240);
//  pg.rect(20, 5, 380, 12);
//  pg.rect(20, 162, 380, 12);
//  drawGeometricPatternScene4(pg, 35, 25, 350, 130);
//  drawEnhancedDomeScene4(pg, 210, -30, 220, 140, color(255, 220, 30), color(255, 240, 120));
//  drawEnhancedDomeScene4(pg, 100, 10, 110, 75, color(255, 220, 30), color(255, 240, 120));
//  drawEnhancedDomeScene4(pg, 320, 10, 110, 75, color(255, 220, 30), color(255, 240, 120));
//  drawEnhancedMinaretScene4(pg, -90, -150, 55, 330);
//  drawEnhancedMinaretScene4(pg, 455, -150, 55, 330);
//  drawEnhancedMainDoorScene4(pg, 170, 50);
//  drawEnhancedIslamicWindowScene4(pg, 60, 50);
//  drawEnhancedIslamicWindowScene4(pg, 290, 50);
//  drawEnhancedCalligraphyScene4(pg, 135, -80);
//  drawEnhancedCrescentMoonScene4(pg, 210, -130);
//  drawEnhancedMasjidLightsScene4(pg);
//  drawAdditionalOrnamentsScene4(pg);
//  pg.noStroke();
//  pg.popMatrix();
//}

//void drawGeometricPatternScene4(PGraphics pg, float x, float y, float w, float h) {
//  pg.stroke(200, 200, 205);
//  pg.strokeWeight(1);
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
//  pg.fill(220, 220, 225);
//  for (int i = 0; i < 12; i++) {
//    for (int j = 0; j < 4; j++) {
//      float px = x + 15 + i * 28;
//      float py = y + 15 + j * 28;
//      drawSmallStarScene4(pg, px, py, 3);
//    }
//  }
//  pg.noStroke();
//}

//void drawEnhancedDomeScene4(PGraphics pg, float x, float y, float w, float h, color c1, color c2) {
//  for (int i = 0; i < h/2; i++) {
//    float inter = map(i, 0, h/2, 0, 1);
//    color c = lerpColor(c1, c2, inter);
//    pg.stroke(c);
//    pg.strokeWeight(1);
//    pg.line(x - w/2 + i/2, y + i, x + w/2 - i/2, y + i);
//  }
//  pg.stroke(200, 160, 0);
//  pg.strokeWeight(3);
//  pg.noFill();
//  pg.arc(x, y + h/4, w, h, PI, TWO_PI);
//  pg.strokeWeight(2);
//  for (int i = 0; i < 8; i++) {
//    float angle = map(i, 0, 8, PI, TWO_PI);
//    float x1 = x + cos(angle) * w/2.5;
//    float y1 = y + sin(angle) * h/4 + h/4;
//    float x2 = x + cos(angle) * w/3;
//    float y2 = y + sin(angle) * h/5 + h/4;
//    pg.line(x1, y1, x2, y2);
//  }
//  pg.fill(255, 215, 0);
//  pg.noStroke();
//  pg.ellipse(x, y - 5, 15, 10);
//  pg.noStroke();
//}

//void drawEnhancedMinaretScene4(PGraphics pg, float x, float y, float w, float h) {
//  pg.fill(240, 240, 245);
//  pg.stroke(200, 200, 205);
//  pg.strokeWeight(3);
//  pg.rect(x - 5, y + h - 30, w + 10, 30);
//  pg.fill(248, 248, 253);
//  pg.rect(x, y, w, h);
//  pg.fill(235, 235, 240);
//  for (int i = 0; i < 12; i++) {
//    float yPos = y + i * 27;
//    pg.rect(x - 3, yPos, w + 6, 6);
//    pg.fill(220, 220, 225);
//    pg.rect(x + 5, yPos + 1, w - 10, 4);
//    pg.fill(235, 235, 240);
//  }
//  pg.fill(230, 230, 235);
//  pg.rect(x - 8, y + h/2 - 20, w + 16, 25);
//  pg.stroke(200, 200, 205);
//  pg.strokeWeight(2);
//  for (int i = 0; i < 8; i++) {
//    pg.line(x - 5 + i * 8, y + h/2 - 20, x - 5 + i * 8, y + h/2 - 5);
//  }
//  drawEnhancedDomeScene4(pg, x + w/2, y - 20, w + 20, 50, color(255, 220, 30), color(255, 240, 120));
//  pg.stroke(255, 215, 0);
//  pg.strokeWeight(5);
//  pg.noFill();
//  pg.arc(x + w/2, y - 40, 30, 30, QUARTER_PI, PI + QUARTER_PI);
//  pg.strokeWeight(4);
//  pg.line(x + w/2, y - 55, x + w/2, y - 75);
//  pg.fill(255, 215, 0);
//  pg.noStroke();
//  drawStarScene4(pg, x + w/2 + 25, y - 50, 6);
//  pg.noStroke();
//}

//void drawEnhancedMainDoorScene4(PGraphics pg, float x, float y) {
//  pg.fill(120, 80, 40);
//  pg.stroke(90, 60, 30);
//  pg.strokeWeight(3);
//  pg.rect(x, y, 90, 130);
//  pg.noFill();
//  pg.strokeWeight(4);
//  pg.arc(x + 45, y, 90, 60, PI, TWO_PI);
//  pg.fill(140, 100, 60);
//  pg.rect(x + 5, y + 5, 80, 120);
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
//  pg.fill(255, 215, 0);
//  pg.ellipse(x + 75, y + 65, 18, 18);
//  pg.fill(200, 170, 0);
//  pg.ellipse(x + 75, y + 65, 12, 12);
//  pg.stroke(255, 215, 0);
//  pg.strokeWeight(3);
//  pg.noFill();
//  pg.ellipse(x + 75, y + 65, 25, 25);
//  pg.noStroke();
//}

//void drawEnhancedIslamicWindowScene4(PGraphics pg, float x, float y) {
//  pg.fill(160, 200, 240);
//  pg.stroke(120, 160, 200);
//  pg.strokeWeight(3);
//  pg.rect(x, y, 70, 90);
//  pg.arc(x + 35, y, 70, 70, PI, TWO_PI);
//  pg.fill(130, 170, 210);
//  pg.rect(x + 3, y + 3, 64, 84);
//  pg.arc(x + 35, y, 64, 64, PI, TWO_PI);
//  pg.fill(120, 160, 200);
//  pg.line(x + 35, y, x + 35, y + 87);
//  pg.line(x + 3, y + 45, x + 67, y + 45);
//  pg.stroke(100, 140, 180);
//  pg.strokeWeight(2);
//  for (int i = 0; i < 8; i++) {
//    pg.line(x + 8 + i * 8, y + 8, x + 8 + i * 8, y + 82);
//  }
//  for (int i = 0; i < 10; i++) {
//    pg.line(x + 8, y + 8 + i * 8, x + 62, y + 8 + i * 8);
//  }
//  pg.fill(255, 215, 0);
//  pg.noStroke();
//  drawStarScene4(pg, x + 35, y + 30, 8);
//  pg.noStroke();
//}

//void drawEnhancedCalligraphyScene4(PGraphics pg, float x, float y) {
//  pg.fill(40, 120, 70);
//  pg.stroke(30, 100, 60);
//  pg.strokeWeight(2);
//  pg.rect(x, y, 170, 55);
//  pg.fill(50, 140, 80);
//  pg.rect(x + 3, y + 3, 164, 49);
//  pg.stroke(255, 215, 0);
//  pg.strokeWeight(2);
//  pg.noFill();
//  pg.rect(x + 5, y + 5, 160, 45);
//  pg.fill(255, 215, 0);
//  pg.textSize(22);
//  pg.textAlign(CENTER);
//  pg.text("بِسْمِ اللّٰهِ الرَّحْمٰنِ الرَّحِيْمِ", x + 85, y + 20);
//  pg.textSize(16);
//  pg.text("MASJID AL-IKHLAS", x + 85, y + 40);
//  pg.fill(255, 215, 0);
//  pg.noStroke();
//  for (int i = 0; i < 4; i++) {
//    float cornerX = x + (i % 2) * 160;
//    float cornerY = y + (i / 2) * 45;
//    drawSmallStarScene4(pg, cornerX + 8, cornerY + 8, 4);
//  }
//  pg.textAlign(LEFT);
//  pg.noStroke();
//}

//void drawEnhancedCrescentMoonScene4(PGraphics pg, float x, float y) {
//  pg.stroke(255, 215, 0);
//  pg.strokeWeight(8);
//  pg.noFill();
//  pg.arc(x, y, 60, 60, QUARTER_PI, PI + QUARTER_PI);
//  pg.stroke(255, 240, 150);
//  pg.strokeWeight(4);
//  pg.arc(x - 3, y - 3, 50, 50, QUARTER_PI, PI + QUARTER_PI);
//  pg.stroke(255, 215, 0);
//  pg.strokeWeight(6);
//  pg.line(x, y - 30, x, y - 70);
//  pg.fill(255, 215, 0);
//  pg.noStroke();
//  for (int i = 0; i < 3; i++) {
//    pg.ellipse(x, y - 40 - i * 10, 8, 8);
//  }
//  pg.fill(255, 215, 0);
//  drawStarScene4(pg, x + 35, y - 15, 10);
//  drawStarScene4(pg, x + 25, y - 35, 5);
//  drawStarScene4(pg, x + 45, y - 25, 4);
//  pg.noStroke();
//}

//void drawEnhancedMasjidLightsScene4(PGraphics pg) {
//  if (isNight) {
//    pg.fill(255, 255, 150, 220);
//    pg.ellipse(60, 90, 20, 20);
//    pg.ellipse(360, 90, 20, 20);
//    pg.ellipse(210, 20, 25, 25);
//    pg.ellipse(140, 140, 15, 15);
//    pg.ellipse(280, 140, 15, 15);
//    pg.fill(255, 255, 0, 60);
//    pg.ellipse(60, 90, 50, 50);
//    pg.ellipse(360, 90, 50, 50);
//    pg.ellipse(210, 20, 60, 60);
//    pg.fill(255, 255, 0, 30);
//    pg.ellipse(60, 90, 80, 80);
//    pg.ellipse(360, 90, 80, 80);
//    pg.ellipse(210, 20, 90, 90);
//    pg.fill(255, 255, 100, 150);
//    pg.ellipse(95, 95, 40, 40);
//    pg.ellipse(325, 95, 40, 40);
//  }
//}

//void drawAdditionalOrnamentsScene4(PGraphics pg) {
//  pg.fill(220, 220, 225);
//  pg.noStroke();
//  for (int i = 0; i < 3; i++) {
//    float x = 80 + i * 120;
//    float y = 30;
//    pg.ellipse(x, y, 25, 25);
//    pg.fill(200, 200, 205);
//    pg.ellipse(x, y, 20, 20);
//    pg.fill(220, 220, 225);
//    drawStarScene4(pg, x, y, 6);
//  }
//  pg.stroke(200, 200, 205);
//  pg.strokeWeight(2);
//  for (int i = 0; i < 15; i++) {
//    float x = 30 + i * 25;
//    pg.line(x, 8, x + 10, 15);
//    pg.line(x + 10, 15, x + 20, 8);
//  }
//  pg.noStroke();
//}

//void drawStarScene4(PGraphics pg, float x, float y, float radius) {
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

//void drawSmallStarScene4(PGraphics pg, float x, float y, float radius) {
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

//void drawStreetLightsScene4(PGraphics pg) {
//  for (int i = 200; i < width; i += 300) {
//    pg.fill(80, 80, 80);
//    pg.rect(i, 430, 8, 60);
//    pg.fill(isNight ? color(255, 255, 150) : color(200, 200, 200));
//    pg.ellipse(i + 4, 460, 20, 15);
//    if (isNight) {
//      pg.fill(255, 255, 0, 30);
//      pg.ellipse(i + 4, 480, 100, 80);
//    }
//  }
//}

//// Scene 5 Functions
//void drawScene5() {
//  background(#EAEAEA);
//  drawMihrabScene5();
//  drawCarpetScene5();
//  drawHangingLampScene5();
//  drawWallDecorScene5();
//  drawWindowsScene5();

//  if (ustazEntering && !ustazAtPosition) {
//    if (ustaz.x > targetX1) {
//      ustaz.move(-1.5);
//    } else {
//      ustaz.x -= 30;
//      ustazAtPosition = true;
//      ustaz.isSholat = true;
//      remaja1Entering = true;
//      remaja3StartTime = millis();
//    }
//  }

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

//  if (remaja2Entering && !remaja2AtPosition) {
//    if (remaja2.x < targetX3) {
//      remaja2.move(1.5);
//    } else {
//      remaja2AtPosition = true;
//    }
//  }
  
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
//}

//void drawMihrabScene5() {
//  float s = scaleX;
//  fill(#D4AF37);
//  stroke(0);
//  strokeWeight(2 * s);
//  beginShape();
//  vertex(350 * scaleX, 300 * scaleY);
//  bezierVertex(350 * scaleX, 200 * scaleY, 450 * scaleX, 200 * scaleY, 450 * scaleX, 300 * scaleY);
//  vertex(450 * scaleX, 450 * scaleY);
//  vertex(350 * scaleX, 450 * scaleY);
//  endShape(CLOSE);
//}

//void drawCarpetScene5() {
//  float s = scaleX;
//  noStroke();
//  fill(#B22222);
//  rect(0, 450 * scaleY, width, 150 * scaleY);
//  stroke(255);
//  strokeWeight(2 * s);
//  for (int i = (int)(50 * s); i < width; i += (int)(100 * s)) {
//    line(i, 450 * scaleY, i, height);
//  }
//}

//void drawHangingLampScene5() {
//  float s = scaleX;
//  stroke(0);
//  strokeWeight(4 * s);
//  line(width/2, 0, width/2, 120 * s);
//  fill(#FFD700);
//  noStroke();
//  ellipse(width/2, 140 * s, 100 * s, 60 * s);
//  fill(255, 255, 150);
//  ellipse(width/2, 140 * s, 60 * s, 30 * s);
//}

//void drawWallDecorScene5() {
//  fill(#A0522D);
//  textAlign(CENTER, CENTER);
//  textSize(24 * scaleX);
//  text("اللّه", 200 * scaleX, 200 * scaleY);
//  text("محمد", 600 * scaleX, 200 * scaleY);
//}

//void drawWindowsScene5() {
//  float s = scaleX;
//  fill(#ADD8E6);
//  stroke(0);
//  strokeWeight(2 * s);
//  arc(150 * s, 300 * scaleY, 60 * s, 120 * s, PI, TWO_PI);
//  rect(120 * s, 300 * scaleY, 60 * s, 100 * scaleY);
//  arc(650 * s, 300 * scaleY, 60 * s, 120 * s, PI, TWO_PI);
//  rect(620 * s, 300 * scaleY, 60 * s, 100 * scaleY);
//}

//// Common functions (Clouds, Stars, Birds)
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

//class Bird {
//  PVector position;
//  PVector velocity;
//  float size;
//  int flapSpeed;

//  Bird(float x, float y) {
//    position = new PVector(x, y);
//    velocity = new PVector(random(1.5, 3.0), random(-0.5, 0.5));
//    size = random(8, 15);
//    flapSpeed = int(random(5, 10));
//  }

//  void update() {
//    position.add(velocity);
//    if (position.x > width + size * 2) {
//      position.x = -size * 2;
//      position.y = random(50, 200);
//    }
//  }

//  void display() {
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

//void initBirds() {
//  for (int i = 0; i < 7; i++) {
//    birds.add(new Bird(random(width), random(50, 200)));
//  }
//}

//void drawFlyingBirds() {
//  for (Bird b : birds) {
//    b.update();
//    b.display();
//  }
//}
