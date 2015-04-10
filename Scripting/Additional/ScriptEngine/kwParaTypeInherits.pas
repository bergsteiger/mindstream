unit kwParaTypeInherits;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwParaTypeInherits.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CurrentEditorWords::Para_Type_Inherits
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
  nevTools,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}
 TkwParaTypeInherits = {final} class(_kwParaFromStackWord_)
 protected
 // realized methods
   procedure DoPara(const aPara: InevPara;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwParaTypeInherits
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  k2Facade,
  k2Tags,
  l3Base,
  l3String,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwParaTypeInherits;

{$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}

// start class TkwParaTypeInherits

procedure TkwParaTypeInherits.DoPara(const aPara: InevPara;
  const aCtx: TtfwContext);
//#UC START# *4EB27FB803C2_50D1CD040357_var*
//#UC END# *4EB27FB803C2_50D1CD040357_var*
begin
//#UC START# *4EB27FB803C2_50D1CD040357_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Не задан тип параграфа', aCtx);
 aCtx.rEngine.PushBool(aPara.AsObject.IsKindOf(k2.TypeTable.TypeByHandle[aCtx.rEngine.PopInt]));
//#UC END# *4EB27FB803C2_50D1CD040357_impl*
end;//TkwParaTypeInherits.DoPara

class function TkwParaTypeInherits.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Para:Type:Inherits';
end;//TkwParaTypeInherits.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.