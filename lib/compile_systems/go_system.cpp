#include <iostream>
#include <fstream>
using namespace std;

char command[1024];

int main(int argc, char const *argv[])
{
  ofstream ofs;
  ofs.open("main.go",ios::binary);
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
  system(("timeout -s 9 " + time + " /opt/wandbox/go-head/bin/go run main.go < test.in ").c_str());
  return 0;
}