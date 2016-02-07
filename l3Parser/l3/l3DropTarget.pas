unit l3DropTarget;

{ Библиотека "Эверест"    }
{ Автор: Люлин А.В. ©     }
{ Модуль: l3DropTarget -  }
{ Начат: 04.04.2001 20:34 }
{ $Id: l3DropTarget.pas,v 1.19 2013/12/25 15:10:36 lulin Exp $ }

// $Log: l3DropTarget.pas,v $
// Revision 1.19  2013/12/25 15:10:36  lulin
// {RequestLink:509706011}
// - перетрясаем модель.
//
// Revision 1.18  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.17  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.16  2008/02/11 13:51:53  mmorozov
// - new behaviour: при определение действия при перетаскивании учитываем действия от источника (CQ: OIT5-28331);
//
// Revision 1.15  2006/12/19 12:24:27  lulin
// - избавляемся от запоминания объкта данных на контроле.
//
// Revision 1.14  2006/12/18 09:40:27  lulin
// - cleanup.
//
// Revision 1.13  2006/12/14 13:28:04  lulin
// - cleanup.
//
// Revision 1.12  2006/12/14 13:16:05  lulin
// - убран ненужный метод.
//
// Revision 1.11  2006/12/14 13:08:23  lulin
// - по-честному получаем ноду из объекта данных.
//
// Revision 1.10  2006/12/13 16:51:49  lulin
// - cleanup.
//
// Revision 1.9  2006/12/13 16:28:49  lulin
// - cleanup.
//
// Revision 1.8  2006/12/13 16:03:43  lulin
// - cleanup.
//
// Revision 1.7  2006/12/13 09:07:58  lulin
// - cleanup.
//
// Revision 1.6  2006/12/13 08:02:46  lulin
// - вычишен ненужный на интерфейсе метод.
//
// Revision 1.5  2006/01/27 11:00:52  lulin
// - bug fix: при выравнивании куска пямяти не читался EVD, т.к. в конце был мусор (CQ OIT5-19345).
//
// Revision 1.4  2005/12/19 12:03:08  lulin
// - new behavior: вставляем ссылки в комментариях из родного формата, а не путем обработки сообщения.
//
// Revision 1.3  2005/08/30 13:08:41  lulin
// - new behavior: при DnD редактор возвращает правильное действие (copy).
//
// Revision 1.2  2005/08/30 12:50:21  lulin
// - добавлена функция Make.
//
// Revision 1.1  2005/05/27 12:24:41  lulin
// - системные модули, не имеющие отношения к Эвересту переехали в L3.
//
// Revision 1.12.8.1  2005/05/27 12:05:56  lulin
// - убраны лишние зависимости.
//
// Revision 1.12  2005/02/14 12:26:48  lulin
// - добавлены теги для аннотаций.
//
// Revision 1.11  2005/02/14 11:03:56  lulin
// - bug fix: если текст не копировался при DnD, то он пропадал в исходном месте (например в папках) (CQ OIT5-12266).
//
// Revision 1.10  2005/02/04 14:33:43  lulin
// - new behavior: закладкам пользователя ставим флаг 3.
// - из Drag'n'drop возвращаем Effect.
//
// Revision 1.9  2004/12/27 14:03:15  demon
// - fix: в случае непрохождения операции Drop неверно возвращался результат и все равно вызывалось AfterDrag.
//
// Revision 1.8  2004/12/17 14:27:29  demon
// - new behavior: метод _DoDrop получил новый параметр var dwEffect: Longint, теперь его может поменять приемник (TargetObject)
//
// Revision 1.7  2004/10/27 10:03:35  dinishev
// - реализована возможность пользовательского обработчика события _DoDrop.
//
// Revision 1.6  2004/09/21 12:55:40  lulin
// - Release заменил на Cleanup.
//
// Revision 1.5  2004/02/13 07:55:08  nikitin75
// + слил с веткой B_AFTER_DND; внешне (пока) ничего не должно измениться: DnD пока не активизируется;
//
// Revision 1.4.22.8  2003/09/26 14:36:07  nikitin75
// + DnD правой кнопкой: передаем флаг aWantMenu : Bool = true;
//
// Revision 1.4.22.7  2003/09/18 12:29:21  nikitin75
// + DnD fix: освобождали ноду назначения до ее использования;
//
// Revision 1.4.22.6  2003/09/17 14:56:24  nikitin75
// продолжаем запрашивать _CanAcceptData даже если в момент входа в DropTarget получили false;
//
// Revision 1.4.22.5  2003/09/09 14:49:18  nikitin75
// syntax fix: DoDragLive -> _DoDragLeave;
//
// Revision 1.4.22.4  2003/09/09 14:25:44  nikitin75
// поддержка вызовов IevSHDropTarget._DoDragEnter и IevSHDropTarget.DoDragLive;
//
// Revision 1.4.22.3  2003/09/05 09:37:31  nikitin75
// коррекно устанавливаем DROPEFFECT;
//
// Revision 1.4.22.2  2003/09/05 08:49:13  nikitin75
// temporary: TevDropTarget.Keys2Effect always return DROPEFFECT_COPY;
//
// Revision 1.4.22.1  2003/09/04 13:59:56  nikitin75
// + расширения IevSHDropTarget для перетаскивания интерфейса (интерфейсов);
//
// Revision 1.4  2001/10/12 17:51:59  law
// - new behavior: работа с буфером обмена через _OleSetClipboard.
//
// Revision 1.3  2001/04/05 17:03:40  law
// - new behavior: в первом приближении сделан Drop данных в окно редактора.
//
// Revision 1.2  2001/04/05 08:21:45  law
// - new behavior: поддрежка Drag'n'Drop переехала в evCtrl.
//
// Revision 1.1  2001/04/04 17:03:05  law
// - new behavior: начата работа над поддержкой окном редактора интерфейса IDropTarget.
//

