unit NOT_FINISHED_kwMouseSetCursorPosition;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/NOT_FINISHED_kwMouseSetCursorPosition.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::TkwMouseSetCursorPosition
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Этот файл используется только для моделирования, а не для компиляции. !

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

uses
  tfwWord,
  tfwScriptingInterfaces
  ;

type
 {$Include w:\common\components\rtl\Garant\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwMouseSetCursorPosition = class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwMouseSetCursorPosition

implementation

uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;

type _Instance_R_ = TkwMouseSetCursorPosition;
type _tfwAutoregisteringWord_R_ = TkwMouseSetCursorPosition;

{$Include w:\common\components\rtl\Garant\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwMouseSetCursorPosition

procedure TkwMouseSetCursorPosition.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4EF0939D025E_var*
//#UC END# *4DAEEDE10285_4EF0939D025E_var*
begin
//#UC START# *4DAEEDE10285_4EF0939D025E_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_4EF0939D025E_impl*
end;//TkwMouseSetCursorPosition.DoDoIt

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\ScriptEngine\NOT_FINISHED_kwMouseSetCursorPosition.pas initialization enter'); {$EndIf}
 {$Include w:\common\components\rtl\Garant\ScriptEngine\tfwAutoregisteringWord.imp.pas}

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\ScriptEngine\NOT_FINISHED_kwMouseSetCursorPosition.pas initialization leave'); {$EndIf}
end.

