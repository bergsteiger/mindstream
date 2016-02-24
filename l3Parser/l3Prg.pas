unit l3Prg;
{* Индикатор прогресса. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Prg -                     }
{ Начат: 13.10.1999 17:04             }
{ $Id: l3Prg.pas,v 1.46 2014/02/13 10:53:59 lulin Exp $ }

// $Log: l3Prg.pas,v $
// Revision 1.46  2014/02/13 10:53:59  lulin
// - рефакторим безликие списки.
//
// Revision 1.45  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.44  2010/12/08 19:04:29  lulin
// {RequestLink:228688602}.
// - закругляем край у строки ввода.
//
// Revision 1.43  2007/12/05 12:35:11  lulin
// - вычищен условный код, составлявший разницу ветки и Head'а.
//
// Revision 1.42  2007/08/28 14:40:06  lulin
// - убран параметр не нужный в ветке.
//
// Revision 1.41  2007/08/27 17:33:21  lulin
// - не используем плавующую арифметику для получения времени.
//
// Revision 1.40  2007/07/04 09:17:49  narry
// - поддержка масштабирования значения индикатора
//
// Revision 1.39  2007/05/14 06:26:32  narry
// - вычисление f_Div
//
// Revision 1.38  2007/05/11 13:58:02  lulin
// - рыба для масштабирования результата.
//
// Revision 1.37  2007/05/11 12:18:16  lulin
// - боремся с выходом числа за диапазон значений.
//
// Revision 1.36  2007/03/16 14:17:07  lulin
// - bug fix: падали при форматировании строки.
//
// Revision 1.35  2007/02/19 15:20:02  lulin
// - bug fix: не собирался Архивариус.
//
// Revision 1.34  2007/02/12 18:06:19  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.33  2007/02/12 16:40:36  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.32  2006/12/22 12:19:21  oman
// - new: Для статусбара кроме списка строк передаем еще признак о
//  необходимости вывода переливающегося  прогресс-индикатора
//  (cq23938)
//
// Revision 1.31  2005/05/24 10:16:18  lulin
// - cleanup.
//
// Revision 1.30  2005/05/23 15:39:54  lulin
// - убрал надоевшую зависимость между библиотеками.
//
// Revision 1.29  2005/05/23 10:47:12  lulin
// - cleanup.
//
// Revision 1.28  2005/04/28 15:04:11  lulin
// - переложил ветку B_Tag_Box в HEAD.
//
// Revision 1.27.10.1  2005/04/27 15:01:13  lulin
// - new behavior: прореживаем вывод в статусную строку.
//
// Revision 1.27  2005/01/27 14:56:32  lulin
// - bug fix: не всегда после длительной операции очищалась строка статуса.
//
// Revision 1.26  2005/01/24 15:13:47  voba
// - bug fix непарные скобки
//
// Revision 1.25  2005/01/14 16:36:47  lulin
// - восстановил собственную копию статусной строки для кождой основной формы приложения.
//
// Revision 1.24  2005/01/12 12:47:42  lulin
// - перевел модуль afwFacade в глобальных процедур на метакласс.
//
// Revision 1.23  2004/12/22 18:30:56  lulin
// - bug fix: неправильно рисовался прогресс сохранения файла, который был недозагружен целиком.
//
// Revision 1.22  2004/12/22 16:54:38  lulin
// - new behavior: выводим в строку статуса прогресс печати.
//
// Revision 1.21  2004/12/20 17:14:21  lulin
// - new behavior: при помощи _AFW выводим состояние прогресса в строку статуса.
//
// Revision 1.20  2004/12/11 17:29:32  lulin
// - управление Print-preview теперь живет на контейнере.
//
// Revision 1.19  2004/09/16 09:25:15  lulin
// - bug fix: наследники от evCtrl убивались в DesignTime произвольным образом.
//
// Revision 1.18  2004/07/28 14:54:11  law
// - bug fix: падало при закрытии окна во время форматирования.
//
// Revision 1.17  2003/04/15 13:26:49  law
// - new unit: evUnits.
//
// Revision 1.16  2002/04/27 08:37:04  law
// - change: защищен вызов DoProgressProc от исключительных ситуаций.
//
// Revision 1.15  2002/04/27 08:15:14  law
// - optimization: дергаем процедуру индикации только если параметры поменялись.
//
// Revision 1.14  2002/02/21 15:58:15  law
// - optimization.
//
// Revision 1.13  2001/07/26 15:55:03  law
// - comments: xHelpGen.
//
// Revision 1.12  2001/04/10 11:28:09  law
// - bug fix: пытаемся следить за несанкционированным убиванием Meter'а.
//
// Revision 1.11  2000/12/15 15:19:01  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  Windows,
  
  Classes,

  l3Types,
  l3Interfaces,
  l3Base,
  l3InternalInterfaces,
  l3ProtoObject,

  afwInterfaces
  ;

