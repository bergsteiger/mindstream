unit l3ComponentInfoHelper;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  Classes
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  
  {$If not defined(NoVCL)}
  ,
  Menus
  {$IfEnd} //not NoVCL
  ,
  Windows,
  l3ProtoObject,
  l3RTTI
  {$If not defined(NoVCL)}
  ,
  l3PopupMenuHelper
  {$IfEnd} //not NoVCL
  
  {$If not defined(NoVCL)}
  ,
  l3HugeMessageDlgWithWikiHelper
  {$IfEnd} //not NoVCL
  ,
  l3Core
  ;

type
 TRTTIInfoType = (
   itHierarchyOnly
 , itDetailed
 );//TRTTIInfoType

 Tl3ComponentInfoHelper = class(Tl3ProtoObject, Il3GetMessageListener)
  {* Отображаем RTTI-информацию о компонентах.
Alt+Ctrl+Shift+LClick - подробная информация;
Alt+Ctrl+Shift+RClick - краткая информация вместе с иерархией вложенности;
Alt+Ctrl+Shift+C - контрол, захвативший ввод;
Alt+Ctrl+Shift+A - контрол в фокусе. }
 private
 // private fields
   f_ClickPos : TPoint;
   f_MenuInfoString : AnsiString;
 private
 // private methods
   procedure ObjectPropFound(anObject: TObject;
     var aValue: AnsiString);
   procedure OnJumpToObjectProp(const aLinkData: AnsiString);
   procedure ShowRTTIMessageForObject(anObject: TObject;
     aInfoType: TRTTIInfoType;
     aBindedControl: TControl = nil);
   function FormatMenuInfo(aMenu: TMenuItem;
     const aCaption: AnsiString): AnsiString;
   procedure PopupMenuCallback(aMenu: TMenuItem);
   function FormatMenuInfoForControl(aControl: TControl): AnsiString;
   procedure FormatObjectInfo(anObject: TObject;
     anInfoType: TRTTIInfoType;
     out aResult: AnsiString);
 protected
 // realized methods
   procedure GetMessageListenerNotify(Code: Integer;
     aWParam: WPARAM;
     Msg: PMsg;
     var theResult: Tl3HookProcResult);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: Tl3ComponentInfoHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3ComponentInfoHelper

implementation

uses
  l3Base {a}
  {$If not defined(NoVCL)}
  ,
  l3IterateComponentParents
  {$IfEnd} //not NoVCL
  ,
  l3ListenersManager,
  Messages
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  ,
  TypInfo
  {$If not defined(NoVCL)}
  ,
  ActnList
  {$IfEnd} //not NoVCL
  ,
  StrUtils,
  SysUtils
  {$If not defined(NoVCL)}
  ,
  l3FormatActionInfoHelper
  {$IfEnd} //not NoVCL
  
  {$If not defined(NoVCL)}
  ,
  l3GetComponentFromPointHelper
  {$IfEnd} //not NoVCL
  
  {$If not defined(NoVCL)}
  ,
  l3FormatObjectInfoHelper
  {$IfEnd} //not NoVCL
  
  ;


// start class Tl3ComponentInfoHelper

var g_Tl3ComponentInfoHelper : Tl3ComponentInfoHelper = nil;

procedure Tl3ComponentInfoHelperFree;
begin
 l3Free(g_Tl3ComponentInfoHelper);
end;

class function Tl3ComponentInfoHelper.Instance: Tl3ComponentInfoHelper;
begin
 if (g_Tl3ComponentInfoHelper = nil) then
 begin
  l3System.AddExitProc(Tl3ComponentInfoHelperFree);
  g_Tl3ComponentInfoHelper := Create;
 end;
 Result := g_Tl3ComponentInfoHelper;
end;


type
  TControlFriend = {abstract} class(TControl)
   {* Друг для TControl }
  end;//TControlFriend

// start class Tl3ComponentInfoHelper