{$Include evDefine.inc }

interface

uses
  l3Interfaces,
  l3Const,
  l3Types,
  l3Base,
  l3ProtoObject
  ;

type
  Tl3DropTarget = class(Tl3ProtoObject, IDropTarget)
    private
    //property fields
      f_DropTarget        : Pointer;
      f_AcceptableFormats : Tl3ClipboardFormats;
      f_DragEnterAccepted : Bool;
      f_DropData          : IDataObject;
    protected
    //property methods
      function pm_GetDropTarget: Il3DropTarget;
        {-}
    protected
    //interface methods
      // IDropTarget
      function DragEnter(const aDataObj : IDataObject;
                         grfKeyState    : Longint;
                         pt             : TPoint;
                         var dwEffect   : Longint): HResult;
        stdcall;
        {-}
      function DragOver(grfKeyState  : Longint;
                        pt           : TPoint;
                        var dwEffect : Longint): HResult;
        stdcall;
        {-}
      function DragLeave: HResult;
        stdcall;
        {-}
      function Drop(const aDataObj : IDataObject;
                    grfKeyState    : Longint;
                    pt             : TPoint;
                    var dwEffect   : Longint): HResult;
        stdcall;
        {-}
    protected
    //internal methods
      procedure Cleanup;
        override;
        {-}
      function  AcceptableTymed: Longint;
        {-}
      function  Keys2Effect(aKeys: Long): Long;
        {-}
    public
    //public methods
      constructor Create(const aDropTarget: Il3DropTarget);
        reintroduce;
        {-}
      class function Make(const aDropTarget: Il3DropTarget): IDropTarget;
        reintroduce;
        {-}
      function DropFormattedData(aFormat        : Tl3ClipboardFormat;
                                 const aDataObj : IDataObject;
                                 var dwEffect   : Longint): Bool;
        {-}
    public
    //public properties
      property DropTarget: Il3DropTarget
        read pm_GetDropTarget;
        {-}
  end;//Tl3DropTarget

implementation

uses
  l3SysUtils
  ;

// start class Tl3DropTarget

constructor Tl3DropTarget.Create(const aDropTarget: Il3DropTarget);
  //reintroduce;
  {-}
begin
 inherited Create;
 f_DropTarget := Pointer(aDropTarget);
end;

class function Tl3DropTarget.Make(const aDropTarget: Il3DropTarget): IDropTarget;
  //reintroduce;
  {-}
var
 l_Target : Tl3DropTarget;  
begin
 l_Target := Create(aDropTarget);
 try
  Result := l_Target;
 finally
  l3Free(l_Target);
 end;//try..finally
end;

procedure Tl3DropTarget.Cleanup;
  //override;
  {-}
begin
 f_AcceptableFormats := nil;
 f_DropData := nil;
 inherited;
end;

function Tl3DropTarget.AcceptableTymed: Longint;
  {-}
begin
 Result := TYMED_HGLOBAL or TYMED_ISTREAM or TYMED_GDI;
end;
  
function Tl3DropTarget.pm_GetDropTarget: Il3DropTarget;
  {-}
begin
 Result := Il3DropTarget(f_DropTarget);
end;

function Tl3DropTarget.Keys2Effect(aKeys: Long): Long;
  {-}
begin
 Result := DropTarget.Keys2Effect(aKeys);
end;

function Tl3DropTarget.DragEnter(const aDataObj : IDataObject;
                                 grfKeyState    : Longint;
                                 pt             : TPoint;
                                 var dwEffect   : Longint): HResult;
  //stdcall;
  {-}
var
 i           : Long;
 l_FormatEtc : TFormatEtc;
 l_Point     : TPoint;
