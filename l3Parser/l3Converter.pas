unit l3Converter;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Converter -               }
{ Начат: 15.05.2000 15:24             }
{ $Id: l3Converter.pas,v 1.24 2011/05/19 12:24:21 lulin Exp $ }

// $Log: l3Converter.pas,v $
// Revision 1.24  2011/05/19 12:24:21  lulin
// {RequestLink:266409354}.
//
// Revision 1.23  2011/05/19 10:36:07  lulin
// {RequestLink:266409354}.
//
// Revision 1.22  2009/07/21 15:10:18  lulin
// - bug fix: не собирался и не работал Архивариус в ветке.
//
// Revision 1.21  2008/02/18 19:05:12  lulin
// - распиливаем поиск.
//
// Revision 1.20  2008/02/13 16:03:14  lulin
// - убраны излишне гибкие методы поиска.
//
// Revision 1.19  2008/02/06 15:37:10  lulin
// - каждому базовому объекту по собственному модулю.
//
// Revision 1.18  2008/02/06 09:55:31  lulin
// - глобальные объекты сделаны индексированным свойством.
//
// Revision 1.17  2008/02/05 09:58:12  lulin
// - выделяем базовые объекты в отдельные файлы и переносим их на модель.
//
// Revision 1.16  2008/02/01 15:14:54  lulin
// - избавляемся от излишней универсальности списков.
//
// Revision 1.15  2007/08/14 14:30:12  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.14  2006/06/06 10:48:58  oman
// hint fix
//
// Revision 1.13  2005/04/28 15:04:11  lulin
// - переложил ветку B_Tag_Box в HEAD.
//
// Revision 1.12.14.1  2005/04/26 14:30:57  lulin
// - ускоряем l3Free и _l3Use.
//
// Revision 1.12  2004/09/28 17:22:15  lulin
// - в первом приближении сделал кеш документов. Пока без вымещения покументов на диск.
//
// Revision 1.11  2004/06/02 08:30:31  law
// - удален конструктор Tl3VList.MakePersistentSorted - пользуйтесь _Tl3ObjectRefList.MakeSorted.
//
// Revision 1.10  2002/05/22 11:10:40  law
// - new behavior: немного изменена обработка исключительных ситуаций.
//
// Revision 1.9  2002/04/16 12:04:49  law
// - new param: HideExceptions.
//
// Revision 1.8  2000/12/15 15:19:00  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  Windows,
  ActiveX,

  l3Types,
  l3Base,
  l3Memory
  ;

type
  TMSCInitConverterProc = function(aWnd: hWnd; aModule: PChar): Long; stdcall;
  TMSCUninitConverterProc = procedure; stdcall;
  TMSCForeignToRTFProcCallback = function(aSize: Long; aPercent: Long): Long; stdcall;
  TMSCIsFormatCorrect = function(aFile: THandle; aClass: THandle): SmallInt; stdcall;
  TMSCForeignToRTFProc = function(aFile     : THandle;
                                  aStorage  : IStorage;
                                  aBuff     : THandle;
                                  aClass    : THandle;
                                  aSubset   : THandle;
                                  aCallBack : TMSCForeignToRTFProcCallback): SmallInt; stdcall;
  TMSCRegisterAppProc = function(aFlags: Long; aRegApp: Pointer): THandle; stdcall;
  TMSCFetchError = function(anError    : Long;
                            anErrorStr : PChar;
                            aSize      : Long): Long; stdcall;

  Tl3Converter = class(Tl3String)
    private
    {private fields}
      f_DLLModule       : hModule;
      f_InitConverter   : TMSCInitConverterProc;
      f_UninitConverter : TMSCUninitConverterProc;
      f_ForeignToRTF    : TMSCForeignToRTFProc;
      f_IsFormatCorrect : TMSCIsFormatCorrect;
      f_RegisterApp     : TMSCRegisterAppProc;
      f_FetchError      : TMSCFetchError;
    protected
    {internal methdos}
      procedure Release;
        override;
        {-}
    public
    {public methods}
      constructor Create(const aDLLName: String);
        reintroduce;
        {-}
      function ForeignToRTF(aFile     : THandle;
                            aBuffer   : Tl3MemoryPool;
                            aCallback : TMSCForeignToRTFProcCallback): Long;
        {-}
      function ErrorStr(anError: Long): String;
        {-}
      procedure LoadDLL;
        {-}
      procedure UnloadDLL;
        {-}
  end;{Tl3Converter}

function l3GetConverter(const aDLLName: String): Tl3Converter;
  {-}
function l3Convert(const aConverters : array of string;
                   aFile             : THandle;
                   aBuffer           : Tl3MemoryPool;
                   aCallback         : TMSCForeignToRTFProcCallback;
                   HideExceptions    : Bool = true): Bool;
  {-}                 

implementation

uses
  SysUtils
  {$IfNDef l3ConsoleApp}
  ,
  Forms
  {$EndIf  l3ConsoleApp}
  ,

  l3StringList,
  l3ConvertersList
  ;

const
{  WordPadName = 'WORDPAD';}
  WordPadName = 'MSWORD';

{ start class Tl3Converter }

constructor Tl3Converter.Create(const aDLLName: String);
  {reintroduce;}
  {-}
begin
 inherited Create;
 AsString := aDLLName;
 LoadDLL;
end;

procedure Tl3Converter.LoadDLL;
  {-}
var
 l_ConverterReg : THandle;
 l_Handle       : THandle;
