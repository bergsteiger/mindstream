unit kwPopFormFormStyle;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopFormFormStyle.pas"
// Начат: 02.02.2012 14:49
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FormsProcessing::pop_form_FormStyle
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
  Forms,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwCustomFormFromStackWord.imp.pas}
 TkwPopFormFormStyle = class(_kwCustomFormFromStackWord_)
 protected
 // realized methods
   procedure DoCustomForm(aForm: TCustomForm;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFormFormStyle
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopFormFormStyle;

{$Include ..\ScriptEngine\kwCustomFormFromStackWord.imp.pas}

// start class TkwPopFormFormStyle

procedure TkwPopFormFormStyle.DoCustomForm(aForm: TCustomForm;
  const aCtx: TtfwContext);
//#UC START# *4F2A69ED0387_4F2A6A1D0149_var*
//#UC END# *4F2A69ED0387_4F2A6A1D0149_var*
begin
//#UC START# *4F2A69ED0387_4F2A6A1D0149_impl*
 aCtx.rEngine.PushInt(Ord(TForm(aForm).FormStyle));
//#UC END# *4F2A69ED0387_4F2A6A1D0149_impl*
end;//TkwPopFormFormStyle.DoCustomForm

class function TkwPopFormFormStyle.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:form:FormStyle';
end;//TkwPopFormFormStyle.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwCustomFormFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.