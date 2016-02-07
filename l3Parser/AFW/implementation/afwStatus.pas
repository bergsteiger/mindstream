unit afwStatus;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  afwInterfaces,
  l3CProtoObject,
  IafwStatusElementPtrList
  ;

type
 TafwStatus = class(Tl3CProtoObject, IafwStatus)
  {* Реализация строки статуса. }
 private
 // private fields
   f_MainForm : Pointer;
   f_Elements : TIafwStatusElementPtrList;
 protected
 // realized methods
   procedure AddElement(const anElement: IafwStatusElement);
   procedure RemoveElement(const anElement: IafwStatusElement);
   procedure Update;
   procedure GetStatus(out theStatus: TafwStatusInfo);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(const aMainForm: IafwMainForm); reintroduce;
   class function Make(const aMainForm: IafwMainForm): IafwStatus; reintroduce;
     {* Создает экземпляр класса, в виде интерфейса IafwStatus. }
 end;//TafwStatus

implementation

uses
  l3String,
  l3Base
  ;

// start class TafwStatus

constructor TafwStatus.Create(const aMainForm: IafwMainForm);
//#UC START# *47878A1D02C4_478787DD01FE_var*
//#UC END# *47878A1D02C4_478787DD01FE_var*
begin
//#UC START# *47878A1D02C4_478787DD01FE_impl*
 inherited Create;
 f_MainForm := Pointer(aMainForm);
//#UC END# *47878A1D02C4_478787DD01FE_impl*
end;//TafwStatus.Create

class function TafwStatus.Make(const aMainForm: IafwMainForm): IafwStatus;
var
 l_Inst : TafwStatus;
begin
 l_Inst := Create(aMainForm);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TafwStatus.AddElement(const anElement: IafwStatusElement);
//#UC START# *473D964C00F9_478787DD01FE_var*
//#UC END# *473D964C00F9_478787DD01FE_var*
begin
//#UC START# *473D964C00F9_478787DD01FE_impl*
 if (f_Elements = nil) then
  f_Elements := TIafwStatusElementPtrList.Create;
 if (f_Elements.IndexOf(anElement) < 0) then
  f_Elements.Add(anElement);
//#UC END# *473D964C00F9_478787DD01FE_impl*
end;//TafwStatus.AddElement

procedure TafwStatus.RemoveElement(const anElement: IafwStatusElement);
//#UC START# *473D96570159_478787DD01FE_var*
//#UC END# *473D96570159_478787DD01FE_var*
begin
//#UC START# *473D96570159_478787DD01FE_impl*
 if (f_Elements <> nil) then
  f_Elements.Remove(anElement);
//#UC END# *473D96570159_478787DD01FE_impl*
end;//TafwStatus.RemoveElement

procedure TafwStatus.Update;
//#UC START# *473D965F03DB_478787DD01FE_var*
var
 l_Status : TafwStatusInfo;
//#UC END# *473D965F03DB_478787DD01FE_var*
begin
//#UC START# *473D965F03DB_478787DD01FE_impl*
 if (f_MainForm <> nil) AND (IafwMainForm(f_MainForm).StatusBar <> nil) then
 begin
  GetStatus(l_Status);
  IafwMainForm(f_MainForm).StatusBar.UpdateStrings(l_Status);
 end;//f_MainForm <> nil.. 
//#UC END# *473D965F03DB_478787DD01FE_impl*
end;//TafwStatus.Update

procedure TafwStatus.GetStatus(out theStatus: TafwStatusInfo);
//#UC START# *473D9669014B_478787DD01FE_var*
var
 l_Caption      : IafwCString;
 l_NeedProgress : Boolean;
 l_Index        : Integer;
 l_Element      : IafwStatusElement;
//#UC END# *473D9669014B_478787DD01FE_var*
begin
//#UC START# *473D9669014B_478787DD01FE_impl*
 theStatus.rNeedProgress := False;
 if (f_Elements <> nil) then
  with f_Elements do
  begin
   l_Index := Lo;
   while (l_Index < Count) do
   begin
    l_Element := Items[l_Index];
(*    try
     l_Element := Items[l_Index];
    except
     f_Elements.Delete(l_Index);
     continue;
    end;//try..except*)
    if (l_Element <> nil) then
     with theStatus do
     begin
      l_Element.GetStatusInfo(l_Caption, l_NeedProgress);
      rNeedProgress := rNeedProgress or l_NeedProgress;
      if not l3IsNil(l_Caption) then
      begin
       SetLength(rStrings, Length(rStrings) + 1);
       rStrings[Length(rStrings) - 1] := l_Caption;
      end;//not l3IsNil(l_Caption)
     end;//with theStatus
    Inc(l_Index);
   end;//while l_Index
  end;//with f_Elements
//#UC END# *473D9669014B_478787DD01FE_impl*
end;//TafwStatus.GetStatus

procedure TafwStatus.Cleanup;
//#UC START# *479731C50290_478787DD01FE_var*
//#UC END# *479731C50290_478787DD01FE_var*
begin
//#UC START# *479731C50290_478787DD01FE_impl*
 l3Free(f_Elements);
 inherited;
//#UC END# *479731C50290_478787DD01FE_impl*
end;//TafwStatus.Cleanup

end.