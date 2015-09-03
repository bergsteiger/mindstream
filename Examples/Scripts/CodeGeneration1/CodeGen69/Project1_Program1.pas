// На самом деле это Delphi

<<UMLCategory>> <<Program>> Program1
Родители Project1
 // На самом деле это Delphi
 
 <<UMLClass>> <<Class>> Class1
 Родители Project1 Program1
 ; // Class1
 // На самом деле это Delphi
 
 <<UMLClass>> <<Class>> Class2
 Родители Project1 Program1
 Наследуемые Class1
 Реализуемые Interface1 Interface2
 ; // Class2
 // На самом деле это Delphi
 
 <<UMLClass>> <<Class>> Class3
 Родители Project1 Program1
 ; // Class3
 // На самом деле это Delphi
 
 <<UMLClass>> <<Class>> Class4
 Родители Project1 Program1
 Наследуемые Class2 Class3
 ; // Class4
 // На самом деле это Delphi
 
 <<UMLClass>> <<Class>> Class5
 Родители Project1 Program1
  // На самом деле это Delphi
  
  <<UMLClass>> <<Const>> Constant1
  Родители Project1 Program1 Class5
  ; // Constant1
  // На самом деле это Delphi
  
  <<UMLClass>> <<Const>> Constant2
  Родители Project1 Program1 Class5
  ; // Constant2
  // На самом деле это Delphi
  
  <<UMLClass>> <<Class>> InnerClass1
  Родители Project1 Program1 Class5
  ; // InnerClass1
  // На самом деле это Delphi
  
  <<UMLClass>> <<Class>> InnerClass2
  Родители Project1 Program1 Class5
  ; // InnerClass2
 ; // Class5
; // Program1
