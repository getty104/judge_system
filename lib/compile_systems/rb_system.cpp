#include <iostream>
#include <fstream>
using namespace std;

char command[1024];

int main(int argc, char const *argv[])
{
	ofstream ofs;
	ofs.open("main.rb",ios::binary);
	string buf;
	string splitter="<$><*><$>";
	string time;
	while(getline(cin,buf)){
		if(buf==splitter)break;
		ofs<<buf<<endl;
	}
	ofs.close();
	ofs.open("test.base64",ios::binary);
	while(getline(cin,buf)){
		if(buf==splitter)break;
		ofs<<buf<<endl;
	}
	ofs.close();
	cin>>time;
	system("base64 -d test.base64 > test.gz");
	system("ungzip test.gz > test.in");
	system(("timeout -s 9 " + time + " /opt/wandbox/ruby-head/bin/ruby main.rb < test.in").c_str());
	return 0;
}
