unit l3Forms;
{* Базовый класс форм, поддерживающих счетчик ссылок и интерфейс IUnknown. }

{ Библиотека "Эверест"    }
{ Автор: Люлин А.В. ©     }
{ Модуль: evForms -       }
{ Начат: 02.12.1999 12:23 }
{ $Id: l3Forms.pas,v 1.25 2015/01/15 13:50:25 lulin Exp $ }

// $Log: l3Forms.pas,v $
// Revision 1.25  2015/01/15 13:50:25  lulin
// {RequestLink:585926571}. Используем Interlocked.
//
// Revision 1.24  2014/07/30 12:27:51  lulin
// - чистим код.
//
// Revision 1.23  2014/07/16 15:56:57  lulin
// - чистим код и упрощаем наследование.
//
// Revision 1.22  2012/08/22 11:14:57  dinishev
// Откатываем, т.к. потомком является vtForm, который все это содерит - проще переделать на vtFrom
//
// Revision 1.21  2012/08/22 08:33:07  dinishev
// Подравляем Tl3Form и его наследников для работы с тестами в модальном режиме.
//
// Revision 1.20  2009/01/23 09:48:48  lulin
// - bug fix: не собиралась библиотека.
//
// Revision 1.19  2008/12/12 19:19:30  lulin
// - <K>: 129762414.
//
// Revision 1.18  2008/02/14 19:32:40  lulin
// - изменены имена файлов с примесями.
//
// Revision 1.17  2008/02/14 14:12:25  lulin
// - <K>: 83920106.
//
// Revision 1.16  2008/02/07 08:37:59  lulin
// - каждому базовому объекту по собственному модулю.
//
// Revision 1.15  2008/01/25 12:06:59  lulin
// - синхронизируем имена с моделью.
//
// Revision 1.14  2008/01/25 11:32:14  lulin
// - синхронизируем имена с моделью.
//
// Revision 1.13  2007/11/14 17:29:35  voba
// - bug fix отрисока левых менюайтемов на статусбаре
//
// Revision 1.12  2007/08/13 17:23:34  lulin
// - cleanup.
//
// Revision 1.11  2007/01/18 10:49:42  lulin
// - заменяем объект менеджера памяти на интерфейс.
//
// Revision 1.10  2006/12/10 19:03:40  lulin
// - cleanup.
//
// Revision 1.9  2006/12/10 18:59:06  lulin
// - класс формы переименован в соответствии с библиотекой.
//
// Revision 1.8  2006/12/10 18:53:33  lulin
// - используем более общую реализацию канвы для вывода элементов меню.
//
// Revision 1.7  2006/12/10 18:27:07  lulin
// - оптимизация недоделок Борланда: не распределяем каждый раз канву для рисования пункта меню.
//
// Revision 1.6  2006/12/08 14:21:08  lulin
// - очищаем кешированные компоненты так, как будто они заново родились.
//
// Revision 1.5  2006/04/14 13:40:33  lulin
// - запрещаем перекрывать деструктор.
//
// Revision 1.4  2006/04/14 12:11:25  lulin
// - файлу с шаблоном дано более правильное название.
//
// Revision 1.3  2006/04/14 11:53:13  lulin
// - объединил интерфейс и реализацию _Unknown_ в один файл.
//
// Revision 1.2  2005/10/06 13:49:43  lulin
// - cleanup.
//
// Revision 1.1  2005/07/22 13:03:03  lulin
// - модуль с базовыми формами переехал в библиотеку L3.
//
// Revision 1.19  2004/09/16 11:30:50  lulin
// - навел подобие порядка с регистрацией компонент библиотеки.
//
// Revision 1.18  2004/09/16 09:24:59  lulin
// - bug fix: наследники от evCtrl убивались в DesignTime произвольным образом.
//
// Revision 1.17  2004/09/15 16:20:37  lulin
// - bug fix: AllEverestComponents7 не собирался из-за Str_Man'а.
// - bug fix: AllEverestComponents7 не загружался из-за шаблонов.
//
// Revision 1.16  2004/09/15 14:49:02  lulin
// - Tl3Form переведен на "шаблон" l3Unknown.
//
// Revision 1.15  2004/09/13 07:32:58  lulin
// - new behavior: _Tl3InterfacedComponent теперь может распределять свою память в пуле объектов.
//
// Revision 1.14  2004/09/08 11:22:31  lulin
// - new define: _l3NoTrace.
// - new define: l3TraceObjects.
//
// Revision 1.13  2004/07/21 13:53:39  am
// change: Create -> CreateNew (для возможности создания форм без ресурсов)
//
// Revision 1.12  2004/06/25 16:47:21  migel
// - change/fix: для совместимости с win9x перешли на собственную реализацию `Interlocked*` функций.
//
// Revision 1.11  2004/06/03 16:54:42  law
// - new method: Il3Base.CheckStamp.
//
// Revision 1.10  2004/04/15 11:34:34  law
// - bug fix: Inc/Dec заменены на InterlockedIncrement/InterlockedDecrement.
//
// Revision 1.9  2004/04/09 11:50:46  law
// - new behavior: прикручен контроль за Tl3Form.
//
// Revision 1.8  2003/11/30 11:39:38  law
// - new behavior: автогенерируем типы пользовательских объектов.
//
// Revision 1.7  2003/02/26 18:11:06  law
// - new method: AfterFree.
//
// Revision 1.6  2001/10/02 12:23:21  law
// - new method: BeforeRelease.
//
// Revision 1.5  2001/09/04 16:47:26  law
// - comments: xHelpGen.
//
// Revision 1.4  2000/12/15 15:10:35  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  {$IfNDef DesignTimeLibrary}
  Messages,
  {$EndIf  DesignTimeLibrary}
  Windows,

  {$IfNDef DesignTimeLibrary}
  Graphics,
  {$EndIf  DesignTimeLibrary}

  Classes,
  Forms,
  
  l3Types,
  l3Const,
  l3Base,
  l3IID
  ;

