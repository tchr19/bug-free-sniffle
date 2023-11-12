SliderScale mySlider;
float buttonX, buttonY, buttonWidth, buttonHeight;
float closeButtonX, closeButtonY, closeButtonSize;
int firstRoundCounter, secondRoundCounter;



void setup() {
    fullScreen();
    mySlider = new SliderScale(9); // 9 anchor scale
    
    //Submitting:
    buttonX = width/2 - buttonWidth/2;
    buttonY = height - 50;
    buttonWidth = 100;
    buttonHeight = 40;

    // close application
    closeButtonSize = 30;
    closeButtonX = width - 40;
    closeButtonY = 10;


    firstRoundCounter = 0; // Var for storing trial nr. in first round
    secondRoundCounter = 0;  // var for storing trial nr. in second round.


}


void draw() {
  background(255);

  mySlider.drawScale();

  // Draw the submit button
  fill(56, 232, 94);
  rect(buttonX, buttonY, buttonWidth, buttonHeight, 10);

  // Display the submit button label
  fill(0);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("Submit", buttonX + buttonWidth / 2, buttonY + buttonHeight / 2);

  // Draw the close button
  fill(255, 0, 0); // Red color for the close button
  rect(closeButtonX, closeButtonY, closeButtonSize, closeButtonSize, 5);

  // Display close button label
  fill(255);
  textSize(16);
  textAlign(CENTER, CENTER);
  text("X", closeButtonX + closeButtonSize / 2, closeButtonY + closeButtonSize / 2);

  // Display scale label
  fill(0);
  textSize(100);
  textAlign(CENTER,CENTER);
  text("TEST", width/2, 95);

  
}



void mousePressed() {
  // Check if the mouse is over the submit button
  if (mouseX > buttonX && mouseX < buttonX + buttonWidth &&
      mouseY > buttonY && mouseY < buttonY + buttonHeight) {
    mySlider.printSliderValue();
    mySlider.initializeAnchors(); // Reset the slider position to the initial state
  }

  // Check if the mouse is over the close button
  if (mouseX > closeButtonX && mouseX < closeButtonX + closeButtonSize &&
      mouseY > closeButtonY && mouseY < closeButtonY + closeButtonSize) {
    exit(); // Close the application
  }

  // Check if the mouse is over the scale
  float scaleY = height * 1 / 3;
  if (mouseY > scaleY - 15 && mouseY < scaleY + 15) {
    mySlider.setShowSlider(true);
    mySlider.setSliderPosition(mouseX); // Set the slider position to the mouse click
  }

  // Call the mousePressed function of the SliderScale object
  mySlider.mousePressed();
}

void mouseReleased() {
// Call the mouseReleased function of the SliderScale object
  mySlider.mouseReleased();
}

void mouseDragged() {
  // Call the mouseDragged function of the SliderScale object
  mySlider.mouseDragged();
}
