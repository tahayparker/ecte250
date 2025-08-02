

 // Processing UDP example to send and receive string data from Arduino
 // press any the key Y to send "YES" to Arduino
 // press any the key N to send "NO" to Arduino
 // received messages are displayed in the Console
 // the Arduino IP is be specified at line 27
 // the port on which Arduino UDP server is listening to is  specified at line 29
 // the port to which Arduino send UDP messages is spedified at line 18

import hypermedia.net.*;

UDP udp;  // define the UDP object


void setup() {

  udp = new UDP( this, 8001 );  // PC is listening on this UDP port
  //udp.log( true );            // <-- printout the connection activity
  udp.listen( true );           // and wait for incoming message

}

 void draw()
 {
 }

void keyPressed() {
  String ArduinoIP = "192.168.1.177";  // Arduino IP address
  int ArduinoUDPport = 8002;           // Arduino UDP server port
  
  if (key == 'y' || key == 'Y') {
    udp.send("YES", ArduinoIP, ArduinoUDPport);   // send YES
  }
  else if  (key == 'n' || key == 'N') {
    udp.send("NO", ArduinoIP, ArduinoUDPport);   // send NO
  }
  
 }

void receive( byte[] data ) {       // <-- default handler receiving UDP packets
//void receive( byte[] data, String ip, int port ) {  // <-- extended handler receiving UDP packets
  println();
  print("Received Message: ");
  for(int i=0; i < data.length; i++){  // print received message
    print(char(data[i]));
  }
  println();
}
 
