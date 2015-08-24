pas : StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Project>> Project1
 pas : StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library1
 ; // Library1
 pas : StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library2
 ; // Library2
 pas : StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library3
 ; // Library3
 pas : StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Program>> Program1
  pas : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class1
  ; // Class1
  pas : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class2
   pas : OPERATOR NamedWordProducer %INHERITS %G
   ; // %G
   pas : OPERATOR NamedWordProducer %IMPLEMENTS %R
   ; // %R
  ; // Class2
  pas : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class3
  ; // Class3
  pas : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class4
   pas : OPERATOR NamedWordProducer %INHERITS %G
   ; // %G
  ; // Class4
  pas : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Interface>> Interface1
  ; // Interface1
  pas : StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Interface>> Interface2
  ; // Interface2
 ; // Program1
; // Project1
