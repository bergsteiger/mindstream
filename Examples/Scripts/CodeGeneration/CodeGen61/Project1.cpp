cpp : <<UMLCategory>> <<Project>> Project1
 cpp : <<UMLCategory>> <<Library>> Library1
 ; // Library1
 cpp : <<UMLCategory>> <<Library>> Library2
 ; // Library2
 cpp : <<UMLCategory>> <<Library>> Library3
 ; // Library3
 cpp : <<UMLCategory>> <<Program>> Program1
  cpp : <<UMLClass>> <<Class>> Class1
  ; // Class1
  cpp : <<UMLClass>> <<Class>> Class2
   cpp : NamedWordProducer %INHERITS %G
   ; // %G
   cpp : NamedWordProducer %IMPLEMENTS %R
   ; // %R
  ; // Class2
  cpp : <<UMLClass>> <<Class>> Class3
  ; // Class3
  cpp : <<UMLClass>> <<Class>> Class4
   cpp : NamedWordProducer %INHERITS %G
   ; // %G
  ; // Class4
  cpp : <<UMLClass>> <<Interface>> Interface1
  ; // Interface1
  cpp : <<UMLClass>> <<Interface>> Interface2
  ; // Interface2
 ; // Program1
; // Project1
