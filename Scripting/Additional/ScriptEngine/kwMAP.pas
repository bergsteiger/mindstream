unit kwMAP;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMAP.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::MAP
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
 TkwMAP = {final} class(_tfwArrayAndLambdaWord_)
 protected
 // realized methods
   procedure DoArrayAndLambda(const aCtx: TtfwContext;
     const anArray: ItfwValueList;
     aLambda: TtfwWord); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMAP
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwMappedArrayView,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMAP;

{$Include ..\ScriptEngine\tfwArrayAndLambdaWord.imp.pas}

// start class TkwMAP

procedure TkwMAP.DoArrayAndLambda(const aCtx: TtfwContext;
  const anArray: ItfwValueList;
  aLambda: TtfwWord);
//#UC START# *52E7D17100B5_52E666A001E8_var*
//#UC END# *52E7D17100B5_52E666A001E8_var*
begin
//#UC START# *52E7D17100B5_52E666A001E8_impl*
 aCtx.rEngine.Push(TtfwStackValue_C(TtfwMappedArrayView.Make(anArray, aLambda)));
//#UC END# *52E7D17100B5_52E666A001E8_impl*
end;//TkwMAP.DoArrayAndLambda

class function TkwMAP.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'MAP';
end;//TkwMAP.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwArrayAndLambdaWord.imp.pas}
{$IfEnd} //not NoScripts

end.