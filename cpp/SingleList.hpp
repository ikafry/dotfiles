#include <stdio.h>
#include <stdlib.h>
struct Node{
   int data;
   struct Node *next;
};

class SingleList{
private:
   Node *head;
   int numNodes;

public:
   void Add(int);
   int Show();
   void Clear();
   SingleList();
   ~SingleList();
};
