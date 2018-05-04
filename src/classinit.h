#include <bits/stdc++.h>
using namespace std;

union Node{
    int number;
    char *value;

    class Prog *prog;
    class Declblock *declblock;
    class Decllist  *decllist;
    class Declstmt  *declstmt;
    class Vardecl   *vardecl;
    class Remarr    *remarr;
    class Remadecl  *remadecl;
    class Codeblock *codeblock;
    class Codelist  *codelist;
    class Codedecl  *codedecl;
    class Var       *var
    class Readvar   *readvar;
    class Mexpr     *mexpr;
    class Bexpr     *bexpr;
    class Consta    *consta;

    Node(){
		number = 0;
		value = NULL;

	}
	~Node(){};
};
typedef union Node YYSTYPE;

#define YYSTYPE_IS_DECLARED 1


class astNode{

};


class  Declblock     : public astNode{

};

class  Decllist     class       : public astNode{

};

};

class   Declstmt    : public astNode{

};

class    Vardecl   : public astNode{

};

class   Codedecl    : public astNode{

};

class   Codelist    : public astNode{

};

class    Codeblock   : public astNode{

};decl
class     Mexpr  : public astNode{

};
class     Bexpr  : public astNode{

};

class    Consta   : public astNode{

};
class     Readvar  : public astNode{

};

class     Remarr  : public astNode{

};

class     Remadecl  : public astNode{

};



class     Var  : public astNode{

};
