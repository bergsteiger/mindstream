unit seModalWorker;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "seModalWorker.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: UtilityPack::Class Shared Delphi Low Level::ScriptEngine::CodeFlowWords::seModalWorker
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces
  ;

type
 TseModalWorker = {$IfDef XE4}record{$Else}object{$EndIf}
 public
   rWord : TtfwWord;
   rContext : PtfwContext;
 public
    procedure Free;
 end;//TseModalWorker

function TseModalWorker_C(aWord: TtfwWord;
     const aContext: TtfwContext): TseModalWorker;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
// start class TseModalWorker

procedure TseModalWorker.Free;
//#UC START# *4FC755BA022E_4FC7557C0082_var*
//#UC END# *4FC755BA022E_4FC7557C0082_var*
begin
//#UC START# *4FC755BA022E_4FC7557C0082_impl*
 // - ничего не делаем пока
//#UC END# *4FC755BA022E_4FC7557C0082_impl*
end;//TseModalWorker.Free

function TseModalWorker_C(aWord: TtfwWord;
        const aContext: TtfwContext): TseModalWorker;
//#UC START# *4FC755E000C9_4FC7557C0082_var*
//#UC END# *4FC755E000C9_4FC7557C0082_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4FC755E000C9_4FC7557C0082_impl*
 Result.rWord := aWord;
 Result.rContext := @aContext;
//#UC END# *4FC755E000C9_4FC7557C0082_impl*
end;//TseModalWorker.C

{$IfEnd} //not NoScripts
end.