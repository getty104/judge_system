#include <iostream>
#include <fstream>
using namespace std;

int main(int argc, char const *argv[])
{
  ofstream ofs;
  ofs.open("test.rb",ios::binary);
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
    system("/usr/bin/time -f '%U' /opt/wandbox/ruby-head/bin/ruby test.rb < test.in");
  return 0;
}
