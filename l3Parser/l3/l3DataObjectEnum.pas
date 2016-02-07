unit l3DataObjectEnum;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3DataObject,
  l3ProtoObject,
  Windows,
  ActiveX
  ;

type
 Tl3DataObjectEnum = class(Tl3ProtoObject, IEnumFormatEtc)
  {* Реализация итератора для данных Tl3DataObject. }
 private
 // private fields
   f_DataObject : Tl3DataObject;
   f_Index : Integer;
 protected
 // realized methods
   function Next(celt: Integer;
    out elt;
    pceltFetched: PLongint): HResult; stdcall;
   function Skip(celt: Integer): HResult; stdcall;
   function Reset: HResult; stdcall;
   function Clone(out Enum: IEnumFORMATETC): HResult; stdcall;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   class function Make(aDataObject: Tl3DataObject): IEnumFormatEtc; reintroduce;
   constructor Create(aDataObject: Tl3DataObject); reintroduce;
 end;//Tl3DataObjectEnum

implementation

uses
  l3MinMax,
  SysUtils
  ;

// start class Tl3DataObjectEnum

class function Tl3DataObjectEnum.Make(aDataObject: Tl3DataObject): IEnumFormatEtc;
var
 l_Inst : Tl3DataObjectEnum;
begin
 l_Inst := Create(aDataObject);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

constructor Tl3DataObjectEnum.Create(aDataObject: Tl3DataObject);
//#UC START# *48F33CE302EC_4680F5FF01EA_var*
//#UC END# *48F33CE302EC_4680F5FF01EA_var*
begin
//#UC START# *48F33CE302EC_4680F5FF01EA_impl*
 inherited Create;
 aDataObject.SetRefTo(f_DataObject);
//#UC END# *48F33CE302EC_4680F5FF01EA_impl*
end;//Tl3DataObjectEnum.Create

function Tl3DataObjectEnum.Next(celt: Integer;
  out elt;
  pceltFetched: PLongint): HResult;
//#UC START# *48F33755005D_4680F5FF01EA_var*
var
 l_Index : Integer;
 l_P     : PFormatEtc;
 l_Tail  : Integer;
//#UC END# *48F33755005D_4680F5FF01EA_var*
begin
//#UC START# *48F33755005D_4680F5FF01EA_impl*
 if (f_DataObject = nil) OR (celt <= 0) then
  Result := E_NotImpl
 else
 begin
  l_P := @elt;
  with f_DataObject do
  begin
   l_Tail := Min(Pred(f_Index + celt), Formats.Hi);
   if (pceltFetched <> nil) then
    pceltFetched^ := Succ(l_Tail - f_Index);
   if (f_Index > l_Tail) then
    Result := S_False
   else
   begin
    Result := S_Ok;
    for l_Index := f_Index to l_Tail do
    begin
     with l_P^ do
     begin
      cfFormat := Formats[l_Index];
      ptd := nil;
      dwAspect := DVASPECT_CONTENT;
      lindex := -1;
      if (cfFormat = CF_Locale) then
       tymed := TYMED_HGLOBAL
      else
       tymed := AcceptableTymed;
     end;//with l_P
     Inc(l_P);
     Inc(f_Index);
    end;//for l_Index
   end;//f_Index > l_Tail
  end;//f_DataObject
 end;//f_DataObject = nil
//#UC END# *48F33755005D_4680F5FF01EA_impl*
end;//Tl3DataObjectEnum.Next

function Tl3DataObjectEnum.Skip(celt: Integer): HResult;
//#UC START# *48F33790021D_4680F5FF01EA_var*
//#UC END# *48F33790021D_4680F5FF01EA_var*
begin
//#UC START# *48F33790021D_4680F5FF01EA_impl*
 Inc(f_Index, celt);
 if (f_DataObject = nil) OR (f_Index > f_DataObject.Formats.Hi) then
  Result := S_False
 else
  Result := S_Ok;
//#UC END# *48F33790021D_4680F5FF01EA_impl*
end;//Tl3DataObjectEnum.Skip

function Tl3DataObjectEnum.Reset: HResult;
//#UC START# *48F337A20394_4680F5FF01EA_var*
//#UC END# *48F337A20394_4680F5FF01EA_var*
begin
//#UC START# *48F337A20394_4680F5FF01EA_impl*
 Result := S_Ok;
 f_Index := 0;
//#UC END# *48F337A20394_4680F5FF01EA_impl*
end;//Tl3DataObjectEnum.Reset

function Tl3DataObjectEnum.Clone(out Enum: IEnumFORMATETC): HResult;
//#UC START# *48F337B1039E_4680F5FF01EA_var*
//#UC END# *48F337B1039E_4680F5FF01EA_var*
begin
//#UC START# *48F337B1039E_4680F5FF01EA_impl*
 Result := E_NotImpl;
//#UC END# *48F337B1039E_4680F5FF01EA_impl*
end;//Tl3DataObjectEnum.Clone

procedure Tl3DataObjectEnum.Cleanup;
//#UC START# *479731C50290_4680F5FF01EA_var*
//#UC END# *479731C50290_4680F5FF01EA_var*
begin
//#UC START# *479731C50290_4680F5FF01EA_impl*
 FreeAndNil(f_DataObject);
 inherited;
//#UC END# *479731C50290_4680F5FF01EA_impl*
end;//Tl3DataObjectEnum.Cleanup

end.