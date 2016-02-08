unit l3WindowsStorageFiler;
{* Обертка вокруг потока, который работает с IStorage на диске. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3WindowsStorageFiler -     }
{ Начат: 18.10.2001 16:43             }
{ $Id: l3WindowsStorageFiler.pas,v 1.12 2015/08/04 13:02:49 fireton Exp $ }

// $Log: l3WindowsStorageFiler.pas,v $
// Revision 1.12  2015/08/04 13:02:49  fireton
// - bug fix: AV
//
// Revision 1.11  2014/11/05 05:58:16  fireton
// - не собиралось
//
// Revision 1.10  2004/09/24 08:56:46  lulin
// - bug fix: не компилировалось.
//
// Revision 1.9  2004/08/31 17:02:20  law
// - cleanup: убраны ненужные параметры.
//
// Revision 1.8  2002/06/17 13:44:45  law
// - new const: m3_saRead, m3_saReadWrite, m3_saCreate.
//
// Revision 1.7  2002/02/22 10:30:52  law
// - optimization: используем интерфейс Im3IndexedStorage.
//
// Revision 1.6  2001/11/28 14:19:30  law
// - new behavior: сделано создание хранилищ с автоматической паковкой.
//
// Revision 1.5  2001/10/23 16:45:16  law
// - new behavior: прикручено пакование потоков при записи.
//
// Revision 1.4  2001/10/23 15:21:06  law
// - new behavior: прикручен пакованый IStream на чтение.
//
// Revision 1.3  2001/10/23 08:15:47  law
// - new behavior: переделан под Мишанин IStorage.
//
// Revision 1.2  2001/10/19 16:20:23  law
// - new unit: evEvdWriter.
//
// Revision 1.1  2001/10/18 14:54:37  law
// - new unit: l3WindowsStorageFiler.
//

{$I l3Define.inc }

interface

uses
  Windows,
  ComObj,
  ActiveX,
  
  l3Types,
  l3InternalInterfaces,
  l3Filer,

  m3StorageInterfaces,
  m3stgmgr
  ;

type
  Tl3CustomWindowsStorageFiler = class(Tl3CustomDOSFiler, Il3StorageSource)
   {* Обертка вокруг потока, который работает с IStorage на диске. }
    private
    // internal fields
      f_Storage : Im3IndexedStorage;
      f_Plain   : Bool;
    protected
    // property methos
      function pm_GetStorage: IStorage;
        {-}
    protected
    // internal methods
      function  DoOpen: Boolean;
        override;
        {-}
      procedure DoClose;
        override;
        {-}
      procedure Release;
        override;
        {-}
    public
    // public properties
      property Storage: Im3IndexedStorage
        read f_Storage
        write f_Storage;
        {-}
      property Plain: Bool
        read f_Plain
        write f_Plain
        default false;
        {-}
  end;//Tl3CustomWindowsStorageFiler

  Tl3WindowsStorageFiler = class(Tl3CustomWindowsStorageFiler)
   {*! Обертка вокруг потока, который работает с IStorage на диске. Для конечного использования на форме. }
    published
    {properties}
      property ReadOnly;
        {-}
      property FileName;
        {-}
      property NeedProcessMessages;
        {-}
      property Indicator;
        {-}
      property CodePage;
        {-}
    published
    {events}
      property OnCheckAbortedLoad;
        {-}
  end;//Tl3WindowsStorageFiler

implementation

uses
  Classes,

  l3Base,
  l3Stream,

  m2COMLib,

  m3ArcMgr
  ;

// start class Tl3CustomWindowsStorageFiler

procedure Tl3CustomWindowsStorageFiler.Release;
  //override;
  {-}
begin
 inherited;
 Storage := nil;
end;

function Tl3CustomWindowsStorageFiler.pm_GetStorage: IStorage;
  {-}
begin
 if Assigned(Storage) then
  Result := Storage.As_IStorage
 else
  Result := nil; 
end;

function Tl3CustomWindowsStorageFiler.DoOpen: Boolean;
  //override;
  {-}
var
 l_Status  : Tl3IStatus;
 l_Name    : WideString;
 l_IStream : IStream;
 l_Stream  : TStream;
begin
 if Plain then
  Result := inherited DoOpen
 else begin
  Result := true;
  try
   l_Name := FileName;
   Case Mode of
     l3_fmRead  : begin
      l_Status := Tm3ReadModeStorageManager.MakeSafeInterface(f_Storage, l_Name);
      if (l_Status = STG_E_FILEALREADYEXISTS) OR
         (l_Status = STG_E_INVALIDHEADER) then begin
       Result := inherited DoOpen;
       Exit;
      end else begin
       OleCheck(l_Status);
       l_IStream := m2COMOpenStream(f_Storage.As_IStorage,
                                    'main',
                                    STGM_READ or STGM_SHARE_EXCLUSIVE,
                                    false);
      end;//l_Status = STG_E_FILEALREADYEXISTS
     end;//l3_fmRead
     l3_fmWrite : begin
      OleCheck(Tm3FullModeStorageManager.MakeSafeInterface(f_Storage, l_Name));
      l_IStream := m2COMCreateStream(f_Storage.As_IStorage,
                                      'main',
                                      m3_saCreate,
                                      false);
     end;//l3_fmWrite
     l3_fmReadWrite : begin
     end;//l3_fmReadWrite
     l3_fmAppend : begin
     end;//l3_fmAppend
   end;//Case Mode
   if (l_IStream <> nil) then begin
    l3IStream2Stream(l_IStream, l_Stream);
    try
     l3Set(f_Stream, l_Stream);
    finally
     l3Free(l_Stream);
    end;//try..finally
   end;//l_IStream <> nil
  finally
   l_IStream := nil;
  end;//try..finally
 end;//Plain 
end;

procedure Tl3CustomWindowsStorageFiler.DoClose;
  //override;
  {-}
begin
 inherited;
 Storage := nil;
end;

end.

