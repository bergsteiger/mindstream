unit l3DataCache;

{ Ѕиблиотека "L3 (Low Level Library)" }
{ јвтор: Ћюлин ј.¬. ©                 }
{ ћодуль: l3DataCache -               }
{ Ќачат: 25.10.2004 16:13             }
{ $Id: l3DataCache.pas,v 1.12 2015/06/03 12:29:28 lulin Exp $ }

// $Log: l3DataCache.pas,v $
// Revision 1.12  2015/06/03 12:29:28  lulin
// - пытаемс€ разрулить зависимости.
//
// Revision 1.11  2012/11/01 09:42:57  lulin
// - забыл точку с зап€той.
//
// Revision 1.10  2012/11/01 07:45:08  lulin
// - делаем возможность логировани€ процесса загрузки модулей.
//
// Revision 1.9  2010/05/07 17:03:48  lulin
// {RequestLink:210437198}.
// - добавлен тест.
//
// Revision 1.8  2008/03/20 09:48:40  lulin
// - cleanup.
//
// Revision 1.7  2008/02/14 17:09:15  lulin
// - cleanup.
//
// Revision 1.6  2008/02/07 14:44:45  lulin
// - класс _Tl3LongintList переехал в собственный модуль.
//
// Revision 1.5  2007/09/07 14:47:44  lulin
// - добавлено удаление последнего элемента списка.
//
// Revision 1.4  2007/08/30 10:09:23  lulin
// - убираем ненужную функцию поиска.
//
// Revision 1.3  2005/07/21 16:54:28  lulin
// - контейнер документов теперь знает про процессор параграфов.
//
// Revision 1.2  2005/07/21 08:58:47  lulin
// - кеш документов практически полность переведен на интерфейсы.
//
// Revision 1.1  2005/05/30 12:06:02  lulin
// - кеш данных переехал в библиотеку L3.
//
// Revision 1.9.2.1  2005/05/18 12:42:46  lulin
// - отвел новую ветку.
//
// Revision 1.7.4.3  2005/05/18 12:32:08  lulin
// - очередной раз объединил ветку с HEAD.
//
// Revision 1.7.4.2  2005/04/28 09:18:28  lulin
// - объединил с веткой B_Tag_Box.
//
// Revision 1.7.4.1  2005/04/19 11:56:41  lulin
// - заточки дл€ тестировани€.
//
// Revision 1.8  2005/04/19 10:19:35  lulin
// - дл€ тестовых приложений под Define _nsTest добавлены "правильные" директивы компил€ции.
//
// Revision 1.9  2005/05/17 14:03:59  lulin
// - new define: _nsTool.
//
// Revision 1.8  2005/04/19 10:19:35  lulin
// - дл€ тестовых приложений под Define _nsTest добавлены "правильные" директивы компил€ции.
//
// Revision 1.7  2004/11/03 09:34:41  lulin
// - new behavior: загрузка форматировани€ из кеша учитывает теперь контекст форматировани€.
//
// Revision 1.6  2004/11/01 18:29:41  lulin
// - new behavior: при возможности не форматируем документ, а читаем форматирование из пула сохраненных.
//
// Revision 1.5  2004/10/25 14:21:38  lulin
// - лишние переменные убраны под define.
//
// Revision 1.4  2004/10/25 14:17:34  lulin
// - new behavior: TevDataCache теперь ведет список освобожденных.
//
// Revision 1.3  2004/10/25 13:52:51  lulin
// - теперь работаем и без define evUseStorageForDataCache.
//
// Revision 1.2  2004/10/25 13:46:44  lulin
// - new class: TevDataCache.
//

{$Include l3Define.inc }

{.$IfNDef nsTest}
 {$IfNDef nsTool}
  {$Define l3UseStorageForDataCache}
 {$EndIf  nsTool}
{.$EndIf  nsTest}

interface

uses
  Classes,

  l3Interfaces,
  l3Types,
  l3Base,
  l3CacheableBase

  {$IfNDef l3UseStorageForDataCache}
  ,
  l3Stream
  {$EndIf  l3UseStorageForDataCache}

  {$IfDef l3UseStorageForDataCache}
  ,
  m3StorageInterfaces
  {$EndIf l3UseStorageForDataCache}
  ;

