#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char const *argv[])
{
  ofstream ofs;
  ofs.open("test.cpp",ios::binary);
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
  system("/opt/wandbox/gcc-head/bin/g++ test.cpp -o test -O2");
  system("/usr/bin/time -f '%U' ./test < test.in");
  return 0;
}