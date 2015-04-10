{$IfNDef kwEditorGetTableFromCursor_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEditorGetTableFromCursor.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwEditorGetTableFromCursor
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwEditorGetTableFromCursor_imp}
{$If not defined(NoScripts)}
 _kwEditorGetTableFromCursor_ = {mixin} class(_kwEditorGetTableFromCursor_Parent_)
 protected
 // protected methods
   function GetTablePoint(const aCtx: TtfwContext;
     const aCursorPoint: InevBasePoint): InevBasePoint;
 end;//_kwEditorGetTableFromCursor_
{$IfEnd} //not NoScripts

{$Else kwEditorGetTableFromCursor_imp}

{$If not defined(NoScripts)}

// start class _kwEditorGetTableFromCursor_

function _kwEditorGetTableFromCursor_.GetTablePoint(const aCtx: TtfwContext;
  const aCursorPoint: InevBasePoint): InevBasePoint;
//#UC START# *4F549C0101F6_4F549BD300D3_var*
var
 l_TablePoint: InevBasePoint;
//#UC END# *4F549C0101F6_4F549BD300D3_var*
begin
//#UC START# *4F549C0101F6_4F549BD300D3_impl*
 Result := aCursorPoint;
 while Result <> nil do
 begin
  while (Result <> nil) and not Result.AsObject.IsKindOf(k2_typTable) do
   Result := Result.Inner;
  if Result <> nil then
  begin
   l_TablePoint := Result;
   Result := Result.Inner;
  end; // if Result <> nil then
 end; // while Result <> nil do
 Result := l_TablePoint;
 RunnerAssert(Result <> nil, 'Курсор не в таблице.', aCtx);
//#UC END# *4F549C0101F6_4F549BD300D3_impl*
end;//_kwEditorGetTableFromCursor_.GetTablePoint

{$IfEnd} //not NoScripts

{$EndIf kwEditorGetTableFromCursor_imp}
