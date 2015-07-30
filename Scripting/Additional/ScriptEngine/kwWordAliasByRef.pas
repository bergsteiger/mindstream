unit kwWordAliasByRef;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWordAliasByRef.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::WordAliasByRef
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwConstLike,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwWordAliasByRef = {final scriptword} class(TtfwConstLike)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
   function SupressNextImmediate: TtfwSuppressNextImmediate; override;
 end;//TkwWordAliasByRef
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwWordAliasByRef

class function TkwWordAliasByRef.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'WordAliasByRef';
end;//TkwWordAliasByRef.GetWordNameForRegister

procedure TkwWordAliasByRef.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F4008E501E9_var*
var
 l_W : TtfwWord;
 l_Key : TtfwKeyWord;
 l_VC  : Integer;
 l_VC1 : Integer;
//#UC END# *4F219629036A_4F4008E501E9_var*
begin
//#UC START# *4F219629036A_4F4008E501E9_impl*
 CompilerAssert((aCompiled.CodeCount = 1),
                'Неверное число парамеров для слова WordAliasByRef',
                aContext
                );
 l_W := aCompiled.GetCode(aContext)[0];
 l_VC := aContext.rEngine.ValuesCount;
 l_W.DoIt(aContext);
 l_VC1 := aContext.rEngine.ValuesCount;
 CompilerAssert(l_VC1 > l_VC,
                Format('Слово %s для WordAliasByRef %s не повысило уровень стека',
                       [
                        l_W.Key.AsString,
                        aCompiled.Key.AsString
                       ]),
                aContext);
 CompilerAssert(l_VC1 <= l_VC + 1,
                Format('Слово %s для WordAliasByRef %s повысило уровень стека более чем на одно значение',
                       [
                        l_W.Key.AsString,
                        aCompiled.Key.AsString
                       ]),
                aContext);
 l_W := aContext.rEngine.PopObj As TtfwWord;
 l_Key := TtfwKeyWord(l_W.Key);
 try
  aWordToFinish.Word := l_W;
 finally
  l_W.Key := l_Key;
 end;//try..finally
//#UC END# *4F219629036A_4F4008E501E9_impl*
end;//TkwWordAliasByRef.FinishDefinitionOfNewWord

function TkwWordAliasByRef.SupressNextImmediate: TtfwSuppressNextImmediate;
//#UC START# *4F3AB3B101FC_4F4008E501E9_var*
//#UC END# *4F3AB3B101FC_4F4008E501E9_var*
begin
//#UC START# *4F3AB3B101FC_4F4008E501E9_impl*
 Result := tfw_sniYes;
//#UC END# *4F3AB3B101FC_4F4008E501E9_impl*
end;//TkwWordAliasByRef.SupressNextImmediate

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация WordAliasByRef
 TkwWordAliasByRef.RegisterInEngine;
{$IfEnd} //not NoScripts

end.