procedure Tl3ComponentInfoHelper.ObjectPropFound(anObject: TObject;
  var aValue: AnsiString);
//#UC START# *532059A801C4_4F72CAA90045_var*
var
 C: TComponent;
//#UC END# *532059A801C4_4F72CAA90045_var*
begin
//#UC START# *532059A801C4_4F72CAA90045_impl*
 if anObject is TComponent then
 begin
  C := TComponent(anObject);
  if Length(C.Name) > 0 then
   aValue := C.Name;
 end;
 aValue := Tl3HugeMessageDlgWithWikiHelper.Instance.FormatLink(aValue + ' : ' + anObject.ClassName, IntToStr(Integer(anObject)));
//#UC END# *532059A801C4_4F72CAA90045_impl*
end;//Tl3ComponentInfoHelper.ObjectPropFound

procedure Tl3ComponentInfoHelper.OnJumpToObjectProp(const aLinkData: AnsiString);
//#UC START# *53205A0E038A_4F72CAA90045_var*
var
 l_Obj: TObject;
//#UC END# *53205A0E038A_4F72CAA90045_var*
begin
//#UC START# *53205A0E038A_4F72CAA90045_impl*
 l_Obj := TObject(StrToInt(aLinkData));
 ShowRTTIMessageForObject(l_Obj, itDetailed);
//#UC END# *53205A0E038A_4F72CAA90045_impl*
end;//Tl3ComponentInfoHelper.OnJumpToObjectProp

procedure Tl3ComponentInfoHelper.ShowRTTIMessageForObject(anObject: TObject;
  aInfoType: TRTTIInfoType;
  aBindedControl: TControl = nil);
//#UC START# *53205A240166_4F72CAA90045_var*
var
 l_Control: TControl;
 l_ControlInfo: AnsiString;
 l_S: AnsiString;
//#UC END# *53205A240166_4F72CAA90045_var*
begin
//#UC START# *53205A240166_4F72CAA90045_impl*
 l_S := '';

 if anObject is TControl then
  l_Control := TControl(anObject)
 else
  l_Control := aBindedControl;

 if (aInfoType = itDetailed) and Assigned(l_Control) then
  l_S := FormatMenuInfoForControl(l_Control);

 if Length(l_S) <> 0 then
  l_S := l_S + #13#10;

 FormatObjectInfo(anObject, aInfoType, l_ControlInfo);
 l_S := l_S + l_ControlInfo;

 if (l_S <> '') then
  Tl3HugeMessageDlgWithWikiHelper.Instance.Say(l_S, OnJumpToObjectProp);
//#UC END# *53205A240166_4F72CAA90045_impl*
end;//Tl3ComponentInfoHelper.ShowRTTIMessageForObject

function Tl3ComponentInfoHelper.FormatMenuInfo(aMenu: TMenuItem;
  const aCaption: AnsiString): AnsiString;
//#UC START# *5502BE68030B_4F72CAA90045_var*
 function MenuItemInfo(anItem: TMenuItem; aLevel: Integer): AnsiString;
 var
  I: Integer;
  l_ItemInfo: AnsiString;
  l_ActionInfo: AnsiString;
  l_OpName: AnsiString;
  l_S: AnsiString;
 begin
  Result := '';
  if not (Assigned(anItem) and anItem.Visible) then
   Exit;
  {$IfDef l3HackedVCL}
  anItem.CallInitiateActions;
  {$EndIf l3HackedVCL}
  if aLevel > 0
   then l_ItemInfo := '''' + anItem.Caption + ''' '
   else l_ItemInfo := '';
  if Assigned(anItem.Action) then
  begin
   Assert(anItem.Action is TCustomAction);
   l_ItemInfo := l_ItemInfo + ', Action: ' + Tl3FormatActionInfoHelper.Instance.Format(TCustomAction(anItem.Action));
  end;
  if Length(l_ItemInfo) > 0 then
   l_ItemInfo := DupeString('  ', aLevel - 1) + l_ItemInfo;
  l_ItemInfo := l_ItemInfo + #13#10;
  for I := 0 to anItem.Count - 1 do
   l_ItemInfo := l_ItemInfo + MenuItemInfo(anItem.Items[I], aLevel + 1);
  Result := l_ItemInfo;
 end;//MenuItemInfo
