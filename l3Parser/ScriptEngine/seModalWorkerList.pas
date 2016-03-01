unit seModalWorkerList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "seModalWorkerList.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::CodeFlowWords::TseModalWorkerList
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  seModalWorkerListPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TseModalWorkerList = class(TseModalWorkerListPrim)
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TseModalWorkerList;
    {- возвращает экземпляр синглетона. }
 end;//TseModalWorkerList
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TseModalWorkerList

var g_TseModalWorkerList : TseModalWorkerList = nil;

procedure TseModalWorkerListFree;
begin
 l3Free(g_TseModalWorkerList);
end;

class function TseModalWorkerList.Instance: TseModalWorkerList;
begin
 if (g_TseModalWorkerList = nil) then
 begin
  l3System.AddExitProc(TseModalWorkerListFree);
  g_TseModalWorkerList := Create;
 end;
 Result := g_TseModalWorkerList;
end;


class function TseModalWorkerList.Exists: Boolean;
 {-}
begin
 Result := g_TseModalWorkerList <> nil;
end;//TseModalWorkerList.Exists

{$IfEnd} //not NoScripts

end.