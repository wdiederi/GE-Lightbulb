// Code for GE Lightbulb Project for EG 11012
// This program is intended to be able to automatically control the amount of current flowing to
// each of the four lightbulbs using an Arduino's ability to control PWM signals flowing out of
// each of its output pins. Currently, our idea is that a button will be used to switch between
// the AM and PM lightbulb settings ussing the press of a button.

// Our plan is to use MOSFETs to regulate the amount of current flowing through the LEDs each
// second by providing pulses to its gate. When there is current supplied, it enables the flow
// of current between the source and the drain. This can be used to simulate resistance without 
// needing physical resistors.

// Author: Will Diederich
// Group Members: Daniel Duell
//                John Craig
//                Slater Chesser

// Section 11 Group 3

// Date written: 4/10/2017

// All four of these pins need to be capable of dealing with PWM
const int mosfetRPin = 3;
const int mosfetGPin = 5;
const int mosfetBPin = 9;
const int mosfetWPin = 11;
const int buttonPin = 2;

// Dictates current light setting of lightbulb (AM or PM)
char curMode[3] = "AM";

// Values of resistances for initial mode
double rResistance = 46.8667;
double gResistance = 9.9533;
double bResistance = 36.5713;
double wResistance = 23.724;

void setup() {
  pinMode(mosfetRPin, OUTPUT);
  pinMode(mosfetGPin, OUTPUT);
  pinMode(mosfetBPin, OUTPUT);
  pinMode(mosfetWPin, OUTPUT);
  attachInterrupt(digitalPinToInterrupt(buttonPin), push, RISING);
}

void loop() { 
  rCurrent = 24/(rResistance+200);
  gCurrent = 24/(gResistance+100);
  bCurrent = 24/(bResistance+100);
  wCurrent = 24/(wResistance+100); 

  analogWrite(mosfetRPin, (rCurrent*200*255)/24);
  analogWrite(mosfetGPin, (gCurrent*100*255)/24);
  analogWrite(mosfetBPin, (bCurrent*100*255)/24);
  analogWrite(mosfetWPin, (wCurrent*100*255)/24);
}

void push()
{
  if (strcmp(curMode,"PM"))  {
    rResistance = 46.8667;
    gResistance = 9.9533;
    bResistance = 36.5713;
    wResistance = 23.724;
    strcpy(curMode, "AM");
  }
  else  {
    rResistance = 46.8667;
    gResistance = 9.9533;
    bResistance = 36.5713;
    wResistance = 23.724;
    strcpy(curMode, "PM");
  }
  delay(10);
}
