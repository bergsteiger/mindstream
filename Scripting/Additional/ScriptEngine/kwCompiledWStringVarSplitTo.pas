unit kwCompiledWStringVarSplitTo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledWStringVarSplitTo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::StringProcessing::TkwCompiledWStringVarSplitTo
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledVarAsStringWorker,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledWStringVarSplitTo = class(TkwCompiledVarAsStringWorker)
 protected
 // overridden protected methods
   procedure DoVar(const aCtx: TtfwContext;
     aVar: TtfwWord); override;
 end;//TkwCompiledWStringVarSplitTo
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Types,
  l3Interfaces,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledWStringVarSplitTo

procedure TkwCompiledWStringVarSplitTo.DoVar(const aCtx: TtfwContext;
  aVar: TtfwWord);
//#UC START# *4DCBCD2200D2_4F5613C102DB_var*
var
 l_P : Tl3PCharLen;
 l_S : Il3CString;
 l_WS : Tl3WString;
 l_Rest : Tl3WString;

 l_Pref : Il3CString;
 l_Suff : Il3CString;
//#UC END# *4DCBCD2200D2_4F5613C102DB_var*
begin
//#UC START# *4DCBCD2200D2_4F5613C102DB_impl*
 Tl3WString(l_P) := aVar.GetValue(aCtx).AsWString;
 l_S := aCtx.rEngine.PopString;
 l_WS := l3PCharLen(l_S);
 Assert(not l3IsNil(l_WS));
 Assert(l_P.SLen >= 0);
 if (l_WS.SLen = 1) then
 begin
  l_Rest := l3FindChar(l_WS.S[0], l_P);
  if not l3IsNil(l_P) then
   if (l_P.S[l_P.SLen - 1] = l_WS.S[0]) then
    Dec(l_P.SLen);
  aCtx.rEngine.PushWStr(l_P);
  aVar.SetValue(TtfwStackValue_C(l_Rest), aCtx);
 end//l_WS.SLen = 1
 else
 begin
  l3Split(TtfwCStringFactory.C(l_P), l_S, l_Pref, l_Suff);
  aCtx.rEngine.PushString(l_Pref);
  aVar.SetValue(TtfwStackValue_C(l_Suff), aCtx);
  //Assert(false, 'Пока не реализовано');
 end;//l_WS.SLen = 1
//#UC END# *4DCBCD2200D2_4F5613C102DB_impl*
end;//TkwCompiledWStringVarSplitTo.DoVar

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWStringVarSplitTo
 TkwCompiledWStringVarSplitTo.RegisterClass;
{$IfEnd} //not NoScripts

end.