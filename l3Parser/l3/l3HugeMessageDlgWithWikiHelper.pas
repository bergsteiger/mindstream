unit l3HugeMessageDlgWithWikiHelper;

 

{$Include ..\L3\l3Define.inc}

interface

{$If not defined(NoVCL)}
uses
  l3ProtoObject
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
type
 Tl3WikiLinkClicked = procedure (const aLinkData: AnsiString) of object;

(*
 Ml3HugeMessageDlgWithWikiHelper = PureMixIn
  {* Контракт сервиса Tl3HugeMessageDlgWithWikiHelper }
   procedure Say(const aText: AnsiString;
    aClickCallback: Tl3WikiLinkClicked);
   function FormatLink(const aLinkText: AnsiString;
    const aLinkData: AnsiString): AnsiString;
   function FormatCloak(const aCaption: AnsiString;
    const aText: AnsiString): AnsiString;
   function CanUseWiki: Boolean;
 end;//Ml3HugeMessageDlgWithWikiHelper
*)

 Il3HugeMessageDlgWithWikiHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3HugeMessageDlgWithWikiHelper }
   ['{E19F61CE-9AEF-409B-814C-B75941D1010E}']
  // Ml3HugeMessageDlgWithWikiHelper
   procedure Say(const aText: AnsiString;
    aClickCallback: Tl3WikiLinkClicked);
   function FormatLink(const aLinkText: AnsiString;
    const aLinkData: AnsiString): AnsiString;
   function FormatCloak(const aCaption: AnsiString;
    const aText: AnsiString): AnsiString;
   function CanUseWiki: Boolean;
 end;//Il3HugeMessageDlgWithWikiHelper

 Tl3HugeMessageDlgWithWikiHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3HugeMessageDlgWithWikiHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3HugeMessageDlgWithWikiHelper);
 public
 // realized methods
   procedure Say(const aText: AnsiString;
     aClickCallback: Tl3WikiLinkClicked);
   function FormatCloak(const aCaption: AnsiString;
     const aText: AnsiString): AnsiString;
   function FormatLink(const aLinkText: AnsiString;
     const aLinkData: AnsiString): AnsiString;
   function CanUseWiki: Boolean;
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // public properties
   property Alien: Il3HugeMessageDlgWithWikiHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3HugeMessageDlgWithWikiHelper }
 public
 // singleton factory method
   class function Instance: Tl3HugeMessageDlgWithWikiHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3HugeMessageDlgWithWikiHelper
{$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  l3Base {a},
  Forms,
  Controls,
  SysUtils,
  StdCtrls,
  ExtCtrls
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}


// start class Tl3HugeMessageDlgWithWikiHelper

var g_Tl3HugeMessageDlgWithWikiHelper : Tl3HugeMessageDlgWithWikiHelper = nil;

procedure Tl3HugeMessageDlgWithWikiHelperFree;
begin
 l3Free(g_Tl3HugeMessageDlgWithWikiHelper);
end;

class function Tl3HugeMessageDlgWithWikiHelper.Instance: Tl3HugeMessageDlgWithWikiHelper;
begin
 if (g_Tl3HugeMessageDlgWithWikiHelper = nil) then
 begin
  l3System.AddExitProc(Tl3HugeMessageDlgWithWikiHelperFree);
  g_Tl3HugeMessageDlgWithWikiHelper := Create;
 end;
 Result := g_Tl3HugeMessageDlgWithWikiHelper;
end;


