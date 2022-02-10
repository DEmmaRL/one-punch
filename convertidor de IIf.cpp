#include <bits/stdc++.h>
using namespace std;
int main()
{
  ios_base :: sync_with_stdio(false);
  cin.tie(NULL);
  cout.tie(NULL);
  string s="IIf([Tbl_cTMEC_00].[MPCap] = [Reglas T - MEC].[ExceptoC],0, 1)";
  string a, b, c;
  for(int i=1; i<s.size(); ++i)
  {
    if(s[i-1]=='(')
    {
      int j=i;
      while(s[j]!=',')
      {
        a+=s[j];
        j++;
      }
      j++;
      while(s[j]!=',')
      {
        b+=s[j];
        j++;
      }
      j++;
      while(s[j]!=')')
      {
        c+=s[j];
        j++;
      }
    }

  }
  cout<<"CASE WHEN "<<a<<"THEN "<<b<<" ELSE "<<c<<" END"<<endl;

  return 0;
}
