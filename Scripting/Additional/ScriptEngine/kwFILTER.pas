unit kwFILTER;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFILTER.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::FILTER
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
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwArrayAndLambdaWord.imp.pas}
 TkwFILTER = {final} class(_tfwArrayAndLambdaWord_)
 protected
 // realized methods
   procedure DoArrayAndLambda(const aCtx: TtfwContext;
     const anArray: ItfwValueList;
     aLambda: TtfwWord); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFILTER
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwFilteredArrayView,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFILTER;

{$Include ..\ScriptEngine\tfwArrayAndLambdaWord.imp.pas}

// start class TkwFILTER

procedure TkwFILTER.DoArrayAndLambda(const aCtx: TtfwContext;
  const anArray: ItfwValueList;
  aLambda: TtfwWord);
//#UC START# *52E7D17100B5_52E6753C011A_var*
//#UC END# *52E7D17100B5_52E6753C011A_var*
begin
//#UC START# *52E7D17100B5_52E6753C011A_impl*
 aCtx.rEngine.Push(TtfwStackValue_C(TtfwFilteredArrayView.Make(anArray, aLambda)));
//#UC END# *52E7D17100B5_52E6753C011A_impl*
end;//TkwFILTER.DoArrayAndLambda

class function TkwFILTER.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'FILTER';
end;//TkwFILTER.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwArrayAndLambdaWord.imp.pas}
{$IfEnd} //not NoScripts

end.