unit Script.Word.Buttons;

interface

uses
 Script.WordsInterfaces,
 Script.Word
 ;

type
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
 System.Classes,

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
 l_ActiveForm : TForm;
 l_Index : Integer;
begin
 l_Name := aContext.PopString;
 Assert(l_Name <> '');
 l_ActiveForm := nil;
 for l_Index := 0 to Pred(Screen.FormCount) do
  if (Screen.Forms[l_Index].ClassName <> 'TGUITestRunner') then
  begin
   l_ActiveForm := Screen.Forms[l_Index];
   break;
  end;//Screen.Forms[l_Index].ClassName <> 'TGUITestRunner'
 Assert(l_ActiveForm <> nil);
 l_Component := l_ActiveForm.FindComponent(l_Name);
 Assert(l_Component <> nil);
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
 Assert(l_Component Is TButton);
 TControlAccess(l_Component).Click;
end;

initialization
 TscriptEngine.RegisterKeyWord('FindComponent', TkwFindComponent);
 TscriptEngine.RegisterKeyWord('ButtonClick', TkwButtonClick);

end.