begin
 Result := S_Ok;
 f_DragEnterAccepted := false;
 f_DropData := aDataObj;
 if (aDataObj <> nil) then
 begin
  f_AcceptableFormats:= DropTarget.GetAcceptableFormats;
  // - получаем список приемлимых форматов
  if (Length(f_AcceptableFormats) > 0) then
  begin
   with l_FormatEtc do begin
    ptd := nil;
    dwAspect := DVASPECT_CONTENT; // - нужно содержимое
    lIndex := -1;
    tymed := AcceptableTymed;
   end;//with l_FormatEtc
   for i := Low(f_AcceptableFormats) to High(f_AcceptableFormats) do
   begin
    l_FormatEtc.cfFormat := f_AcceptableFormats[i];
    if (aDataObj.QueryGetData(l_FormatEtc) = S_Ok) then
    begin
     // - нашли приемлимый возможно доступный формат
     f_DragEnterAccepted := true;
     dwEffect := Keys2Effect(grfKeyState);
     break;
    end;//aDataObj.QueryGetData
   end;//for i
  end//Length(f_AcceptableFormats) > 0
  else
   dwEffect := DROPEFFECT_NONE;
 end//aDataObj <> nil
 else
  dwEffect := DROPEFFECT_NONE;
 l3GetCursorPos(l_Point);
 DropTarget.DoDragEnter(aDataObj, l_Point);
end;

function Tl3DropTarget.DragOver(grfKeyState  : Longint;
                                pt           : TPoint;
                                var dwEffect : Longint): HResult;
  //stdcall;
  {-}
begin
 Result := S_Ok;
 f_DragEnterAccepted := DropTarget.DoDragOver(f_DropData, pt);
 if f_DragEnterAccepted then
  if Keys2Effect(grfKeyState) and dwEffect = DROPEFFECT_NONE then
  begin
   if (dwEffect and DROPEFFECT_MOVE) = DROPEFFECT_MOVE then
    dwEffect := DROPEFFECT_MOVE
   else
    if (dwEffect and DROPEFFECT_COPY) = DROPEFFECT_COPY then
     dwEffect := DROPEFFECT_COPY;
  end
  else
   dwEffect := Keys2Effect(grfKeyState)
 else
  dwEffect := DROPEFFECT_NONE;
end;

function Tl3DropTarget.DragLeave: HResult;
  //stdcall;
  {-}
begin
 DropTarget.DoDragLeave;
 f_DropData := nil;
 Result := S_Ok;
end;

function Tl3DropTarget.DropFormattedData(aFormat        : Tl3ClipboardFormat;
                                         const aDataObj : IDataObject;
                                         var dwEffect   : Longint): Bool;
  {-}
var
 l_FormatEtc  : TFormatEtc;
 l_Medium     : Tl3StoragePlace;
 l_DropTarget : Il3DropTarget;
begin
 f_DropData := nil;
 if (aDataObj <> nil) then
 begin
  l_DropTarget := DropTarget;
  try
   with l_FormatEtc do
   begin
    ptd := nil;
    dwAspect := DVASPECT_CONTENT; // - нужно содержимое
    lIndex := -1;
    tymed := AcceptableTymed;
    cfFormat := aFormat;
   end;//with l_FormatEtc
   if (aDataObj.GetData(l_FormatEtc, l_Medium) = S_Ok) then
    // - получили приемлимый доступный формат
    try
     Result := l_DropTarget.DoDrop(l_FormatEtc.cfFormat, l_Medium, dwEffect);
    finally
     if (l_Medium.unkForRelease = nil) then
      l3ReleaseStgMedium(l_Medium);
    end//try..finally
   else
    Result := false;
  finally
   l_DropTarget := nil;
  end;//try..finally
 end//aDataObj <> nil
 else
  Result := false;
end;

function Tl3DropTarget.Drop(const aDataObj : IDataObject;
                            grfKeyState    : Longint;
                            pt             : TPoint;
                            var dwEffect   : Longint): HResult;
  //stdcall;
  {-}
var
 l_Index : Long;
begin
 Result := S_Ok;
 if f_DragEnterAccepted then
 begin
  if (aDataObj <> nil) then
  begin
   Result := E_UNEXPECTED;
   for l_Index := Low(f_AcceptableFormats) to High(f_AcceptableFormats) do
   begin
    if (dwEffect = DROPEFFECT_NONE) then
     dwEffect := Keys2Effect(grfKeyState);
    if DropFormattedData(f_AcceptableFormats[l_Index], aDataObj, dwEffect) then
    begin
     Result := S_Ok;
     break;
    end;//DropFormattedData
   end;//for l_Index
  end;//aDataObj <> nil
  DropTarget.DoDragLeave;
 end//f_DragEnterAccepted
 else
  dwEffect := DROPEFFECT_NONE;
end;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3DropTarget.pas initialization enter'); {$EndIf}
 l3OleInitialize;
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3DropTarget.pas initialization leave'); {$EndIf}
finalization
 l3OleUninitialize;

end.