//#UC END# *5502BE68030B_4F72CAA90045_var*
begin
//#UC START# *5502BE68030B_4F72CAA90045_impl*
 Result := '';
 if not Assigned(aMenu) then
  Exit;
 Result := Trim(MenuItemInfo(aMenu, 0));
 if Length(Result) > 0 then
  Result := Tl3HugeMessageDlgWithWikiHelper.Instance.FormatCloak(aCaption, Result);
//#UC END# *5502BE68030B_4F72CAA90045_impl*
end;//Tl3ComponentInfoHelper.FormatMenuInfo

procedure Tl3ComponentInfoHelper.PopupMenuCallback(aMenu: TMenuItem);
//#UC START# *55141542019C_4F72CAA90045_var*
//#UC END# *55141542019C_4F72CAA90045_var*
begin
//#UC START# *55141542019C_4F72CAA90045_impl*
 f_MenuInfoString := FormatMenuInfo(aMenu, 'Контекстное меню');
//#UC END# *55141542019C_4F72CAA90045_impl*
end;//Tl3ComponentInfoHelper.PopupMenuCallback

function Tl3ComponentInfoHelper.FormatMenuInfoForControl(aControl: TControl): AnsiString;
//#UC START# *551D50260138_4F72CAA90045_var*
var
 l_LoopControl: TControl;
//#UC END# *551D50260138_4F72CAA90045_var*
begin
//#UC START# *551D50260138_4F72CAA90045_impl*
 Result := '';
 l_LoopControl := aControl;
 while Assigned(l_LoopControl) do
 begin
  if l_LoopControl is TCustomForm then
   with TCustomForm(l_LoopControl) do
    if Assigned(Menu) then
     Result := FormatMenuInfo(Menu.Items, 'Главное меню');
  l_LoopControl := l_LoopControl.Parent;
 end;
 f_MenuInfoString := '';
 l_LoopControl := aControl;
 while (Length(f_MenuInfoString) = 0) and Assigned(l_LoopControl) do
 begin
  Tl3PopupMenuHelper.Instance.GetPopupMenuForComponentInfo(l_LoopControl, f_ClickPos, PopupMenuCallback);
  l_LoopControl := l_LoopControl.Parent;
 end;
 if (Length(f_MenuInfoString) <> 0) then
 begin
  if Length(Result) > 0 then
   Result := Result + #13#10;
  Result := Result + f_MenuInfoString
 end;
//#UC END# *551D50260138_4F72CAA90045_impl*
end;//Tl3ComponentInfoHelper.FormatMenuInfoForControl

procedure Tl3ComponentInfoHelper.FormatObjectInfo(anObject: TObject;
  anInfoType: TRTTIInfoType;
  out aResult: AnsiString);

 function DoIt(anItem: TComponent): Boolean;
 //#UC START# *C7EBA2EF89A6__var*
 //#UC END# *C7EBA2EF89A6__var*
 begin
 //#UC START# *C7EBA2EF89A6__impl*
  aResult := aResult + Tl3FormatObjectInfoHelper.Instance.Format(anItem, True, ObjectPropFound) + #13#10;
 //#UC END# *C7EBA2EF89A6__impl*
 end;//DoIt

