pas : <<UMLCategory>> <<Project>> Project1
 pas : <<UMLCategory>> <<Library>> Library1
 ; // Library1
 pas : <<UMLCategory>> <<Library>> Library2
 ; // Library2
 pas : <<UMLCategory>> <<Library>> Library3
 ; // Library3
 pas : <<UMLCategory>> <<Program>> Program1
  pas : <<UMLClass>> <<Class>> Class1
  ; // Class1
  pas : <<UMLClass>> <<Class>> Class2
   pas : NamedWordProducer %INHERITS %G
   ; // %G
   pas : NamedWordProducer %IMPLEMENTS %R
   ; // %R
  ; // Class2
  pas : <<UMLClass>> <<Class>> Class3
  ; // Class3
  pas : <<UMLClass>> <<Class>> Class4
   pas : NamedWordProducer %INHERITS %G
   ; // %G
  ; // Class4
  pas : <<UMLClass>> <<Interface>> Interface1
  ; // Interface1
  pas : <<UMLClass>> <<Interface>> Interface2
  ; // Interface2
 ; // Program1
; // Project1
