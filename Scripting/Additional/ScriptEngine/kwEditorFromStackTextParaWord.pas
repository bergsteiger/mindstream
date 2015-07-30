unit kwEditorFromStackTextParaWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwEditorFromStackTextParaWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::TkwEditorFromStackTextParaWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  kwEditorFromStackCursorWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwEditorFromStackTextParaWord = {abstract} class(TkwEditorFromStackCursorWord)
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 protected
 // protected methods
   procedure DoPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); virtual; abstract;
 end;//TkwEditorFromStackTextParaWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  LeafPara_Const,
  evOp,
  CommentPara_Const,
  TextPara_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwEditorFromStackTextParaWord

procedure TkwEditorFromStackTextParaWord.DoCursor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPoint: InevBasePoint);
//#UC START# *50B8BCDF0093_50BA0B820089_var*
var
 l_P : InevBasePoint;
 l_O : InevPara;
//#UC END# *50B8BCDF0093_50BA0B820089_var*
begin
//#UC START# *50B8BCDF0093_50BA0B820089_impl*
 l_P := aPoint.MostInner;
 if not l_P.Obj.AsObject.QT(InevPara, l_O) then
  RunnerError('', aCtx);
 RunnerAssert(l_O.AsObject.IsKindOf(k2_typLeafPara), '', aCtx);
 DoPara(aCtx, anEditor, l_O);
//#UC END# *50B8BCDF0093_50BA0B820089_impl*
end;//TkwEditorFromStackTextParaWord.DoCursor

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwEditorFromStackTextParaWord
 TkwEditorFromStackTextParaWord.RegisterClass;
{$IfEnd} //not NoScripts

end.