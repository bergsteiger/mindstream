cpp : StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Project>> Project1
 cpp : StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library1
 ; // Library1
 cpp : StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library2
 ; // Library2
 cpp : StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library3
 ; // Library3
 cpp : StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Program>> Program1
  cpp : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class1
  ; // Class1
  cpp : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class2
   cpp : OPERATOR NamedWordProducer %INHERITS %G
   ; // %G
   cpp : OPERATOR NamedWordProducer %IMPLEMENTS %R
   ; // %R
  ; // Class2
  cpp : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class3
  ; // Class3
  cpp : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class4
   cpp : OPERATOR NamedWordProducer %INHERITS %G
   ; // %G
  ; // Class4
  cpp : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Interface>> Interface1
  ; // Interface1
  cpp : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Interface>> Interface2
  ; // Interface2
 ; // Program1
; // Project1
