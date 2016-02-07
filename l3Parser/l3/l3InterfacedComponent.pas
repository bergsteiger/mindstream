unit l3InterfacedComponent;


{$Include ..\L3\l3Define.inc}

interface

uses
  Classes,
  l3IID,
  l3PureMixIns
  ;

type
//#UC START# *47541E17024Eci*
 {$Define _UnknownIsBaseComponent}
//#UC END# *47541E17024Eci*
 _l3Unknown_Parent_ = TComponent;
 {$Include ..\L3\l3Unknown.imp.pas}
 Tl3InterfacedComponent = class(_l3Unknown_)
  {* Базовый класс компонентов, поддерживающих счетчик ссылок и интерфейсы IUnknown. }
 protected
 // overridden protected methods
   function QueryInterface(const IID: TGUID;
    out Obj): HResult; override;
 protected
 // protected methods
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; virtual;
     {* метод для реализации QueryInterface (Для перекрытия в потомках). }
 public
 // public methods
   constructor CreateX;
//#UC START# *47541E17024Epubl*
//#UC END# *47541E17024Epubl*
 end;//Tl3InterfacedComponent

implementation

uses
  SysUtils,
  l3Base,
  l3Core,
  Windows,
  l3MemUtils,
  l3Interlocked
  ;

{$Include ..\L3\l3Unknown.imp.pas}

// start class Tl3InterfacedComponent

function Tl3InterfacedComponent.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *47D16038003C_47541E17024E_var*
//#UC END# *47D16038003C_47541E17024E_var*
begin
//#UC START# *47D16038003C_47541E17024E_impl*
 Pointer(Obj) := nil;
 Result.SetNOINTERFACE;
//#UC END# *47D16038003C_47541E17024E_impl*
end;//Tl3InterfacedComponent.COMQueryInterface

constructor Tl3InterfacedComponent.CreateX;
//#UC START# *47D16214006E_47541E17024E_var*
//#UC END# *47D16214006E_47541E17024E_var*
begin
//#UC START# *47D16214006E_47541E17024E_impl*
 Create(nil);
//#UC END# *47D16214006E_47541E17024E_impl*
end;//Tl3InterfacedComponent.CreateX

function Tl3InterfacedComponent.QueryInterface(const IID: TGUID;
  out Obj): HResult;
//#UC START# *47D160620295_47541E17024E_var*
var
 l_Res : Tl3HResult;
//#UC END# *47D160620295_47541E17024E_var*
begin
//#UC START# *47D160620295_47541E17024E_impl*
 Result := inherited QueryInterface(IID, Obj);
 if l3IFail(Result) then
 begin
  l_Res := COMQueryInterface(Tl3GUID_C(IID), Obj);
  Result := l_Res.Res
 end;//l3IFail(Result)
//#UC END# *47D160620295_47541E17024E_impl*
end;//Tl3InterfacedComponent.QueryInterface

//#UC START# *47541E17024Eimpl*
//#UC END# *47541E17024Eimpl*

end.