type
  Tl3ProgressIndicator = class(Tl3ProtoObject, Il3Progress, IafwStatusElement)
   {* Индикатор прогресса. }
    private
    // internal fields
      fl_IO : Long;
      fl_Progresses : Long;
    private
    // internal fields
      f_State            : Byte;
      f_Value            : Int64;
      f_Max              : Int64;
      f_Msg              : Il3CString;
      f_NeedProgressProc : Bool;
      f_Status           : IafwStatus;
      f_Fire             : DWord;
      f_Percent          : Long;
      f_Meter            : Pointer;
      f_Div              : Int64;
    private
    // event fields
      f_OnProgressProc    : Tl3ProgressProc;
      f_OnIOProcessChange : TNotifyEvent;
      function pm_GetValueFactor: Integer;
    protected
    // interface methods
      // IafwStatusElement
      procedure GetStatusInfo(out theString: Il3CString; out theNeedProgress: Boolean);
        {-}
    protected
    // property methods
      function  pm_GetMeter: Il3Meter;
      procedure pm_SetMeter(const aValue: Il3Meter);
        {-}
    protected
    // internal methods
      procedure DoProgressProc(aState: Byte; aValue: Int64; const aMsg: Il3CString);
        virtual;
        {* - процедура индикации. Может перекрываться в потомках. }
      procedure SafeProgressProc(aState: Byte; aValue: Int64; const aMsg: Il3CString);
        {* - процедура индикации. Защищена от исключительных ситуаций. }
      procedure DoChangeIO(Start: Bool);
        virtual;
        {* - сигнализировать об изменении флага InIO.  Может перекрываться в потомках. }
      function  CheckInIO: Bool;
        virtual;
        {* - проверить флаг InIO.  Может перекрываться в потомках. }
      procedure IOChanged(Started: Bool);
        virtual;
        {* - изменить флаг InIO.  Может перекрываться в потомках. }
      procedure ThreadProgressProc;
        {* - процедура для вызова _ProgressProc через синхронизацию. }  
      procedure ProgressProc(aState               : Byte;
                             aValue               : Int64;
                             const aMsg           : Il3CString);
        {* - сигнализировать о текущем состоянии процесса. }
      function  Subscribe: Boolean;
        {-}
      procedure Unsubscribe;
        {-}
      procedure ProgressProc_ev(aState     : Byte;
                                aValue     : Longint;
                                const aMsg : AnsiString);
        {-}
      procedure Cleanup;
        override;
        {-}  
    public
    // public methods
      constructor Create;
        reintroduce;
        {-}
      class function Make(aProgressProc : Tl3ProgressProc = nil): Il3Progress;
        reintroduce;
        {-}
      procedure ChangeIO(Start: Bool);
        {* - изменить флаг InIO. }
      procedure Start(Count                : Long;
                      const aMsg           : Il3CString);
        overload;
        {* - начать процесс. }
      procedure Start(Count                : Large;
                      const aMsg           : Il3CString);
        overload;
        {* - начать процесс. }
      procedure Finish;
        {* - закончить процесс. }
      procedure StartEx(Count                : Int64;
                        const aMsg           : Il3CString;
                        IO                   : Bool);
        {* - начать процесс. }
      procedure FinishEx(IO: Bool);
        {* - закончить процесс. }
      procedure Progress(Current: Long);
        overload;
        {* - сигнализировать о текущем состоянии процесса. }
      procedure Progress(Current              : Large);
        overload;
        {* - изменить текущее состояние. }
      procedure ProgressEx(Current              : Long;
                           const aMsg           : Il3CString);
        {* - сигнализировать о текущем состоянии процесса. }
      function  InIO: Bool;
        {* - операция ввода/вывода? }
      function  InUse: Bool;
        {* - используется кем-то другим? }  
    public
    // public properties
      property NeedProgressProc: Bool
        read f_NeedProgressProc
        write f_NeedProgressProc
        default false;
        {* - отрабатывать сигналы о состоянии процесса? }
      property Meter: Il3Meter
        read pm_GetMeter
        write pm_SetMeter;
      property ValueFactor: Integer read pm_GetValueFactor;
        {-}
    public
    // public events
      property OnProgressProc: Tl3ProgressProc
        read f_OnProgressProc
        write f_OnProgressProc;
        {* - процедура индикации. }
      property OnIOProcessChange: TNotifyEvent
        read f_OnIOProcessChange
        write f_OnIOProcessChange;
        {* - событие для отработки изменения флага InIO. }
  end;//Tl3ProgressIndicator

implementation

uses
  SysUtils,
  DateUtils,

  l3Math, l3MinMax,
  l3String,
  
  afwFacade
  ;

// start class Tl3ProgressIndicator 