type
  _l3Unknown_Parent_ = TForm;
  {$Define _UnknownIsComponent}
  {$Include l3Unknown.imp.pas}
  Tl3Form = class(_l3Unknown_)
   {* Базовый класс форм, поддерживающих счетчик ссылок и интерфейс IUnknown. }
    private
    // internal fields
      {$IfNDef DesignTimeLibrary}
      f_Canvas : TCanvas;
      {$EndIf  DesignTimeLibrary}
    protected
    // internal methods
      // Il3Base
      {$IfDef DesignTimeLibrary}
      function CheckStamp(const aGUID: TGUID): Boolean;
        {-}
      {$EndIf DesignTimeLibrary}
      {$IfNDef DesignTimeLibrary}
      procedure WndProc(var Message: TMessage);
        override;
        {-}
      {$EndIf  DesignTimeLibrary}
      {$Include l3DefineCleanup.inc}
    public
    // public methods
    function  QueryInterface(const IID: TGUID; out Obj): HResult;
      override;
      {* - реализация метода QueryInterface интерфейса IUnknown. }
    function  COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
      virtual;
      {* - метод для реализации QueryInterface (Для перекрытия в потомках). }
  end;//Tl3Form

implementation

uses
  SysUtils,

  {$IfNDef DesignTimeLibrary}
  Menus,
  {$EndIf  DesignTimeLibrary}

  l3Interfaces,
  l3Interlocked
  ;

{$Include l3Unknown.imp.pas}

// start class Tl3Form

type
 _Unknown_Child_ = Tl3Form;
{$Include l3ImplCleanup.inc}
begin
 {$IfNDef DesignTimeLibrary}
 l3Free(f_Canvas);
 {$EndIf  DesignTimeLibrary}
 inherited;
end;

function Tl3Form.QueryInterface(const IID: TGUID; out Obj): HResult;
  {override;}
  {-}
var
 l_Res : Tl3HResult;  
begin
 l_Res := COMQueryInterface(Tl3GUID_C(IID), Obj);
 if l_Res.Fail then
  Result := inherited QueryInterface(IID, Obj)
 else
  Result := l_Res.Res; 
end;

function Tl3Form.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  {virtual;}
  {-}
begin
 if TObject(Self).GetInterface(IID.IID, Obj) then
  Result.SetOk
 else
 begin
  Pointer(Obj) := nil;
  Result.SetNOINTERFACE;
 end;//TObject(Self).GetInterface(IID.IID, Obj)
end;

{$IfDef DesignTimeLibrary}
function Tl3Form.CheckStamp(const aGUID: TGUID): Boolean;
  {-}
begin
 if l3SystemDown then
  Result := false
 else
  Result := IsEqualGUID(l3System.GetStamp, aGUID);
end;
{$EndIf DesignTimeLibrary}

{$IfNDef DesignTimeLibrary}
type
  TMenuItemAccess = class(TMenuItem);

procedure Tl3Form.WndProc(var Message: TMessage);
  //override;
  {-}
var
  SaveIndex : Integer;
  MenuItem  : TMenuItem;
  DC        : HDC;
begin
  with Message do
    case Msg of
      WM_DRAWITEM:
       if (Message.wParam = 0) then {V - WM_DRAWITEM посылает не только Menu, Message.wParam = 0 это точно Меню}
        with PDrawItemStruct(Message.LParam)^ do
          if (CtlType = ODT_MENU) and Assigned(Menu) then
          begin
            MenuItem := Menu.FindItem(itemID, fkCommand);
            if (MenuItem <> nil) then
            begin
              if (f_Canvas = nil) then
               f_Canvas := TCanvas.Create;
              with f_Canvas do
              try
                SaveIndex := SaveDC(hDC);
                try
                  Handle := hDC;
                  Font := Screen.MenuFont;
                  Menus.DrawMenuItem(MenuItem, f_Canvas, rcItem,
                    TOwnerDrawState(LongRec(itemState).Lo));
                finally
                  Handle := 0;
                  RestoreDC(hDC, SaveIndex)
                end;
              finally
                //Free;
              end;//try..finally
              Exit;
            end;//MenuItem <> nil
          end;//CtlType = ODT_MENU..
      WM_MEASUREITEM:
       if (Message.wParam = 0) then {V - WM_DRAWITEM посылает не только Menu, Message.wParam = 0 это точно Меню}
        with PMeasureItemStruct(Message.LParam)^ do
          if (CtlType = ODT_MENU) and Assigned(Menu) then
          begin
            MenuItem := Menu.FindItem(itemID, fkCommand);
            if (MenuItem <> nil) then
            begin
              DC := GetWindowDC(Handle);
              try
                if (f_Canvas = nil) then
                 f_Canvas := TCanvas.Create;
                with f_Canvas do
                try
                  SaveIndex := SaveDC(DC);
                  try
                    Handle := DC;
                    Font := Screen.MenuFont;
                    TMenuItemAccess(MenuItem).MeasureItem(f_Canvas,
                      Integer(itemWidth), Integer(itemHeight));
                  finally
                    Handle := 0;
                    RestoreDC(DC, SaveIndex);
                  end;
                finally
                  //f_Canvas.Free;
                end;//try..finally
              finally
                ReleaseDC(Handle, DC);
              end;//try..finally
              Exit;
            end;//MenuItem <> nil
          end;//CtlType = ODT_MENU..
    end;//case Msg of
 inherited;
end;
{$EndIf  DesignTimeLibrary}

end.

