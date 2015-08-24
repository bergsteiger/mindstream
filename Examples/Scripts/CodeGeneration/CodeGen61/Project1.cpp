cpp : <<Project>> Project1
 cpp : <<Library>> Library1
 ; // Library1
 cpp : <<Library>> Library2
 ; // Library2
 cpp : <<Library>> Library3
 ; // Library3
 cpp : <<Program>> Program1
  cpp : <<Class>> Class1
  ; // Class1
  cpp : <<Class>> Class2
   cpp : %INHERITS %G
   ; // %G
   cpp : %IMPLEMENTS %R
   ; // %R
  ; // Class2
  cpp : <<Class>> Class3
  ; // Class3
  cpp : <<Class>> Class4
   cpp : %INHERITS %G
   ; // %G
  ; // Class4
  cpp : <<Interface>> Interface1
  ; // Interface1
  cpp : <<Interface>> Interface2
  ; // Interface2
 ; // Program1
; // Project1
