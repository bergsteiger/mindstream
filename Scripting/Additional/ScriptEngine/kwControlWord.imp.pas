{$IfNDef kwControlWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwControlWord.imp.pas"
// Начат: 28.04.2011 19:44
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::kwControlWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwControlWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _SystemWord_Parent_ = _tfwAutoregisteringWord_;
 {$Include ..\ScriptEngine\SystemWord.imp.pas}
 _kwControlWord_ = {abstract mixin} class(_SystemWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); virtual; abstract;
   procedure DoComponent(aControl: TComponent;
     const aCtx: TtfwContext); virtual;
 end;//_kwControlWord_
{$IfEnd} //not NoScripts

{$Else kwControlWord_imp}

{$IfNDef kwControlWord_imp_impl}
{$Define kwControlWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

{$Include ..\ScriptEngine\SystemWord.imp.pas}

type
  THackControl = {abstract} class(TControl)
  end;//THackControl

// start class _kwControlWord_

procedure _kwControlWord_.DoComponent(aControl: TComponent;
  const aCtx: TtfwContext);
//#UC START# *5357B6FB0024_4DB98B4B0382_var*
//#UC END# *5357B6FB0024_4DB98B4B0382_var*
begin
//#UC START# *5357B6FB0024_4DB98B4B0382_impl*
 RunnerAssert(false, aControl.Name + ' не является контролом, а является компонентом класса ' + aControl.ClassName, aCtx);
//#UC END# *5357B6FB0024_4DB98B4B0382_impl*
end;//_kwControlWord_.DoComponent

procedure _kwControlWord_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB98B4B0382_var*

var
 l_C : TControl;
 
 procedure GetControl;
 begin//GetControl
  l_C := FindControl(GetFocus);
  if (l_C = nil) then
  // - наверное мы под отладчиком или из под нас выдернули фокус
  begin
   if (Screen.ActiveForm <> nil) then
    l_C := Screen.ActiveForm.ActiveControl
   else 
   if (Screen.ActiveCustomForm <> nil) then
    l_C := TForm(Screen.ActiveCustomForm).ActiveControl;
  end;//l_C = nil
  RunnerAssert(l_C <> nil, 'Не смогли получить активный контрол', aCtx);
 end;//GetControl

var
{.$IFDEF Archi}
 i      : Integer;
 l_Comp : TComponent;
{.$ENDIF Archi}
 l_F    : TafwCustomForm;
 l_CP   : TComponent;
 l_N    : AnsiString;
 l_PrevClosedForm : TafwCustomForm;
 l_OriginalFormName : AnsiString;
//#UC END# *4DAEEDE10285_4DB98B4B0382_var*
begin
//#UC START# *4DAEEDE10285_4DB98B4B0382_impl*
 l_N := aCtx.rEngine.PopDelphiString;
 l_PrevClosedForm := nil;
 l_CP := nil;
 GetControl;
 if (l_C.Name <> l_N) then
 begin
  l_F := afw.GetParentForm(l_C);
  RunnerAssert(l_F <> nil, 'Не нашли родительскую форму для ' + l_C.Name, aCtx);
  l_OriginalFormName := l_F.Name;
  while (l_F <> nil) do
  begin
   if l_F.Name = l_N then
   begin
    l_CP := l_F;
    Break;
   end; // if l_F.Name = l_N then
   l_CP := l_F.FindComponent(l_N);
   {.$IFDEF Archi}
   for i := 0 to l_F.ComponentCount - 1 do
   begin
    l_Comp := l_F.Components[i];
    if (l_Comp.Name = l_N) then
    begin
     l_CP := l_Comp;
     break;
    end;//l_Comp.Name = l_N
    if l_Comp.ComponentCount > 0 then
     l_CP := l_Comp.FindComponent(l_N);
    if (l_CP <> nil) then
     Break;
   end;//for i
   {.$ENDIF Archi}
   if (l_CP <> nil) then
    Break;
   if (TForm(l_F).FormStyle = fsStayOnTop) then
   begin
    RunnerAssert(l_F <> l_PrevClosedForm, '', aCtx);
    l_PrevClosedForm := l_F;
    {$IfNDef NoVCM}
    if (l_F Is TvcmForm) then
     (l_F As TvcmForm).SafeClose
    else
    {$EndIf  NoVCM}
    begin
     l_F.Close;
     afw.ProcessMessages;
     // - чтобы форма "успела" закрыться
    end;//l_F Is TvcmForm
    GetControl;
    if (l_C.Name = l_N) then
    begin
     l_CP := l_C;
     break;
    end;//l_C.Name = l_N
    l_F := afw.GetParentForm(l_C);
    RunnerAssert(l_F <> nil, '', aCtx);
    continue;
   end;//TForm(l_F).FormStyle = fsStayOnTop
   RunnerAssert(TForm(l_F).FormStyle <> fsStayOnTop, '', aCtx);
   l_F := afw.GetAnotherParentForm(l_F);
  end;//while (l_F <> nil)
  RunnerAssert(l_CP <> nil, Format('Не найден контрол %s на форме %s', [l_N, l_OriginalFormName]), aCtx);
  if (l_CP Is TControl) then
  begin
   l_C := l_CP As TControl;
   RunnerAssert(l_C.Name = l_N, 'Имя контрола: ' + l_C.Name + ', а искали: ' + l_N, aCtx);
  end//l_CP Is TControl
  else
  begin
   RunnerAssert(l_CP.Name = l_N, 'Имя контрола: ' + l_CP.Name + ', а искали: ' + l_N, aCtx);
   DoComponent(l_CP, aCtx);
   Exit;
  end;//l_CP Is TControl
 end;//l_C.Name <> l_N
 DoControl(l_C, aCtx);
//#UC END# *4DAEEDE10285_4DB98B4B0382_impl*
end;//_kwControlWord_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  kwControlWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwControlWord_imp_impl}
{$EndIf kwControlWord_imp}
