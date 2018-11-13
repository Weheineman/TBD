#include <cstdio>
#include <iostream>
#include <cstdlib>
#include <vector>
#include <stack>
#include <algorithm>
#include <utility>

using namespace std;

const int MAXN = 1000;

vector <int> G[MAXN];
vector <int> ComponentList[MAXN];
vector <int> CandScc;

int N, E;
int NodeInd;
int SccInd;
int Index[MAXN];
int LowLink[MAXN];
bool OnStack[MAXN];
int NodeScc[MAXN];
int SccEntry[MAXN];
int PrintList[MAXN];
stack <int> S;

void init(){
	for(int i = 0; i < MAXN; ++i)
		Index[i] = -1;
		
	for(int i = 0; i < MAXN; ++i)
		LowLink[i] = -1;
		
	for(int i = 0; i < MAXN; ++i)
		NodeScc[i] = -1;
}

void strongConnect(int v){
	Index[v] = NodeInd;
	LowLink[v] = NodeInd;
	NodeInd++;
	S.push(v);
	OnStack[v] = true;
	
	for(int w : G[v]){
		if(Index[w] == -1){
			strongConnect(w);
			LowLink[v] = min(LowLink[v], LowLink[w]);
		} else if(OnStack[w])
			LowLink[v] = min(LowLink[v], Index[w]);
	}
	
	if(LowLink[v] == Index[v]){
		int w;
		do{
			w = S.top();
			S.pop();
			OnStack[w] = false;
			NodeScc[w] = SccInd;
			ComponentList[SccInd].push_back(w);
		} while(w != v);
		SccInd++;
	}
}

void countEntry(int N){
	for(int v = 1; v <= N; v++)
		for(auto w : G[v])
			if(NodeScc[w] != NodeScc[v])
				SccEntry[NodeScc[w]]++;
}

void readGraph(){
	int v1, v2;
	for(int i = 0; i < E; ++i){
		scanf("%d %d", &v1, &v2);
		G[v1].push_back(v2);
	}
}

void printCandKeys(int ind){
	if(ind == CandScc.size()){
		printf("{");
		printf("%d", PrintList[0]);
		for(int i = 1; i < CandScc.size(); ++i)
			printf(", %d", PrintList[i]);
		printf("}, ");
		return;
	}
		
	int sccIndActual = CandScc[ind];
	auto &sccActual = ComponentList[sccIndActual];
	for(int node : sccActual){
		PrintList[ind] = node;
		printCandKeys(ind+1);
	}
}

int main(){
	init();
	
	//~ Falta resolver los casos AB -> C
	
	freopen("input.in", "r", stdin);
	
	scanf("%d %d", &N, &E);
	readGraph();
	
	for(int v = 1; v <= N; v++)
		if(NodeScc[v] == -1)
			strongConnect(v);
	
	countEntry(N);
	
	for(int s = 0; s < SccInd; ++s)
		if(SccEntry[s] == 0 or SccInd == 1)
			CandScc.push_back(s);
	
	printf("{");
	printCandKeys(0);
	printf("}\n");
}
