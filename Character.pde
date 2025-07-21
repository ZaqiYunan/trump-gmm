// File: Character.pde

class Character {
  PImage walkRight;
  PImage walkLeft;
  PImage standImage;
  float x, y;
  float scale; // VARIABEL BARU untuk menyimpan skala
  int frameCount = 0;
  int frameDelay = 10;

  // Constructor untuk karakter bergerak (dengan parameter scale)
  Character(String pathRight, String pathLeft, float startX, float startY, float scale) {
    walkRight = loadImage(pathRight);
    walkLeft = loadImage(pathLeft);
    this.standImage = null;
    this.x = startX;
    this.y = startY;
    this.scale = scale; // Simpan nilai scale
  }

  // Constructor untuk karakter diam (dengan parameter scale)
  Character(String pathStand, float startX, float startY, float scale) {
    this.standImage = loadImage(pathStand);
    this.walkRight = null;
    this.walkLeft = null;
    this.x = startX;
    this.y = startY;
    this.scale = scale; // Simpan nilai scale
  }
  
  void move(float speed) {
    x += speed;
    frameCount++;
  }

  // Method display yang sekarang menggunakan scale
  void display() {
    if (standImage != null) {
      // Gambar karakter diam dengan ukuran yang sudah diskalakan
      image(standImage, x, y, standImage.width * scale, standImage.height * scale);
    } 
    else if (walkRight != null && walkLeft != null) {
      // Pilih frame yang akan ditampilkan
      PImage currentFrame = ((frameCount / frameDelay) % 2 == 0) ? walkRight : walkLeft;
      // Gambar karakter bergerak dengan ukuran yang sudah diskalakan
      image(currentFrame, x, y, currentFrame.width * scale, currentFrame.height * scale);
    }
  }
}
