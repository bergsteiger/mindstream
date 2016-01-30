unit l3Variants;

{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces
  ;

(*
 Ml3Variant = PureMixIn
   function pm_GetAsWStr: Tl3WString;
   function pm_GetAsString: AnsiString;
   function AsBool: Boolean;
     {* преобразовать к Boolean. }
   function AsLong: Integer;
   function IsNull: Boolean;
     {* пустой тег? }
   function IsTransparent: Boolean;
     {* тег "прозрачный"? }
   function IsValid: Boolean;
     {* тег имеет значение? }
   function IsStream(out theStream: IStream): Boolean;
     {* Проверяет может ли тег приводиться к потоку. И приводит к потоку - если указатель на поток - не нулевой. }
   function MarkModified: Boolean;
   property AsWStr: Tl3WString
     read pm_GetAsWStr;
     {* свойство для преобразования к типу Tl3PCharLen }
   property AsString: AnsiString
     read pm_GetAsString;
     {* свойство для преобразования к строкам Delphi }
 end;//Ml3Variant
*)

(*
 Mk2AtomHolder = PureMixIn
   function HasSubAtom(anIndex: Integer): Boolean;
 end;//Mk2AtomHolder
*)

(*
 Mk2TypeInfo = PureMixIn
  {* Информация о типе }
   function IsOrd: Boolean;
 end;//Mk2TypeInfo
*)

implementation

end.