type
  TevDataCache = class
    private
    // internal methods
      {$IfDef l3UseStorageForDataCache}
      class function GetRoot: Im3IndexedStorage;
        {-}
      {$EndIf l3UseStorageForDataCache}
    public
    // public methods
      class function CreateTempStream: Il3TempStream;
        {-}
  end;//TevDataCache

  TevTempStream = class(Tl3CacheableBase, Il3TempStream)
    private
    // internal fields
      {$IfDef l3UseStorageForDataCache}
      f_ID     : Integer;
      {$Else  l3UseStorageForDataCache}
      f_Stream : Tl3TempFileStream;
      {$EndIf l3UseStorageForDataCache}
    protected
    // interface methods
      // Il3TempStream
      function MakeForWrite(aNeedCompression : Boolean = true): IStream;
        {-}
      function MakeForRead: IStream;
        {-}
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(anID: Integer);
        reintroduce;
        {-}
      class function Make(anID: Integer): Il3TempStream;
        reintroduce;
        {-}
  end;//TevTempStream

implementation

{$IfDef l3UseStorageForDataCache}
uses
  l3LongintList,
  m3StorageTools,
  m3StgMgr
  ;
{$EndIf l3UseStorageForDataCache}

// start class TevDataCache

{$IfDef l3UseStorageForDataCache}
var
 g_Root    : Im3IndexedStorage = nil;

class function TevDataCache.GetRoot: Im3IndexedStorage;
  {-}
begin
 if (g_Root = nil) then
  g_Root := Tm3FullModeStorageManager.MakeInterface('');
 Result := g_Root;
end;
{$EndIf l3UseStorageForDataCache}

{$IfDef l3UseStorageForDataCache}
var
 g_Counter : Integer = 0;
 g_Freed   : Tl3LongintList = nil;
{$EndIf l3UseStorageForDataCache} 
 
class function TevDataCache.CreateTempStream: Il3TempStream;
  {-}
var
 l_ID : Integer;
begin
 {$IfDef l3UseStorageForDataCache}
 if not g_Freed.Empty then
 begin
  with g_Freed do
  begin
   l_ID := Integer(Last);
   DeleteLast;
  end;//with g_Freed
 end//not g_Freed.Empty
 else
 begin
  l_ID := g_Counter;
  Inc(g_Counter);
 end;//not g_Freed.Empty
 {$Else  l3UseStorageForDataCache}
 l_ID := 0;
 {$EndIf l3UseStorageForDataCache}
 Result := TevTempStream.Make(l_ID);
end;

// start class TevTempStream

constructor TevTempStream.Create(anID: Integer);
  //reintroduce;
  {-}
begin
 inherited Create;
 {$IfDef l3UseStorageForDataCache}
 f_ID := anID;
 {$EndIf l3UseStorageForDataCache}
end;

class function TevTempStream.Make(anID: Integer): Il3TempStream;
  //reintroduce;
  {-}
var
 l_Stream : TevTempStream;
begin
 l_Stream := Create(anID);
 try
  Result := l_Stream;
 finally
  l3Free(l_Stream);
 end;//try..finally
end;

procedure TevTempStream.Cleanup;
  //override;
  {-}
begin
 {$IfDef l3UseStorageForDataCache}
 if (g_Root <> nil) then
 begin
  //g_Root.DeleteStore(f_ID);
  // - это видимо не надо - чтобы не тратить врем€, а поток и так перезапишетс€ 
  if (g_Freed = nil) then
   g_Freed := Tl3LongintList.MakeSorted;
  g_Freed.Add(f_ID);
 end;//g_Root <> nil
 {$Else  l3UseStorageForDataCache}
 l3Free(f_Stream);
 {$EndIf l3UseStorageForDataCache}
 inherited;
end;

function TevTempStream.MakeForWrite(aNeedCompression : Boolean = true): IStream;
  {-}
begin
 {$IfDef l3UseStorageForDataCache}
 Result := m3COMOpenStream(TevDataCache.GetRoot, f_ID, m3_saReadWrite, true, aNeedCompression);
 {$Else  l3UseStorageForDataCache}
 if (f_Stream = nil) then
  f_Stream := Tl3TempFileStream.Create
 else
  f_Stream.Seek(0, soBeginning);
 Result := f_Stream;  
 {$EndIf l3UseStorageForDataCache}
end;

function TevTempStream.MakeForRead: IStream;
  {-}
begin
 {$IfDef l3UseStorageForDataCache}
 Result := m3COMOpenStream(TevDataCache.GetRoot, f_ID, m3_saRead, false);
 {$Else  l3UseStorageForDataCache}
 f_Stream.Seek(0, soBeginning);
 Result := f_Stream;  
 {$EndIf l3UseStorageForDataCache}
end;

{$IfDef l3UseStorageForDataCache}
initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3DataCache.pas initialization enter'); {$EndIf}

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3DataCache.pas initialization leave'); {$EndIf}
finalization
 g_Root := nil;
 l3Free(g_Freed);
{$EndIf l3UseStorageForDataCache}

end.

