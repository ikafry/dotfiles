#include "SingleList.hpp"

//コンストラクタ
SingleList::SingleList()
{
   head = NULL;
   numNodes = 0;
}

//デストラクタ
SingleList::~SingleList()
{
   Clear();
}

void SingleList::Add(int d)
{
   Node *p = new Node;
   
   p->data = d;
   p->next = head;

   head = p;
   numNodes++;
}

int SingleList::Show()
{
   Node *h = head;

   while(h != NULL){
      printf("%d ->", h->data);

      h = h->next;
   }
   printf("NULL\n");

   return numNodes;
}

void SingleList::Clear()
{
   Node *chead;

   delete[] head;

   while(head != NULL){
      chead = head;

      head = head->next;

      delete[] chead;
   }
}