begin
 if (f_DllModule = 0) then begin
  f_DLLModule := LoadLibrary(St);
  if (f_DLLModule = 0) then
   raise Exception.CreateFmt('Невозможно загрузить библиотеку конвертации "%s"', [AsString]);
  @f_InitConverter := GetProcAddress(f_DLLModule, PChar('InitConverter32'));
  @f_UninitConverter := GetProcAddress(f_DLLModule, PChar('UninitConverter'));
  @f_ForeignToRTF := GetProcAddress(f_DLLModule, PChar('ForeignToRtf32'));
  @f_IsFormatCorrect := GetProcAddress(f_DLLModule, PChar('IsFormatCorrect32'));
  @f_RegisterApp := GetProcAddress(f_DLLModule, PChar('RegisterApp'));
  @f_FetchError := GetProcAddress(f_DLLModule, PChar('CchFetchLpszError'));
  if not Assigned(f_ForeignToRTF) then
   raise Exception.Create('Неправильная библиотека конвертации');
  {$IfNDef l3ConsoleApp}
  l_Handle := Application.Handle;
  {$Else l3ConsoleApp}
  l_Handle := 0;
  {$EndIf l3ConsoleApp}
  if Assigned(f_InitConverter) AND
    not LongBool(f_InitConverter(l_Handle, PChar(WordPadName))) then
   raise Exception.CreateFmt('Невозможно инициализировать конвертер "%s"', [AsString]);
  if Assigned(f_RegisterApp) then begin
   l_ConverterReg := f_RegisterApp(10{8}{9}, nil);
   if (l_ConverterReg <> 0) then GlobalFree(l_ConverterReg);
  end;{Assigned(f_RegisterApp}
 end;{f_DllModule = 0}
end;

procedure Tl3Converter.UnloadDLL;
  {-}
begin
 if (f_DLLModule <> 0) then begin
  if Assigned(f_UninitConverter) then f_UninitConverter;
  FreeLibrary(f_DLLModule);
  f_DLLModule := 0;
 end;{f_DLLModule <> 0}
end;

procedure Tl3Converter.Release;
  {override;}
  {-}
begin
 UnloadDLL;
 inherited;
end;

function Tl3Converter.ForeignToRTF(aFile     : THandle;
                                   aBuffer   : Tl3MemoryPool;
                                   aCallback : TMSCForeignToRTFProcCallback): Long;
  {-}

 procedure DoConvert;
 var
  l_OldSize : Long;
  l_Handle  : THandle;
 begin
  l_Handle := aBuffer.AsHandle;
  l_OldSize := aBuffer.Size;
  Result := f_ForeignToRTF(aFile, nil, l_Handle, 0, 0, aCallback);
  l_OldSize := aBuffer.Size - l_OldSize;
  if (l_OldSize <> 0) then l3System.CorrectGlobalMemSize(l_OldSize);
 end;

var
 l_Class   : Tl3MemoryPool;
 l_OldSize : Long; 
begin
 LoadDLL;
 try
  if not Assigned(f_IsFormatCorrect) then
   DoConvert
  else begin
   l_Class := Tl3MemoryPool.Create;
   try
    l_Class.Size := 1024;
    l_OldSize := l_Class.Size;
    Result := f_IsFormatCorrect(aFile, l_Class.AsHandle);
    if (Result = 1) then begin
     l_OldSize := l_Class.Size - l_OldSize;
     if (l_OldSize <> 0) then l3System.CorrectGlobalMemSize(l_OldSize);
     DoConvert
     {Result = 1}
    end else
     Result := -14;
   finally
    l3Free(l_Class);
   end;{try..finally}
  end;
 finally
  UnloadDLL;
 end;{try..finally}
end;

function Tl3Converter.ErrorStr(anError: Long): String;
  {-}
var
 l_Error : array [0..1024] of Char;
 l_Size  : Long;
begin
 LoadDll;
 if Assigned(f_FetchError) then
 begin
  l_Size := f_FetchError(anError, l_Error, SizeOf(l_Error));
  if (l_Size = 0) then
   Result := ''
  else
  begin
   SetLength(Result, l_Size);
   l3Move(l_Error, PChar(Result)^, l_Size);
  end;//l_Size = 0
 end//Assigned(f_FetchError)
 else
  Result := '';
end;

function l3GetConverter(const aDLLName: String): Tl3Converter;
  {-}
var
 l_ConvertersList : Tl3ConvertersList;
 l_Index          : Long;
begin
 l_ConvertersList := Tl3ConvertersList.Instance;
 if l_ConvertersList.FindData(aDLLName, l_Index) then
  Result := Tl3Converter(l_ConvertersList.Items[l_Index])
 else
 begin
  Result := Tl3Converter.Create(aDLLName);
  try
   l_ConvertersList.Add(Result);
  finally
   Result := Result.Free;
  end;//try..finally
 end;//Find..
end;

function l3Convert(const aConverters : array of string;
                   aFile             : THandle;
                   aBuffer           : Tl3MemoryPool;
                   aCallback         : TMSCForeignToRTFProcCallback;
                   HideExceptions    : Bool = true): Bool;
  {-}
var
 l_Error     : Long;
 l_Converter : Tl3Converter;
 i           : Long;
begin
 Result := false;
 i := Low(aConverters);
 while (i <= High(aConverters)) AND not Result do begin
  try
   l_Converter := l3GetConverter(aConverters[i]);
(*  except
   if HideExceptions then
    break
   else
    raise;
  end;*)
   l_Error := l_Converter.ForeignToRTF(aFile, aBuffer, aCallback);
   if (l_Error = -13) then
    Result := true
   else
    Result := l_Error >= 0;
  except
   Result := false;
  end;//try..except
  Inc(i);
 end;{while (i <= High(aConverters))}
end;

end.

