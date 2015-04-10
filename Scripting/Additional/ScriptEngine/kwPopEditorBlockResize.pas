unit kwPopEditorBlockResize;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorBlockResize.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_BlockResize
//
// *Формат:
// aDelta aTop anEditor  pop:editor:BlockResize
// * aDelta - смещение блока
// * aTop - true чтобы двигать верхнюю границу
// * anEditor - редактор, в котором изменяется блок.
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
  evCustomEditorWindow,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwBlockResize.imp.pas}
 TkwPopEditorBlockResize = class(_kwBlockResize_)
  {* *Формат:
aDelta aTop anEditor  pop:editor:BlockResize
* aDelta - смещение блока
* aTop - true чтобы двигать верхнюю границу
* anEditor - редактор, в котором изменяется блок. }
 protected
 // realized methods
   procedure CorrectBlockPoint(const aCtx: TtfwContext;
     var aMap: InevMap;
     var aCursor: InevBasePoint); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorBlockResize
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Units,
  nevGUIInterfaces,
  l3Base,
  Block_Const,
  TextPara_Const,
  CommentPara_Const,
  Windows,
  evParaTools,
  evOp,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorBlockResize;

{$Include ..\ScriptEngine\kwBlockResize.imp.pas}

// start class TkwPopEditorBlockResize

procedure TkwPopEditorBlockResize.CorrectBlockPoint(const aCtx: TtfwContext;
  var aMap: InevMap;
  var aCursor: InevBasePoint);
//#UC START# *514BFC55039E_4F38F6E001CB_var*
//#UC END# *514BFC55039E_4F38F6E001CB_var*
begin
//#UC START# *514BFC55039E_4F38F6E001CB_impl*
 
//#UC END# *514BFC55039E_4F38F6E001CB_impl*
end;//TkwPopEditorBlockResize.CorrectBlockPoint

class function TkwPopEditorBlockResize.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:BlockResize';
end;//TkwPopEditorBlockResize.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwBlockResize.imp.pas}
{$IfEnd} //not NoScripts

end.