unit l3VCLFormPtrList;
 
{$Include l3Define.inc}

interface

uses
  Classes
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  ,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except
  ;

type
 _ItemType_ = TCustomForm;
 _l3ObjectPtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3ObjectPtrList.imp.pas}
 Tl3VCLFormPtrList = class(_l3ObjectPtrList_)
  {* Список УКАЗАТЕЛЕЙ на формы VCL }
 end;//Tl3VCLFormPtrList

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;

type _Instance_R_ = Tl3VCLFormPtrList;

{$Include l3ObjectPtrList.imp.pas}

end.