//#UC START# *551D508901D0_4F72CAA90045_var*
//#UC END# *551D508901D0_4F72CAA90045_var*
begin
 //#UC START# *551D508901D0iter*
 aResult := '';
 case anInfoType of
  itHierarchyOnly:
   begin
    Assert(anObject is TComponent);
 //#UC END# *551D508901D0iter*
  Tl3IterateComponentParents.Instance.IterateF(L2Ml3IterateComponentParentsIterateFAction(@DoIt)
   //#UC START# *551D508901D0iterparam*
   , TComponent(anObject)
   //#UC END# *551D508901D0iterparam*
  )
 //#UC START# *551D508901D0afteriter*
   end;
  itDetailed:
   aResult := Tl3FormatObjectInfoHelper.Instance.Format(anObject, True, ObjectPropFound) +
     #13#10#13#10 +
     L3FormatRTTIInfo(anObject, True, ObjectPropFound, Tl3HugeMessageDlgWithWikiHelper.Instance.CanUseWiki);
 end;
 //#UC END# *551D508901D0afteriter*
end;//Tl3ComponentInfoHelper.FormatObjectInfo

class function Tl3ComponentInfoHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3ComponentInfoHelper <> nil;
end;//Tl3ComponentInfoHelper.Exists

procedure Tl3ComponentInfoHelper.GetMessageListenerNotify(Code: Integer;
  aWParam: WPARAM;
  Msg: PMsg;
  var theResult: Tl3HookProcResult);
//#UC START# *4F62032D0058_4F72CAA90045_var*
var
 l_Component: TComponent;
 l_Control: TControl;
 l_InfoType: TRTTIInfoType;
//#UC END# *4F62032D0058_4F72CAA90045_var*
begin
//#UC START# *4F62032D0058_4F72CAA90045_impl*
 l_Control := nil;
 if ([ssShift, ssAlt, ssCtrl] * KeyboardStateToShiftState = [ssShift, ssAlt, ssCtrl]) then
 begin
  if (Msg.Message = WM_LBUTTONDOWN) or (Msg.Message = WM_RBUTTONDOWN) then
  begin
   GetCursorPos(f_ClickPos);
   Tl3GetComponentFromPointHelper.Instance.GetComponent(f_ClickPos, l_Component, l_Control);

   if not Assigned(l_Component) then
    Exit;

   if Msg.Message = WM_LBUTTONDOWN then
    l_InfoType := itDetailed
   else
    l_InfoType := itHierarchyOnly;

   ShowRTTIMessageForObject(l_Component, l_InfoType, l_Control);

   Msg.Message := 0;
  end//WM_LBUTTONDOWN or WM_RBUTTONDOWN
  else
  if (Msg.Message = WM_KEYDOWN) then
  begin
   if Msg.wParam = Ord('A') then
    l_Control := FindControl(Windows.GetFocus)
   else
   if Msg.wParam = Ord('C') then
    l_Control := GetCaptureControl;
   if Assigned(l_Control) then
   begin
    ShowRTTIMessageForObject(l_Control, itDetailed);
    Msg.Message := 0;
   end;
  end;
 end;
//#UC END# *4F62032D0058_4F72CAA90045_impl*
end;//Tl3ComponentInfoHelper.GetMessageListenerNotify

procedure Tl3ComponentInfoHelper.Cleanup;
//#UC START# *479731C50290_4F72CAA90045_var*
//#UC END# *479731C50290_4F72CAA90045_var*
begin
//#UC START# *479731C50290_4F72CAA90045_impl*
 Tl3ListenersManager.RemoveGetMessageListener(Self);
 inherited;
//#UC END# *479731C50290_4F72CAA90045_impl*
end;//Tl3ComponentInfoHelper.Cleanup

procedure Tl3ComponentInfoHelper.InitFields;
//#UC START# *47A042E100E2_4F72CAA90045_var*
//#UC END# *47A042E100E2_4F72CAA90045_var*
begin
//#UC START# *47A042E100E2_4F72CAA90045_impl*
 inherited;
 Tl3ListenersManager.AddGetMessageListener(Self);
//#UC END# *47A042E100E2_4F72CAA90045_impl*
end;//Tl3ComponentInfoHelper.InitFields

initialization
//#UC START# *4F72D9FF0074*
 Tl3ComponentInfoHelper.Instance;
//#UC END# *4F72D9FF0074*

end.