unit l3ProtoProgressComponent;
{* Базовый класс компонентов, имеющих индикатор прогресса. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3ProgressComponent -       }
{ Начат: 18.05.2000 14:36             }
{ $Id: l3ProtoProgressComponent.pas,v 1.1 2011/09/19 10:12:47 lulin Exp $ }

// $Log: l3ProtoProgressComponent.pas,v $
// Revision 1.1  2011/09/19 10:12:47  lulin
// - делаем Filer'ам возможность быть не компонентами и кешируемыми.
//
// Revision 1.21  2008/02/28 15:12:11  lulin
// - переносим nevTools на модель.
//
// Revision 1.20  2006/12/18 09:40:27  lulin
// - cleanup.
//
// Revision 1.19  2005/07/14 10:24:32  lulin
// - реализация интерфейса IevSubList спущена с TextSource, на DocumentContainer.
//
// Revision 1.18  2005/05/23 15:39:54  lulin
// - убрал надоевшую зависимость между библиотеками.
//
// Revision 1.17  2005/05/23 10:47:13  lulin
// - cleanup.
//
// Revision 1.16  2004/12/21 11:03:16  lulin
// - bug fix: не собиралось для Run-time.
//
// Revision 1.15  2004/09/21 10:30:18  lulin
// - Release заменил на Cleanup.
//
// Revision 1.14  2004/09/15 16:20:56  lulin
// - bug fix: AllEverestComponents7 не собирался из-за Str_Man'а.
// - bug fix: AllEverestComponents7 не загружался из-за шаблонов.
//
// Revision 1.13  2004/09/01 15:15:28  voba
// - bug fix несовместимость с консольным режимом
//
// Revision 1.12  2003/04/15 13:26:49  law
// - new unit: evUnits.
//
// Revision 1.11  2001/12/28 14:57:19  law
// - change: типы переименованы в соответствии с названием библиотеки.
//
// Revision 1.10  2001/10/12 17:52:01  law
// - new behavior: работа с буфером обмена через _OleSetClipboard.
//
// Revision 1.9  2001/10/03 06:11:59  law
// - bug fix: AV при освобождении индикатора прогрессса.
//
// Revision 1.8  2001/08/29 07:01:10  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//
// Revision 1.7  2001/04/18 13:25:24  law
// - comments: добавлены комментарии для xHelpGen.
//
// Revision 1.6  2001/04/11 14:48:21  voba
// - bug fix: иногда возникал AV при освобождении Meter'а.
//
// Revision 1.5  2001/04/10 11:28:09  law
// - bug fix: пытаемся следить за несанкционированным убиванием Meter'а.
//
// Revision 1.4  2001/04/09 14:01:34  voba
// - bug fix: добавлен вызов inherited метода в перекрытый метод Notification.
//
// Revision 1.3  2000/12/15 15:19:01  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  Classes,

  l3Interfaces,
  l3Types,
  l3Base,
  l3ProtoObject,
  l3ProtoObjectWithCOMQI,
  l3InternalInterfaces,
  l3Prg
  ;

type
  Tl3ProtoProgressComponent = class(Tl3ProtoObjectWithCOMQI, Il3Progress)
   {* Базовый класс компонентов, имеющих индикатор прогресса. }
    private
    // property fields
      f_Indicator     : Tl3ProgressIndicator;
    protected
    // property methods
      function  pm_GetIndicator: Tl3ProgressIndicator;
      procedure pm_SetIndicator(Value: Tl3ProgressIndicator);
        {-}
      function  pm_GetHasIndicator: Bool;
        {-}
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
    public
    // public properties
      property Indicator: Tl3ProgressIndicator
        read pm_GetIndicator
        write pm_SetIndicator
        implements Il3Progress;
        {* - индикатор прогресса. }
      property HasIndicator: Bool
        read pm_GetHasIndicator;
        {* - есть ли индикатор? }
  end;//Tl3ProtoProgressComponent

implementation

uses
  l3InterfacesMisc,
  l3ProgressComponent
  ;

// start class Tl3ProtoProgressComponent 

procedure Tl3ProtoProgressComponent.Cleanup;
  {override;}
  {-}
begin
 Indicator := nil;
 inherited;
end;

function Tl3ProtoProgressComponent.pm_GetIndicator: Tl3ProgressIndicator;
  {-}
var
 l_Indicator : Tl3ProgressIndicator;
begin
 if (f_Indicator = nil) then
 begin
  l_Indicator := TevProgressIndicator.Create;
  try
   Indicator := l_Indicator;
  finally
   l3Free(l_Indicator);
  end;//try..finally
 end;//f_Indicator = nil
 Result := f_Indicator;
end;

procedure Tl3ProtoProgressComponent.pm_SetIndicator(Value: Tl3ProgressIndicator);
  {-}
begin
 Value.SetRefTo(f_Indicator);
end;

function Tl3ProtoProgressComponent.pm_GetHasIndicator: Bool;
  {-}
begin
 Result := (f_Indicator <> nil);
end;

end.

