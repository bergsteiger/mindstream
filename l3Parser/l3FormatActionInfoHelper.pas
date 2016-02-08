unit l3FormatActionInfoHelper;
 
{$Include l3Define.inc}

interface

{$If not defined(NoVCL)}
uses
  ActnList,
  l3ProtoObject
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}
(*
 Ml3FormatActionInfoHelper = PureMixIn
  {* Контракт сервиса Tl3FormatActionInfoHelper }
   function Format(anAction: TCustomAction): AnsiString;
 end;//Ml3FormatActionInfoHelper
*)

type
 Il3FormatActionInfoHelper = interface(IUnknown)
  {* Интерфейс сервиса Tl3FormatActionInfoHelper }
   ['{CBBE7B8C-EED1-4A7B-ADB2-361BE86A2A05}']
  // Ml3FormatActionInfoHelper
   function Format(anAction: TCustomAction): AnsiString;
 end;//Il3FormatActionInfoHelper

 Tl3FormatActionInfoHelper = {final} class(Tl3ProtoObject)
 private
 // private fields
   f_Alien : Il3FormatActionInfoHelper;
    {* Поле для свойства Alien}
 protected
 // property methods
   procedure pm_SetAlien(const aValue: Il3FormatActionInfoHelper);
 public
 // realized methods
   function Format(anAction: TCustomAction): AnsiString;
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
   property Alien: Il3FormatActionInfoHelper
     write pm_SetAlien;
     {* Внешняя реализация сервиса Il3FormatActionInfoHelper }
 public
 // singleton factory method
   class function Instance: Tl3FormatActionInfoHelper;
    {- возвращает экземпляр синглетона. }
 end;//Tl3FormatActionInfoHelper
{$IfEnd} //not NoVCL

implementation

{$If not defined(NoVCL)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoVCL

{$If not defined(NoVCL)}


// start class Tl3FormatActionInfoHelper

var g_Tl3FormatActionInfoHelper : Tl3FormatActionInfoHelper = nil;

procedure Tl3FormatActionInfoHelperFree;
begin
 l3Free(g_Tl3FormatActionInfoHelper);
end;

class function Tl3FormatActionInfoHelper.Instance: Tl3FormatActionInfoHelper;
begin
 if (g_Tl3FormatActionInfoHelper = nil) then
 begin
  l3System.AddExitProc(Tl3FormatActionInfoHelperFree);
  g_Tl3FormatActionInfoHelper := Create;
 end;
 Result := g_Tl3FormatActionInfoHelper;
end;


procedure Tl3FormatActionInfoHelper.pm_SetAlien(const aValue: Il3FormatActionInfoHelper);
 {-}
begin
 Assert((f_Alien = nil) OR (aValue = nil));
 f_Alien := aValue;
end;//Tl3FormatActionInfoHelper.pm_SetAlien

class function Tl3FormatActionInfoHelper.Exists: Boolean;
 {-}
begin
 Result := g_Tl3FormatActionInfoHelper <> nil;
end;//Tl3FormatActionInfoHelper.Exists

function Tl3FormatActionInfoHelper.Format(anAction: TCustomAction): AnsiString;
//#UC START# *781F06EEA149_551442110069_var*
 function FormatName(const aName: AnsiString): AnsiString;
 begin
  if Length(aName) = 0
   then Result := '-'
   else Result := aName;
 end;
var
 S: AnsiString;
//#UC END# *781F06EEA149_551442110069_var*
begin
//#UC START# *781F06EEA149_551442110069_impl*
 Result := FormatName(anAction.Name) + ': ' + anAction.ClassName;
 if Assigned(f_Alien) then
 begin
  S := f_Alien.Format(anAction);
  if Length(S) > 0 then
   Result := Result + ' (' + S + ');';
 end;
//#UC END# *781F06EEA149_551442110069_impl*
end;//Tl3FormatActionInfoHelper.Format

procedure Tl3FormatActionInfoHelper.ClearFields;
 {-}
begin
 {$If not defined(NoVCL)}
 Alien := nil;
 {$IfEnd} //not NoVCL
 inherited;
end;//Tl3FormatActionInfoHelper.ClearFields

{$IfEnd} //not NoVCL

end.