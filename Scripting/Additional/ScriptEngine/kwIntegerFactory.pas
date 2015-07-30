unit kwIntegerFactory;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwIntegerFactory.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::PrimitiveWords::TkwIntegerFactory
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwInteger,
  kwIntegerArray
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwIntegerFactory = class(TkwIntegerArray)
 public
 // public methods
   function MakeKW(aValue: Integer): TkwInteger;
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TkwIntegerFactory;
    {- возвращает экземпляр синглетона. }
 end;//TkwIntegerFactory
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a},
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TkwIntegerFactory

var g_TkwIntegerFactory : TkwIntegerFactory = nil;

procedure TkwIntegerFactoryFree;
begin
 l3Free(g_TkwIntegerFactory);
end;

class function TkwIntegerFactory.Instance: TkwIntegerFactory;
begin
 if (g_TkwIntegerFactory = nil) then
 begin
  l3System.AddExitProc(TkwIntegerFactoryFree);
  g_TkwIntegerFactory := Create;
 end;
 Result := g_TkwIntegerFactory;
end;


function TkwIntegerFactory.MakeKW(aValue: Integer): TkwInteger;
//#UC START# *4F3E412801B7_4F3E401D03AF_var*
const
 cLimit = 3000;
var
 l_KW : TkwInteger;
//#UC END# *4F3E412801B7_4F3E401D03AF_var*
begin
//#UC START# *4F3E412801B7_4F3E401D03AF_impl*
 if (aValue >= 0) AND (aValue < cLimit) then
 begin
  l_KW := Self.Items[aValue];
  if (l_KW = nil) then
  begin
   l_KW := TkwInteger.Create(aValue);
   Self.Items[aValue] := l_KW;
   Result := l_KW;
  end//l_KW = nil
  else
   Result := l_KW.Use;
 end//aValue < cLimit
 else
  Result := TkwInteger.Create(aValue);
//#UC END# *4F3E412801B7_4F3E401D03AF_impl*
end;//TkwIntegerFactory.MakeKW

class function TkwIntegerFactory.Exists: Boolean;
 {-}
begin
 Result := g_TkwIntegerFactory <> nil;
end;//TkwIntegerFactory.Exists

{$IfEnd} //not NoScripts

end.