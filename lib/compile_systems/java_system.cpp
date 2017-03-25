#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char const *argv[])
{
  ofstream ofs;
  ofs.open("Main.java",ios::binary);
  string buf;
  while(getline(cin,buf)){
    if(buf=="<$><*><$><*><$><*><$><*><$><*><$><*><$>")break;
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




/*import java.util.*;
import java.io.*;
class Career{
  public static void main(String[] args){

    Scanner sc = null;
    File code =  null;
    PrintWriter pw = null;
    File stdin = null;
    PrintWriter pw2 = null;
    String str = null;
    BufferedReader br = null;
    Process compile = null;
    Runtime r = null;
    InputStream run = null;

    try{
      sc = new Scanner(System.in);
      code = new File("Main.java");
      stdin = new File("test.in");
      pw = new PrintWriter(new BufferedWriter(new FileWriter(code)));
      pw2 = new PrintWriter(new BufferedWriter(new FileWriter(stdin)));
      while(true){
       str = sc.next();
       if(str.equals("<$><*><$><*><$><*><$><*><$><*><$><*><$>")){
        break;
      }
      pw.println(str);
    }
    code.createNewFile();

    while(sc.hasNext()){
      str = sc.next();
      pw2.println(str);
    }
    stdin.createNewFile();

    r = Runtime.getRuntime();
    compile = r.exec("/opt/wandbox/openjdk-head/bin/javac Main.java");
    compile.waitFor();
    run = r.exec("/usr/bin/time -f '%U' /opt/wandbox/openjdk-head/bin/java Main < test.in").getInputStream();
    br = new BufferedReader(new InputStreamReader(run));
    String line;
    while ((line = br.readLine()) != null) {
      System.out.println(line);
    }
  }catch(Exception e ){
    e.printStackTrace();
  }
}
}*/
