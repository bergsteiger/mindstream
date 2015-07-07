unit kwWindowFromPoint;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWindowFromPoint.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::WindowFromPoint
//
// Получаем дескриптор окна по координатам.
// 
// Пример использования:
// 
// Y X WindowFromPoint .
// 
// (X, Y) - координаты точки относительно верхнего левого угла основного монитора.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwWindowFromPoint = {final} class(_tfwAutoregisteringWord_)
  {* Получаем дескриптор окна по координатам.

Пример использования:

Y X WindowFromPoint .

(X, Y) - координаты точки относительно верхнего левого угла основного монитора. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWindowFromPoint
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Windows,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWindowFromPoint;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwWindowFromPoint

procedure TkwWindowFromPoint.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F85489702F4_var*
var
 l_Point: TPoint;
//#UC END# *4DAEEDE10285_4F85489702F4_var*
begin
//#UC START# *4DAEEDE10285_4F85489702F4_impl*
 if aCtx.rEngine.IsTopInt
  then l_Point.Y := aCtx.rEngine.PopInt
  else RunnerAssert(False, 'Не заданы координаты.', aCtx);

 if aCtx.rEngine.IsTopInt
  then l_Point.X := aCtx.rEngine.PopInt
  else RunnerAssert(False, 'Не заданы координаты.', aCtx);

 aCtx.rEngine.PushInt(Windows.WindowFromPoint(l_Point));
//#UC END# *4DAEEDE10285_4F85489702F4_impl*
end;//TkwWindowFromPoint.DoDoIt

class function TkwWindowFromPoint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WindowFromPoint';
end;//TkwWindowFromPoint.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.