unit l3FormatObjectInfoHelper;
 
{$Include ..\L3\l3Define.inc}

interface

{$If not defined(NoVCL)}
uses
  l3ProtoObject,
  l3RTTI
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
(*
 Ml3FormatObjectInfoHelper = PureMixIn
  {* Контракт сервиса Tl3FormatObjectInfoHelper }
   function Format(anObject: TObject;
    aShortInfo: Boolean;
    anObjectPropFound: TRTTIInfoObjectPropertyFoundCallBack): AnsiString;
 end;//Ml3FormatObjectInfoHelper
*)

type
 Il3FormatObjectInfoHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3FormatObjectInfoHelper }
   ['{ABD71A64-8BB2-4F31-9E8A-D6E19C4EB16A}']
  // Ml3FormatObjectInfoHelper
   function Format(anObject: TObject;
    aShortInfo: Boolean;
    anObjectPropFound: TRTTIInfoObjectPropertyFoundCallBack): AnsiString;
 end;//Il3FormatObjectInfoHelper

 Tl3FormatObjectInfoHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3FormatObjectInfoHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3FormatObjectInfoHelper);
 public
 // realized methods
   function Format(anObject: TObject;
     aShortInfo: Boolean;
     anObjectPropFound: TRTTIInfoObjectPropertyFoundCallBack): AnsiString;
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
   property Alien: Il3FormatObjectInfoHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3FormatObjectInfoHelper }
 public
 // singleton factory method
   class function Instance: Tl3FormatObjectInfoHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3FormatObjectInfoHelper
{$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  l3Base {a},
  l3FormatActionInfoHelper,
  Controls,
  ActnList,
  TypInfo,
  l3HugeMessageDlgWithWikiHelper,
  SysUtils
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}


// start class Tl3FormatObjectInfoHelper

var g_Tl3FormatObjectInfoHelper : Tl3FormatObjectInfoHelper = nil;

procedure Tl3FormatObjectInfoHelperFree;
begin
 l3Free(g_Tl3FormatObjectInfoHelper);
end;

class function Tl3FormatObjectInfoHelper.Instance: Tl3FormatObjectInfoHelper;
begin
 if (g_Tl3FormatObjectInfoHelper = nil) then
 begin
  l3System.AddExitProc(Tl3FormatObjectInfoHelperFree);
  g_Tl3FormatObjectInfoHelper := Create;
 end;
 Result := g_Tl3FormatObjectInfoHelper;
end;


procedure Tl3FormatObjectInfoHelper.pm_SetAlien(const aValue: Il3FormatObjectInfoHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3FormatObjectInfoHelper.pm_SetAlien

class function Tl3FormatObjectInfoHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3FormatObjectInfoHelper <> nil;
end;//Tl3FormatObjectInfoHelper.Exists

function Tl3FormatObjectInfoHelper.Format(anObject: TObject;
  aShortInfo: Boolean;
  anObjectPropFound: TRTTIInfoObjectPropertyFoundCallBack): AnsiString;
//#UC START# *D4A861440DBF_551BCBFD0240_var*
 procedure lp_AddInfo(var theInfo: AnsiString;
  const aCaption: AnsiString;
  const aValue: AnsiString;
  aNewLine: Boolean = False);
 begin
  if Length(aValue) > 0 then
  begin
   if Length(theInfo) > 0 then
    if aNewLine
     then theInfo := theInfo + #13#10
     else theInfo := theInfo + ', ';
   theInfo := theInfo + aCaption + ':' + aValue;
  end;
 end;

 function lp_FormatLinkToObject(anObject: TObject): AnsiString;
 begin
  Result := '$' + IntToHex(Integer(anObject), 8);
  if Assigned(anObjectPropFound) then
   anObjectPropFound(anObject, Result)
  else
   Result := Tl3HugeMessageDlgWithWikiHelper.Instance.FormatLink(Result, IntToStr(Integer(anObject)));
 end;
 
var
 l_Control: TControl;
 l_ActionProp: TObject;
//#UC END# *D4A861440DBF_551BCBFD0240_var*
begin
//#UC START# *D4A861440DBF_551BCBFD0240_impl*
 if Assigned(f_Alien) then
  Result := f_Alien.Format(anObject, aShortInfo, anObjectPropFound)
 else
  Result := '';

 if Length(Result) = 0 then
  if aShortInfo then
  begin
   if Assigned(anObject) and (anObject is TControl) then
   begin
    l_Control := TControl(anObject);
    lp_AddInfo(Result, 'name', l_Control.Name);
    lp_AddInfo(Result, 'class', l_Control.ClassName);
    if Assigned(l_Control.Owner) then
     lp_AddInfo(Result, 'Owner', lp_FormatLinkToObject(l_Control.Owner), True);
    if Assigned(l_Control.Parent) then
     lp_AddInfo(Result, 'Parent', lp_FormatLinkToObject(l_Control.Parent), True);
    try
     l_ActionProp := GetObjectProp(l_Control, 'Action', TCustomAction);
    except
     l_ActionProp := nil;
    end;
    if Assigned(l_ActionProp) then
     lp_AddInfo(Result, 'Action', Tl3FormatActionInfoHelper.Instance.Format(TCustomAction(l_ActionProp)), True);
   end;//Assigned(aControl)
  end
  else
   Result := L3FormatRTTIInfo(anObject, True, anObjectPropFound, Tl3HugeMessageDlgWithWikiHelper.Instance.CanUseWiki);
//#UC END# *D4A861440DBF_551BCBFD0240_impl*
end;//Tl3FormatObjectInfoHelper.Format

procedure Tl3FormatObjectInfoHelper.ClearFields;
 {-}
begin
 {$If not defined(NoVCL)}
 Alien := nil;
 {$IfEnd} //not NoVCL
 inherited;
end;//Tl3FormatObjectInfoHelper.ClearFields

{$IfEnd} //not NoVCL

end.