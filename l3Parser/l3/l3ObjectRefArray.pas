unit l3ObjectRefArray;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3ProtoObjectRefList
  ;

type
 _l3OpenArray_Parent_ = Tl3ProtoObjectRefList;
 {$Include ..\L3\l3OpenArray.imp.pas}
 Tl3ObjectRefArray = class(_l3OpenArray_)
  {* "Открытый массив". Список, который автоматически расширяется при добавлении элемента за гранецей диапазона }
 end;//Tl3ObjectRefArray

implementation

uses
  l3Base
  ;

type _Instance_R_ = Tl3ObjectRefArray;

{$Include ..\L3\l3OpenArray.imp.pas}

end.