#include <bits/stdc++.h>

using namespace std;

int N;   //行と列の長さ


//行入れ替え
void swap(double **tensor, int a, int b)
{
  for(int j=a;j<N+1;j++){
    double tmp = tensor[a][j];
    tensor[a][j] = tensor[b][j];
    tensor[b][j] = tmp;
  }
}


//絶対値最大のピボット選択
void select_pivot(double **tensor, int i)
{
  bool isRegular = false;  //正則かどうか
  int max = i;   //絶対値最大の行

  for(int k=i+1;k<N;k++){
    if(tensor[k][i] != 0 && !isRegular)  isRegular = true;
    if(fabs(tensor[k][i]) > fabs(tensor[max][i])){
      max = k;
      break;
    }
  }

  if(!isRegular){
    cout << "正則でないので終了" << endl;
    exit(1);
  }else{
    swap(tensor, i, max);
  }
}


//前進過程
void deleting(double **tensor)
{
  for(int i=0;i<N;i++){ //ピボット a[i][i]
    for(int raw=i+1;raw<N;raw++){ //行
      select_pivot(tensor, i);
      
      double m = -(tensor[raw][i] / tensor[i][i]);
      for(int col=i;col<N+1;col++){ //列
        tensor[raw][col] += m * tensor[i][col];
      }
    }
  }
}


//後進過程
void calc(double **tensor)
{
  for(int k=N-1;k>=0;k--){
    double child = tensor[k][N];
    for(int n=k+1;n<N;n++){
      child -= tensor[k][n] * tensor[n][N];
    }
    tensor[k][N] = child / tensor[k][k];
  }
}


int main()
{
  cout << "行列の大きさ(n行 | n+1列) : n = ";
  cin >> N;

  //行列変数の動的確保
  double **tensor = new double*[N+1];
  for (int i = 0; i < N+1; i++) {
    tensor[i] = new double[N];
  }

  //行列の値を入力
  for(int i=0;i<N;i++){
    cout << i+1 << "行目(" << N+1 << "項) : ";
    for(int j=0;j<N+1;j++)  cin >> tensor[i][j];
  }

  //前進過程の実行
  deleting(tensor);
  
  //後進過程の実行
  calc(tensor);

  //答えの表示
  for(int i=0;i<N;i++){
    cout << "x" << i+1 << " = " << fixed << tensor[i][N] << endl;
  }

  //行列変数の削除
  for (int i = 0; i < N; i++) {
    delete[] tensor[i];
  }
  delete[] tensor;

  return 0;
}