procedure Tl3HugeMessageDlgWithWikiHelper.pm_SetAlien(const aValue: Il3HugeMessageDlgWithWikiHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3HugeMessageDlgWithWikiHelper.pm_SetAlien

class function Tl3HugeMessageDlgWithWikiHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3HugeMessageDlgWithWikiHelper <> nil;
end;//Tl3HugeMessageDlgWithWikiHelper.Exists

procedure Tl3HugeMessageDlgWithWikiHelper.Say(const aText: AnsiString;
  aClickCallback: Tl3WikiLinkClicked);
//#UC START# *03211FE23BF3_551542E902F5_var*
 procedure SimpleSay(const aInfo: AnsiString);
 var
  l_Form: TForm;
  l_Memo: TMemo;
  l_Panel: TPanel;
  l_Button: TButton;
 begin
  l_Form := TForm.Create(nil);
  try
   with l_Form do
   begin
    Position := poScreenCenter;
    BorderStyle := bsDialog;
    Caption := 'Information';
    Width := 640;
    Height := 480;
   end;
   l_Button := TButton.Create(l_Form);
   with l_Button do
   begin
    Caption := 'OK';
    ModalResult := mrCancel;
    Default := True;
    Cancel := True;
   end;
   l_Panel := TPanel.Create(l_Form);
   with l_Panel do
   begin
    Height := l_Button.Height + 16;
    BevelOuter := bvNone;
    Parent := l_Form;
    Align := alBottom;
   end;
   with l_Button do
   begin
    Parent := l_Panel;
    Left := (l_Panel.ClientWidth - Width) div 2;
    Top := 8;
   end;
   l_Memo := TMemo.Create(l_Form);
   with l_Memo do
   begin
    Parent := l_Form;
    Align := alClient;
    ScrollBars := ssBoth;
    Text := aInfo;
   end;
   l_Form.ShowModal;
  finally
   FreeAndNil(l_Form);
  end;
 end;
//#UC END# *03211FE23BF3_551542E902F5_var*
begin
//#UC START# *03211FE23BF3_551542E902F5_impl*
 if Assigned(f_Alien) then
  f_Alien.Say(aText, aClickCallback)
 else
  SimpleSay(aText);
//#UC END# *03211FE23BF3_551542E902F5_impl*
end;//Tl3HugeMessageDlgWithWikiHelper.Say

function Tl3HugeMessageDlgWithWikiHelper.FormatCloak(const aCaption: AnsiString;
  const aText: AnsiString): AnsiString;
//#UC START# *3CDB8D32C712_551542E902F5_var*
//#UC END# *3CDB8D32C712_551542E902F5_var*
begin
//#UC START# *3CDB8D32C712_551542E902F5_impl*
 if Assigned(f_Alien) then
  Result := f_Alien.FormatCloak(aCaption, aText)
 else
  Result := aCaption + #13#10 + aText + #13#10;
//#UC END# *3CDB8D32C712_551542E902F5_impl*
end;//Tl3HugeMessageDlgWithWikiHelper.FormatCloak

function Tl3HugeMessageDlgWithWikiHelper.FormatLink(const aLinkText: AnsiString;
  const aLinkData: AnsiString): AnsiString;
//#UC START# *5AFFFDE1F6AB_551542E902F5_var*
//#UC END# *5AFFFDE1F6AB_551542E902F5_var*
begin
//#UC START# *5AFFFDE1F6AB_551542E902F5_impl*
 if Assigned(f_Alien) then
  Result := f_Alien.FormatLink(aLinkText, aLinkData)
 else
  Result := aLinkText;
//#UC END# *5AFFFDE1F6AB_551542E902F5_impl*
end;//Tl3HugeMessageDlgWithWikiHelper.FormatLink

function Tl3HugeMessageDlgWithWikiHelper.CanUseWiki: Boolean;
//#UC START# *CDCC556698E5_551542E902F5_var*
//#UC END# *CDCC556698E5_551542E902F5_var*
begin
//#UC START# *CDCC556698E5_551542E902F5_impl*
 Result := Assigned(f_Alien) and f_Alien.CanUseWiki;
//#UC END# *CDCC556698E5_551542E902F5_impl*
end;//Tl3HugeMessageDlgWithWikiHelper.CanUseWiki

procedure Tl3HugeMessageDlgWithWikiHelper.ClearFields;
 {-}
begin
 {$If not defined(NoVCL)}
 Alien := nil;
 {$IfEnd} //not NoVCL
 inherited;
end;//Tl3HugeMessageDlgWithWikiHelper.ClearFields

{$IfEnd} //not NoVCL

end.