constructor Tl3ProgressIndicator.Create;
  //reintroduce;
  {-}
begin
 inherited Create;
 if Subscribe then
 begin
  NeedProgressProc := true;
  OnProgressProc := ProgressProc_ev;
 end;//Subscribe
end;

class function Tl3ProgressIndicator.Make(aProgressProc : Tl3ProgressProc = nil): Il3Progress;
  //reintroduce;
  {-}
var
 l_Progress : Tl3ProgressIndicator;
begin
 l_Progress := Create;
 try
  if Assigned(aProgressProc) then
  begin
   l_Progress.OnProgressProc := aProgressProc;
   l_Progress.NeedProgressProc := true;
   l_Progress.UnSubscribe;
  end;//Assigned(aProgressProc)
  Result := l_Progress;
 finally
  l3Free(l_Progress);
 end;//try..finally
end;

procedure Tl3ProgressIndicator.Cleanup;
  //override;
  {-}
begin
 f_Percent := 0;
 f_Fire := 0;
 UnSubscribe;
 f_Status := nil;
 f_Msg := nil;
 inherited;
end;

procedure Tl3ProgressIndicator.ChangeIO(Start: Bool);
  {-}
begin
 if (Self <> nil) then DoChangeIO(Start);
end;

procedure Tl3ProgressIndicator.StartEx(Count                : Int64;
                                       const aMsg           : Il3CString;
                                       IO                   : Bool);
  {-}
begin
 if IO then ChangeIO(true);
 ProgressProc(piStart, Count, aMsg);
end;

procedure Tl3ProgressIndicator.FinishEx(IO: Bool);
  {-}
begin
 ProgressProc(piEnd, 0, nil);
 if IO then ChangeIO(false);
end;

procedure Tl3ProgressIndicator.Start(Count                : Long;
                                     const aMsg           : Il3CString);
  {-}
begin
 StartEx(Count, aMsg, false);
end;

procedure Tl3ProgressIndicator.Start(Count                : Large;
                                     const aMsg           : Il3CString);
  //overload;
  {* - начать процесс. }
begin
 if (Count > High(Long)) then
  Start(Long(Count div High(Long)), aMsg)
 else
  Start(Long(Count), aMsg);
end;
  
procedure Tl3ProgressIndicator.Finish;
  {-}
begin
 FinishEx(false);
end;

procedure Tl3ProgressIndicator.Progress(Current              : Long);
  {-}
begin
 ProgressProc(piCurrent, Current, nil);
end;

procedure Tl3ProgressIndicator.Progress(Current              : Large);
  //overload;
  {* - изменить текущее состояние. }
begin
 if (Current > High(Long)) then
  Progress(Long(Current div High(Long)))
 else
  Progress(Long(Current));
end;

procedure Tl3ProgressIndicator.ProgressEx(Current              : Long;
                                          const aMsg           : Il3CString);
  {-}
begin
 ProgressProc(piCurrent, Current, aMsg);
end;

procedure Tl3ProgressIndicator.SafeProgressProc(aState     : Byte;
                                                aValue     : Int64;
                                                const aMsg : Il3CString);
  {* - процедура индикации. Защищена от исключительных ситуаций. }
begin
 try
  DoProgressProc(aState, aValue, aMsg);
 except
  on E: Exception do
   l3System.Exception2Log(E);
 end;//try..except 
end;

procedure Tl3ProgressIndicator.ThreadProgressProc;
  {-}
begin
 SafeProgressProc(f_State, f_Value, f_Msg);
end;

procedure Tl3ProgressIndicator.ProgressProc(aState               : Byte;
                                            aValue               : Int64;
                                            const aMsg           : Il3CString);
  {-}
var
 V : Bool;
begin
 if (Self <> nil) then begin
  if f_NeedProgressProc then begin
   Case aState of
    piStart :
    begin
     Inc(fl_Progresses);
     V := fl_Progresses = 1;
    end;//piStart
    piEnd   :
    begin
     Dec(fl_Progresses);
     V := fl_Progresses = 0;
     if (fl_Progresses < 0) then
      fl_Progresses := 0;
    end;//piEnd
    else
     V := fl_Progresses = 1;
   end;{Case aState..}
   if V then begin
    if (f_State <> aState) OR (f_Value <> aValue) OR not l3Same(f_Msg, aMsg) then
    begin
     f_State := aState;
     f_Value := aValue;
     if (f_State = piStart) then
      f_Max := f_Value;
     if not l3IsNil(aMsg) OR (f_State <> piCurrent) then
      f_Msg := aMsg;
     SafeProgressProc(aState, aValue, aMsg)
    end;//f_State <> aState..
   end;{V}
  end;{f_NeedProgressProc..}
 end;{Self <> nil}
end;

function Tl3ProgressIndicator.Subscribe: Boolean;
  {-}
