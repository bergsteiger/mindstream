unit kwCompiledCheckVarByRef;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledCheckVarByRef.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::MembersWorking::TkwCompiledCheckVarByRef
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
  tfwScriptingInterfaces,
  kwCompiledWordWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledCheckVarByRef = class(TkwCompiledWordWorker)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   procedure SetValue(const aValue: TtfwStackValue;
     const aCtx: TtfwContext;
     aNeedCheckType: Boolean = true); override;
   function GetValue(const aCtx: TtfwContext): TtfwStackValue; override;
 protected
 // protected methods
   function GetVar(const aCtx: TtfwContext): TtfwWord;
 end;//TkwCompiledCheckVarByRef
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledVar,
  SysUtils,
  kwCompiledWord,
  kwVAR,
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledCheckVarByRef

function TkwCompiledCheckVarByRef.GetVar(const aCtx: TtfwContext): TtfwWord;
//#UC START# *53E22298012B_4F3F9BDF0285_var*
var
 l_O : TObject;
 l_S : Il3CString;
 l_KW : TtfwKeyWord;
 l_W : TtfwWord;
//#UC END# *53E22298012B_4F3F9BDF0285_var*
begin
//#UC START# *53E22298012B_4F3F9BDF0285_impl*
 l_O := aCtx.rEngine.PopObj;
 f_Word.DoIt(aCtx);
 l_S := aCtx.rEngine.PopString;
 if (l_O Is TkwCompiledWord) then
 begin
  l_KW := ItfwNewWordDefinitor(TkwCompiledWord(l_O)).CheckWord(l_S);
  l_W := l_KW.Word;
  if (l_W = nil) then
  begin
   l_W := TkwCompiledVar.Create((aCtx.rEngine.As_ItfwKeywordFinder.KeywordByName[TtfwCStringFactory.C(TkwVar.GetWordNameForRegister)] As TtfwKeyWord).Word,
                                   // - чтобы обеспечить слову нужный "стереотип"
                                   //   хак конечно, надо как-то константу хотя бы завести
                                  TkwCompiledWord(l_O){PrevFinder},
                                  TtfwTypeInfo_E{Modifiers},
                                  aCtx,
                                  l_KW);
   try
    l_KW.Word := l_W;
    Result := l_W;
   finally
    FreeAndNil(l_W);
   end;//try..finally
  end//l_W = nil
  else
   Result := l_W;
 end//l_O Is TkwCompiledWord
 else
  Result := nil;
//#UC END# *53E22298012B_4F3F9BDF0285_impl*
end;//TkwCompiledCheckVarByRef.GetVar

procedure TkwCompiledCheckVarByRef.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F3F9BDF0285_var*
var
 l_W : TtfwWord;
//#UC END# *4DAEEDE10285_4F3F9BDF0285_var*
begin
//#UC START# *4DAEEDE10285_4F3F9BDF0285_impl*
 l_W := GetVar(aCtx);
 if (l_W <> nil) then
  aCtx.rEngine.PushObj(l_W)
 else
  aCtx.rEngine.Push(TtfwStackValue_NULL);
//#UC END# *4DAEEDE10285_4F3F9BDF0285_impl*
end;//TkwCompiledCheckVarByRef.DoDoIt

procedure TkwCompiledCheckVarByRef.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
//#UC START# *52D00B00031A_4F3F9BDF0285_var*
var
 l_W : TtfwWord;
//#UC END# *52D00B00031A_4F3F9BDF0285_var*
begin
//#UC START# *52D00B00031A_4F3F9BDF0285_impl*
 l_W := GetVar(aCtx);
 CompilerAssert(l_W <> nil, 'Не удалось вычислить переменную для записи', aCtx);
 l_W.SetValue(aValue, aCtx, aNeedCheckType);
//#UC END# *52D00B00031A_4F3F9BDF0285_impl*
end;//TkwCompiledCheckVarByRef.SetValue

function TkwCompiledCheckVarByRef.GetValue(const aCtx: TtfwContext): TtfwStackValue;
//#UC START# *52D399A00173_4F3F9BDF0285_var*
var
 l_W : TtfwWord;
//#UC END# *52D399A00173_4F3F9BDF0285_var*
begin
//#UC START# *52D399A00173_4F3F9BDF0285_impl*
 l_W := GetVar(aCtx);
 CompilerAssert(l_W <> nil, 'Не удалось вычислить переменную для чтения', aCtx);
 Result := l_W.GetValue(aCtx);
//#UC END# *52D399A00173_4F3F9BDF0285_impl*
end;//TkwCompiledCheckVarByRef.GetValue

{$IfEnd} //not NoScripts

end.