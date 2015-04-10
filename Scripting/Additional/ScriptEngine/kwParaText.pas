unit kwParaText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwParaText.pas"
// Начат: 03.11.2011 15:52
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::TkwParaText
//
// Получает текст параграфа, который лежит на стеке.
// 
// Пример:
// {code}
// 12 editor:GetParaByID
// IF
// Para:Text .
// ELSE
// 'Параграф не найден' .
// ENDIF
// {code}
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
 TkwParaText = class(_kwParaFromStackWord_)
  {* Получает текст параграфа, который лежит на стеке.

Пример:
[code]
 12 editor:GetParaByID
 IF
  Para:Text .
 ELSE
 'Параграф не найден' .
 ENDIF
[code] }
 protected
 // realized methods
   procedure DoPara(const aPara: InevPara;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwParaText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  k2Tags,
  l3Base,
  l3String,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwParaText;

{$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}

// start class TkwParaText

procedure TkwParaText.DoPara(const aPara: InevPara;
  const aCtx: TtfwContext);
//#UC START# *4EB27FB803C2_4EB28053019F_var*
//#UC END# *4EB27FB803C2_4EB28053019F_var*
begin
//#UC START# *4EB27FB803C2_4EB28053019F_impl*
 aCtx.rEngine.PushString(aPara.AsObject.PCharLenA[k2_tiText]);
//#UC END# *4EB27FB803C2_4EB28053019F_impl*
end;//TkwParaText.DoPara

class function TkwParaText.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4EB28053019F_var*
//#UC END# *4DB0614603C8_4EB28053019F_var*
begin
//#UC START# *4DB0614603C8_4EB28053019F_impl*
 Result := 'Para:Text';
//#UC END# *4DB0614603C8_4EB28053019F_impl*
end;//TkwParaText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwParaFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.