begin
 if (afw.Application = nil) OR
    (afw.Application.CurrentMainForm = nil) OR
    (afw.Application.CurrentMainForm.Status = nil) then
  Result := false
 else
 begin
  Result := true;
  f_Status := afw.Application.CurrentMainForm.Status;
  f_Status.AddElement(Self);
 end;//afwGetApplication = nil
end;

procedure Tl3ProgressIndicator.Unsubscribe;
  {-}
begin
 if (f_Status <> nil) then
  f_Status.RemoveElement(Self);
end;
  
procedure Tl3ProgressIndicator.ProgressProc_ev(aState     : Byte;
                                               aValue     : Longint;
                                               const aMsg : AnsiString);
  {-}
var
 l_Now     : DWord;  
 l_Percent : Long;
begin
 if (f_Status <> nil) then
 begin
  l_Now := GetTickCount;
  if (aState = piStart) OR (aState = piEnd) OR
     (l_Now - f_Fire > 300) then
  begin
   if (aState = piCurrent) then
   begin
    if (f_Max <= 0) then
     Exit;
    if (aValue > f_Max) then
     f_Max := aValue * 3;
    l_Percent := l3MulDiv(aValue, 100, f_Max);
    if (l_Percent = f_Percent) then
     Exit;
    f_Percent := l_Percent;
    if (f_Percent <= 0) OR (f_Percent > 100) then
     Exit;
   end;//aState = piCurrent
   f_Fire := l_Now;
   f_Status.Update;
  end//aState = piStart..
 end;//f_Status <> nil
end;
  
function Tl3ProgressIndicator.InIO: Bool;
  {-}
begin
 if (Self <> nil) then Result := CheckInIO else Result := false;
end;

function Tl3ProgressIndicator.InUse: Bool;
  {-}
begin
 Result := (fl_Progresses > 0); 
end;

procedure Tl3ProgressIndicator.GetStatusInfo(out theString: Il3CString; out theNeedProgress: Boolean);
  {-}
begin
 theNeedProgress := False;

 if InUse then
 begin
  if (f_State = piEnd) then
  begin
   f_Percent := 0;
   theString := nil;
  end//f_State = piEnd
  else
  if (f_State = piCurrent) AND (f_Max > 0) then
  begin
   if (f_Percent > 0) AND (f_Percent <= 100) then
   begin
    if l3IsNil(f_Msg) then
     theString := l3Fmt('%d%%', [f_Percent])
    else
     theString := l3Fmt('%s %d%%', [f_Msg, f_Percent]);
   end//l_Percent > 0..
   else
    theString := f_Msg;
  end//f_State = piCurrent
  else
   theString := f_Msg;
 end//InUse
 else
  theString := nil;
end;

function Tl3ProgressIndicator.pm_GetMeter: Il3Meter;
  {-}
begin
 Result := Il3Meter(f_Meter);
end;

procedure Tl3ProgressIndicator.pm_SetMeter(const aValue: Il3Meter);
  {-}
begin
 f_Meter := Pointer(aValue);
end;

procedure Tl3ProgressIndicator.DoProgressProc(aState     : Byte;
                                              aValue     : Int64;
                                              const aMsg : Il3CString);
  {virtual;}
  {-}
begin
 if (aState = piStart) then
 begin
  if (aValue > High(Longint)) then
  begin
   // - здесь надо вычислить f_Div
   f_Div := Max(aValue div High(Longint), 2);
  end//aValue > High(Longint)
  else
   f_Div := 0;
 end;//aState = piStart
 if (f_Div <> 0) then
  aValue := aValue div f_Div;
 if (aValue > High(Longint)) then
  aValue := High(Longint); 
 if (f_Meter <> nil) then
  Il3Meter(f_Meter).ProgressProc(aState, aValue, aMsg);
 if Assigned(f_OnProgressProc) then
  f_OnProgressProc(aState, aValue, l3Str(aMsg));
end;

procedure Tl3ProgressIndicator.DoChangeIO(Start: Bool);
  {override;}
  {-}
var
 OldIO : Bool;
 NewIO : Bool;
begin
 OldIO := InIO;
 if Start then Inc(fl_IO) else Dec(fl_IO);
 NewIO := InIO;
 if (OldIO <> NewIO) then IOChanged(NewIO);
end;

function Tl3ProgressIndicator.CheckInIO: Bool;
  {override;}
  {-}
begin
 Result := (fl_IO > 0);
end;

procedure Tl3ProgressIndicator.IOChanged(Started: Bool);
  {virtual;}
  {-}
begin
 if Assigned(f_OnIOProcessChange) then
  f_OnIOProcessChange(Self);
end;

function Tl3ProgressIndicator.pm_GetValueFactor: Integer;
begin
 Result := Max(1, f_Div);
end;

end.

