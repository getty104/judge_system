#include <iostream>
#include <fstream>
using namespace std;

char command[1024];

int main(int argc, char const *argv[])
{
  ofstream ofs;
  ofs.open("main.c",ios::binary);
  string buf;
  string splitter="<$><*><$>";
  string time;
  while(getline(cin,buf)){
    if(buf==splitter)break;
    ofs<<buf<<endl;
  }
  ofs.close();
  ofs.open("test.in",ios::binary);
  while(getline(cin,buf)){
    if(buf==splitter)break;
    ofs<<buf<<endl;
  }
  ofs.close();
  cin>>time;
   system("/opt/wandbox/gcc-head/bin/gcc main.c -o main -O2");
  system(("timeout -s 9 " + time + " ./main < test.in").c_str());
  return 0;
}
