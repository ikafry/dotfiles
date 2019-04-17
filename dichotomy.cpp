#include <bits/stdc++.h>

using namespace std;

double funccos(double x)
{
   return cos(x) - x;
}

int main()
{
   double a, b, c;
   double fa, fb, fc;
   double x;
   int i = 0;

   a = 0.0;
   b = 1.0;

   while(1){
      c = (a + b) / 2.0;
      fa = funccos(a);
      fb = funccos(b);
      fc = funccos(c);

      cout << setw(4) << i << " " << setprecision(6) << a << " " << setprecision(6) << b << " " << setprecision(6) << c << " " << setprecision(6) << fc << endl;

      if(b - c == 0.0 && c - a == 0.0){
         x = c;
         break;
      }
      
      if(fa * fc < 0) a = c;
      else if(fb * fc < 0) b = c;

      i++;
   }

   cout << "\nComplete!\n" << "x = " << setprecision(6) << x << endl;

   return 0;
}
