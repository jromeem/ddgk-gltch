PrintWriter output;
String[] fontList;

// writes to a file called fonts.txt and displays
// your specific machine's font names
void setup()
{
  size(200, 200);
  output = createWriter("fonts.txt");
  fontList = PFont.list();
  for (int i=0; i<fontList.length; i++) {
    output.println("["+i+"] "+ fontList[i]); 
  }
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
  exit();  // Stops the program
}