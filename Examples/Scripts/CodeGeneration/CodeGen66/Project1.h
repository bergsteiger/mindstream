h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Project>> Project1
Родители элемента 
 h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library1
 Родители элемента ::Project1
 ; // Library1
 h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library2
 Родители элемента ::Project1
 ; // Library2
 h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Library>> Library3
 Родители элемента ::Project1
 ; // Library3
 h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLCategory>> <<Program>> Program1
 Родители элемента ::Project1
  h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class1
  Родители элемента ::Project1::Program1
  ; // Class1
  h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class2
  Родители элемента ::Project1::Program1
  Class1
  Interface1
  Interface2
  ; // Class2
  h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class3
  Родители элемента ::Project1::Program1
  ; // Class3
  h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Class>> Class4
  Родители элемента ::Project1::Program1
  Class2
  Class3
  ; // Class4
  h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Interface>> Interface1
  Родители элемента ::Project1::Program1
  ; // Interface1
  h : OPERATOR StereotypeStereotypeProducer <<@meta>> <<UMLClass>> <<Interface>> Interface2
  Родители элемента ::Project1::Program1
  ; // Interface2
 ; // Program1
; // Project1
