unit Script.Word.Buttons;

interface

{$Include msDef.inc}

uses
 System.Classes,

 Script.Interfaces,
 Script.WordsInterfaces,
 Script.Word
 ;

type
 EscriptFormNotFound = class(Escript)
 end;//EscriptFormNotFound

 EscriptInvalidClass = class(Escript)
 end;//EscriptInvalidClass

 EscriptStringIsEmpty = class(Escript)
 end;//EscriptStringIsEmpty

 EscriptComponentNotFound = class(Escript)
 public
  class procedure Check(aComponent: TComponent; const aName: String); overload;
 end;//EscriptComponentNotFound

 TkwFindComponent = class(TscriptWord)
  protected
   procedure DoDoIt(aContext: TscriptContext); override;
 end;//TkwFindComponent

 TkwButtonClick = class(TscriptWord)
  protected
   procedure DoDoIt(aContext: TscriptContext); override;
 end;//TkwButtonClick

 implementation

uses
 Script.Engine,

 {$IfDef FMX}
 FMX.Controls,
 FMX.StdCtrls,
 FMX.Forms
 {$Else  FMX}
 VCL.Controls,
 VCL.StdCtrls,
 VCL.Forms
 {$EndIf FMX}
 ;

// TkwFindComponent

procedure TkwFindComponent.DoDoIt(aContext: TscriptContext);
var
 l_Name : String;
 l_Component : TComponent;
 {$IfDef FMX}
 l_ActiveForm : TCommonCustomForm;
 {$Else  FMX}
 l_ActiveForm : TForm;
 {$EndIf FMX}
 l_Index : Integer;
begin
 l_Name := aContext.PopString;
 EscriptStringIsEmpty.Check(l_Name <> '');
 l_ActiveForm := nil;
 for l_Index := 0 to Pred(Screen.FormCount) do
  if (Screen.Forms[l_Index].ClassName <> 'TGUITestRunner') then
  begin
   l_ActiveForm := Screen.Forms[l_Index];
   break;
  end;//Screen.Forms[l_Index].ClassName <> 'TGUITestRunner'
 EscriptFormNotFound.Check(l_ActiveForm <> nil);
 l_Component := l_ActiveForm.FindComponent(l_Name);
 {$IfDef CanBeComponentIsNil}
 if (l_Component = nil) then
 begin
  aContext.PushObject(l_Component);
  Exit;
 end;//l_Component = nil
 {$EndIf CanBeComponentIsNil}
 EscriptComponentNotFound.Check(l_Component, l_Name);
 aContext.PushObject(l_Component);
end;

// TkwButtonClick

type
 TControlAccess = class(TControl)
 end;//TControlAccess

procedure TkwButtonClick.DoDoIt(aContext: TscriptContext);
var
 l_Component : TComponent;
begin
 l_Component := aContext.PopObject As TComponent;
 {$IfDef CanBeComponentIsNil}
 if (l_Component = nil) then
 begin
  Exit;
 end;//l_Component = nil
 {$EndIf CanBeComponentIsNil}
 EscriptInvalidClass.Check(l_Component Is TButton);
 TControlAccess(l_Component).Click;
end;

// EscriptComponentNotFound

class procedure EscriptComponentNotFound.Check(aComponent: TComponent; const aName: String);
begin
 Check(aComponent <> nil, 'Component ' + aName + ' not found');
end;

initialization
 TscriptEngine.RegisterKeyWord('FindComponent', TkwFindComponent);
 TscriptEngine.RegisterKeyWord('ButtonClick', TkwButtonClick);

end.
