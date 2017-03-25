$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "judge_system"


def c_code
	<<~EOS
	#include <stdio.h>
	char buf[2048];
	int main(void)
	{
		scanf("%s",buf);
		printf("%s", buf);
		puts("");
		int i;
		int a = 10000;
		for(i=0;i<10000000;i++)a=a*a%1000000007;
			fprintf(stderr,"%d",a);
			return 0;
		}
		EOS
	end

	def rb_code
		<<~EOS
		n = gets.to_i
		puts n
		EOS
	end

	def dangerous_code
		<<~EOS
		system("kill 1")
		system("kill 20")
		system("kill 21")
		system("kill 22")
		$stderr.puts "hogehoge"
		EOS
	end

	def cpp_code
		<<~EOS
		#include <bits/stdc++.h>
		using namespace std;

		string s;

		int main(){
			cin.sync_with_stdio(false);
			cin>>s;
			cout<<s<<endl;
			int a=2;
			for(int i=0;i<10000000;i++)a=a*a%1000000007;
				cerr<<a<<endl;
				return 0;
			}
			EOS
		end

		def java_code
			<<~EOS
			import java.util.*;
			class Main {
				public static void main(String[] args) {
					Scanner sc=new Scanner(System.in);
					String s=sc.next();
					System.out.println(s); 
				}
			}
			EOS
		end