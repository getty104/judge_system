#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char const *argv[])
{
  ofstream ofs;
  ofs.open("Main.java",ios::binary);
  string buf;
  while(getline(cin,buf)){
    if(buf=="<$><*><$>")break;
    ofs<<buf<<endl;
  }
  ofs.close();
  ofs.open("test.in",ios::binary);
  while(getline(cin,buf)){
    ofs<<buf<<endl;
  }
  ofs.close();
  system("/opt/wandbox/openjdk-head/bin/javac Main.java");
  system("/usr/bin/time -f '%U' /opt/wandbox/openjdk-head/bin/java Main < test.in");
  return 0;
}




/*
import java.util.*;
import java.io.*;
class Career{
  public static void main(String[] args){

    BufferedReader sc;
    File code;
    File stdin;
    FileWriter pw1;
    FileWriter pw2;
    String str;
    BufferedReader br1;
    BufferedReader br2;
    Runtime r;
    Runtime rr;
    InputStream compile;
    InputStream run;

    try{
      sc = new BufferedReader(new InputStreamReader(System.in));
      code = new File("Main.java");
      code.createNewFile();
      code = new File("Main.java");
      stdin = new File("test.in");
      stdin.createNewFile();
      stdin = new File("test.in");
      pw1 = new FileWriter(code, true);
      pw2 = new FileWriter(stdin, true);
      while(true){
       str = sc.readLine();
       if(str.equals("<$><*><$>")){
        break;
      }
      pw1.write(str);
    }
    pw1.close();
   
  
    while((str = sc.readLine()) != null){
      pw2.write(str);
    }
    pw2.close();
    r = Runtime.getRuntime();
    rr = Runtime.getRuntime();
    compile = r.exec("/opt/wandbox/openjdk-head/bin/javac Main.java").getInputStream();
    run = rr.exec("/opt/wandbox/openjdk-head/bin/java Main < test.in").getInputStream();
    br1 = new BufferedReader(new InputStreamReader(compile));
    br2 = new BufferedReader(new InputStreamReader(run));
    while ((str = br1.readLine()) != null) {
      System.out.println(str);
    }
    while ((str = br2.readLine()) != null) {
      System.out.println(str);
    }
  }catch(Exception e ){
    e.printStackTrace();
  }
}
}
*/
