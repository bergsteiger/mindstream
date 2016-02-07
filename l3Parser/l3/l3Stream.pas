unit l3Stream;
{* Различные потоки данных. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Stream - описание стандартных потоков }
{ Начат: 28.01.1999 18:24             }
{ $Id: l3Stream.pas,v 1.97 2014/02/21 18:08:45 lulin Exp $ }
{ Комментарии: Часть кода взята из примеров к книге Рэя Лишнера }
{               "Секреты Delphi 2"                              }

// $Log: l3Stream.pas,v $
// Revision 1.97  2014/02/21 18:08:45  lulin
// - избавляемся от обёрток над тегами.
//
// Revision 1.96  2013/04/08 18:10:29  lulin
// - пытаемся отладиться под XE.
//
// Revision 1.94  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.93  2013/03/28 17:25:04  lulin
// - портируем.
//
// Revision 1.92  2012/09/12 14:15:53  lulin
// {RequestLink:392696007}
//
// Revision 1.90  2012/08/29 10:22:10  fireton
// - при Seek от soEnd смещение ВСЕГДА должно быть <= 0
//
// Revision 1.89  2012/05/30 07:34:04  voba
// -add classTl3NullStream
//
// Revision 1.88  2012/02/28 12:55:37  lulin
// {RequestLink:336664105}
//
// Revision 1.87  2011/12/28 11:13:02  lulin
// {RequestLink:325256237}
//
// Revision 1.86  2011/12/09 16:39:32  lulin
// {RequestLink:315261927}
//
// Revision 1.85  2011/11/02 15:27:29  lulin
// - переносим утилитную функцию в более подходящее место.
//
// Revision 1.84  2010/10/26 13:03:05  lulin
// {RequestLink:237503905}.
//
// Revision 1.83  2010/03/17 15:43:30  voba
// K:197496324
//
// Revision 1.82  2010/02/10 19:16:59  lulin
// {RequestLink:186352297}.
//
// Revision 1.81  2010/01/19 17:49:31  lulin
// {RequestLink:139430176}. Выводим ошибки в лог и выводим этот лог на страницу с результатами тестов.
//
// Revision 1.80  2010/01/14 18:55:09  lulin
// - готовимся к сравнению NSRC'ов.
//
// Revision 1.79  2010/01/14 18:46:36  lulin
// - затачиваем фреймворк под сравнение файлов.
//
// Revision 1.78  2009/12/21 19:15:54  lulin
// - не пишем неизменённые файлы.
//
// Revision 1.77  2009/10/14 08:56:31  voba
// - избавляемся от библиотеки mg
// -add function Tl3HandleStream.Lock(const aOffset: Int64; aSize: Int64; aWaitTime : Longword) : Boolean;
// -add function Tl3HandleStream.Unlock(const aOffset: Int64; aSize: Int64) : Boolean;
//
// Revision 1.76  2009/09/07 10:28:45  voba
// - opt. Tl3BufferStreamMemoryPool - Стандартный буфер для буферизованных потоков
//
// Revision 1.75  2008/12/12 19:19:30  lulin
// - <K>: 129762414.
//
// Revision 1.74  2008/02/05 11:58:39  voba
// - bug fix от Шуры
//
// Revision 1.73  2008/02/04 15:22:59  lulin
// - bug fix: не запускался парень.
//
// Revision 1.72  2008/02/01 15:14:54  lulin
// - избавляемся от излишней универсальности списков.
//
// Revision 1.71  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.70  2007/05/15 11:28:58  lulin
// - bug fix: использовали неправильную функцию перемещения указателя потока.
//
// Revision 1.69  2006/12/27 18:03:45  lulin
// - добавляем возможность указать расширение временному файлу.
//
// Revision 1.68  2006/04/26 12:24:29  voba
// - временный поток теперь возвращает правильные атрибуты доступа.
//
// Revision 1.67  2006/04/26 12:16:23  voba
// - bug fix: архивирующие потоки не работали над файловыми потоками, отличными от m3.
//
// Revision 1.66  2006/04/26 09:01:26  voba
// - введен режим открытия "по-Опоссуму" - l3_fmCreateReadWrite.
// - bug fix: буферизующий поток повисал, видимо после чтения и последующей записи.
//
// Revision 1.65  2006/04/25 13:52:57  lulin
// - убран ненужный параметр.
//
// Revision 1.64  2006/04/25 12:47:50  lulin
// - cleanup.
//
// Revision 1.63  2006/01/05 09:37:11  lulin
// - new behavior: отпускаем поток с картинкой, как только вычитали оттуда картинку.
//
// Revision 1.62  2006/01/04 15:35:02  lulin
// - cleanup.
//
// Revision 1.61  2005/12/28 16:32:37  lulin
// - для Немезиса уменьшен таймаут на время открытия файла.
//
// Revision 1.60  2005/10/04 09:13:24  lulin
// - new behavior: сделана возможность получать имя записываемго в поток файла.
//
// Revision 1.59  2005/10/04 08:42:09  lulin
// - cleanup.
//
// Revision 1.58  2005/07/06 10:31:03  lulin
// - new method: l3System.Time2Log.
// - new proc: l3RaiseOSError.
//
// Revision 1.57  2005/04/16 11:41:27  lulin
// - слил с веткой. Теперь из ветки можно вытягивать ТОЛЬКО Everest.
//
// Revision 1.56.4.1  2005/04/15 12:18:26  lulin
// - new method: Tl3FileStream.Make.
//
// Revision 1.56  2005/01/17 16:37:33  migel
// - add: поддержка задания времени таймаута при открытии файла на диске.
//
// Revision 1.55  2004/11/26 09:11:57  voba
// - add l3StripDoubleQuotes in Tl3FileStream.Create
//
// Revision 1.54  2004/10/11 13:34:46  lulin
// - временный файл (в который вымещаются тексты из кеша) сделан буферизованным.
//
// Revision 1.53  2004/09/15 11:09:29  lulin
// - _Tl3Stream переведен на "шаблон" l3Unknown.
//
// Revision 1.52  2004/08/27 10:56:20  law
// - new const: l3_fmExclusiveReadWrite.
//
// Revision 1.51  2004/08/06 14:22:32  law
// - избавился от части Warnings/Hints.
//
// Revision 1.50  2004/06/03 16:54:46  law
// - new method: Il3Base.CheckStamp.
//
// Revision 1.49  2004/03/31 12:09:59  law
// - new behavior: Tl3HandleStream теперь устанавливает конец файла.
//
// Revision 1.48  2004/03/30 14:22:49  fireton
// - bug fix: range check error в _Tl3TextStream при записи пустой строки
//
// Revision 1.47  2003/11/06 14:13:54  law
// - bug fix: Tl3SubStream не работал с потоком, который не поддерживает Seek.
//
// Revision 1.46  2003/10/21 16:55:04  law
// - bug fix: некорректно работал метод _Tl3BufferStream.FlushBuffer, когда в поток ничео не записали.
//
// Revision 1.45  2003/10/15 08:29:27  law
// - bug fix: оформление параграфов накапливалось в один буфер.
//
// Revision 1.44  2003/09/12 10:32:52  law
// - new: конструктору Tl3TempFileStream.Create добавлен параметр - имя создаваемого файла, если оно <> nil, то файл не удаляется при закрытии потока.
//
// Revision 1.43  2003/06/25 11:26:50  law
// - change: используем константу MAX_PATH вместо константы 255.
//
// Revision 1.42  2003/06/20 15:03:25  law
// - new behavior: сделана возможность задавать размер буфера у буферизованного потока.
//
// Revision 1.41  2003/06/03 12:35:02  law
// - bug fix: повисала ссылка на поток при создании _Tl3TextStream.
//
// Revision 1.40  2003/06/02 12:03:46  law
// - new behavior: сделана буферизация потока в генераторе, использующем Call-back функцию.
//
// Revision 1.39  2003/03/13 16:37:21  law
// - change: попытка портировать на Builder.
//
// Revision 1.38  2002/12/24 13:02:03  law
// - change: объединил Int64_Seek c основной веткой.
//
// Revision 1.37.2.1  2002/12/23 15:51:28  law
// - bug fix: не работали с хранилищем > 2Гб.
//
// Revision 1.37  2002/11/01 12:55:24  law
// - bug fix.
//
// Revision 1.36  2002/09/16 08:45:48  law
// - done: сделано сравнение потоков и старого и нового хранилищ.
//
// Revision 1.35  2002/09/13 15:20:52  law
// - new proc: l3CompareStreams - пока без реализации.
//
// Revision 1.34  2002/09/11 15:43:04  law
// - change: адаптация к Delphi 7.0.
//
// Revision 1.33  2002/09/09 13:25:05  law
// - cleanup.
//
// Revision 1.32  2002/06/18 13:10:50  law
// - new behavior: выводим еще и имя файла.
//
// Revision 1.31  2002/04/05 08:09:20  voba
// -bug fix
//
// Revision 1.30  2002/04/03 13:51:05  law
// - new const: 3_fmExclusiveWrite, l3_fmExclusiveAppend.
// - new behavior: ожидание открытия файла.
//
// Revision 1.29  2002/02/19 14:17:36  voba
// - bug fix: неправильно обрабатывался код ошибки.
//
// Revision 1.28  2002/02/19 13:57:39  law
// - new behavior: при открытии файла поднимается "родное" исключение.
//
// Revision 1.27  2001/10/19 16:20:23  law
// - new unit: evEvdWriter.
//
// Revision 1.26  2001/10/15 14:56:32  law
// - cleanup.
//
// Revision 1.25  2001/08/31 11:01:53  law
// - comments: xHelpGen.
//
// Revision 1.24  2001/08/31 09:23:54  law
// - cleanup & comments.
//
// Revision 1.23  2001/08/31 08:50:08  law
// - cleanup: первые шаги к кроссплатформенности.
//
// Revision 1.22  2001/08/30 16:34:38  law
// - new version: портировал на Delphi 6.
//
// Revision 1.21  2001/08/29 07:01:10  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//
// Revision 1.20  2001/07/02 14:23:13  law
// - comments: xHelpGen.
//
// Revision 1.19  2001/04/05 11:49:47  law
// - cleanup: убраны функции поддержки 16-ти битной платформы.
//
// Revision 1.18  2001/01/31 10:37:32  law
// - оптимизировано использование QueryInterface.
//
// Revision 1.17  2001/01/10 14:03:11  law
// - добавил функцию l3CopyStream.
//
// Revision 1.16  2000/12/15 14:57:02  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  Windows,
  Classes,
  
  l3Types,
  l3IID,
  l3InternalInterfaces,
  l3Memory,
  l3BaseStream
  ;

const
 {$IfDef Nemesis}
 Cl3FileStreamDefaultTimeOut = 3000;
 {$Else  Nemesis}
 Cl3FileStreamDefaultTimeOut = 300000;
 {$EndIf Nemesis}

{$IfDef XE}
 {.$Define l3NoBufferStream}
{$EndIf XE}

type
  {$IfNDef l3NoBufferStream}
  Tl3BufferState = (bsUnknown, bsRead, bsWrite);
   {* Состояние буфера. }
  {$endIf  l3NoBufferStream}
  Tl3BufferStream = class(Tl3Stream, Il3Flush)
   {* Буферизованный поток. }
    private
      fStream  : TStream;
      {$IfNDef l3NoBufferStream}
      f_Buffer : Tl3MemoryPoolPrim;
      fBufPtr  : PAnsiChar;
      fBufEnd  : PAnsiChar;
      fState   : Tl3BufferState;
      function GetBufPosition: LongInt;
      function pm_GetBuffer: PAnsiChar;
        {-}
      {$EndIf  l3NoBufferStream}
    protected
      {$IfNDef l3NoBufferStream}
      function FillBuffer: Boolean;
        {* - заполнить буфер. }
      {$EndIf  l3NoBufferStream}
      function FlushBuffer: Boolean;
        {* - сбросить буфер. }
      function Il3Flush.Flush = FlushBuffer;
        {-}
      procedure PutBack(Ch: AnsiChar);
        {* - вернуть символ в поток. }
      procedure SetSize(const NewSize: Int64);
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    {$IfNDef l3NoBufferStream}
    protected
    // internal properties
      property Buffer: PAnsiChar
        read pm_GetBuffer;
        {* - буфер. }
      property BufPtr: PAnsiChar
        read fBufPtr;
        {* - текущий указатеь буфера. }
      property BufEnd: PAnsiChar
        read fBufEnd;
        {* - конец буфера. }
      property BufPosition: LongInt
        read GetBufPosition;
        {* - текущая позиция в буфере. }
      property State: Tl3BufferState
        read fState;
        {* - состояние буфера. }
    {$EndIf l3NoBufferStream}
    public
      constructor Create(Stream : TStream);
        reintroduce;
        {* - создает буферизованный поток для другого потока. }
      function Read(var Buffer; Count: LongInt): LongInt;
        override;
        {-}
      function Write(const Buffer; Count: LongInt): LongInt;
        override;
        {-}
      function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
        override;
        {-}
      function IsEof: Boolean;
        {* - достигнут конец потока? }
      property Stream: TStream
        read fStream;
        {* - поток, который мы буферизуем. }
  end;//Tl3BufferStream

  Tl3TextStream = class(Tl3BufferStream)
   {* Текстовый поток. }
    public
    // public methods
      constructor Create(const Filename : string;
                         aMode          : Tl3FileMode;
                         aTimeOut       : Longword = Cl3FileStreamDefaultTimeOut);
        reintroduce;
        overload;
        virtual;
        {* - создает текстовый поток для файла. }
      constructor Create(aStream : TStream);
        reintroduce;
        overload;
        {* - создает текстовый поток для другого потока. }

      { Useful input routines. }
(*      procedure SkipSpaces;
      function GetChar: AnsiChar;
      function GetInteger: LongInt;
      function GetFloat: Extended;
      function GetToken(const Delimiters: string): string;*)
      function GetLine: string;

      { Basic output routines. }
(*      function PutChar(Ch: AnsiChar): Tl3TextStream;
      function PutInteger(Int: LongInt): Tl3TextStream;
      function PutFloat(Flt: Extended): Tl3TextStream;
      function PutString(const Str: string): Tl3TextStream;
      function PutLine(const Str: string): Tl3TextStream;
      function PutPChar(const Str: PAnsiChar): Tl3TextStream;
      function PutWideChar(WCh: WideChar): Tl3TextStream;

      { Special output characters. }
      function PutSpace: Tl3TextStream;
      function PutTab: Tl3TextStream;
      function PutEndOfLine: Tl3TextStream;*)

      { Formatted output routines. }
(*      procedure WriteArgs(Args: array of const);
      procedure WriteLn(Args: array of const);
      procedure Format(const Fmt: string; Args: array of const);
      procedure FormatLn(const Fmt: string; Args: array of const);*)
  end;//Tl3TextStream

  Tl3NamedTextStream = class(Tl3TextStream)
    private
    // property fields
      f_FileName : String;
    public
    // public methods
      constructor Create(const Filename : String;
                         aMode          : Tl3FileMode;
                         aTimeOut       : Longword = Cl3FileStreamDefaultTimeOut);
        override;
        {* - создает текстовый поток для файла. }
    public
    // public properties
      property FileName: String
        read f_FileName;
        {-}
  end;//Tl3NamedTextStream

  Tl3NullStream = class(Tl3Stream)
   {* Поток в пустоту. }
    public
      function Read(var Buffer; Count: Longint): Longint;
        override;
        {-}
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
      function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
        override;
  end;//Tl3HandleStream

  Tl3HandleStream = class(Tl3Stream)
   {* Поток с Windows handle'ом. }
    private
      FHandle: THandle;
    protected
    // internal methods
      function GetSize: Int64;
        override;
        {-}
      procedure SetSize(const NewSize: Int64);
        override;
        {-}
    public
    // public methods
      constructor Create(AHandle: THandle);
        reintroduce;
        {* - создает поток по идентификатору. }
      function Read(var Buffer; Count: Longint): Longint;
        override;
        {-}
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
      function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
        override;
        {-}
      function Lock(const aOffset: Int64; aSize: Int64; aWaitTime : Longword =  15000 {ms}) : Boolean;
        {-}
      function Unlock(const aOffset: Int64; aSize: Int64) : Boolean;
        {-}
    public
    // public properties
      property Handle: THandle
        read FHandle;
        {-}
  end;//Tl3HandleStream

  Tl3FileStream = class(Tl3HandleStream)
   {* Файловый поток. }
    private
    // internal fields
      f_Mode : Tl3FileMode;
    protected
    // internal methods
      procedure FillStat(var statstg: TStatStg; grfStatFlag: Longint);
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(const aFileName : String;
                         aMode           : Tl3FileMode;
                         aTimeOut        : Longword = Cl3FileStreamDefaultTimeOut);
        reintroduce;
        virtual;
        {* - создает поток по имени файла. }
      class function Make(const aFileName : String;
                          aMode           : Tl3FileMode = l3_fmRead;
                          aTimeOut        : Longword = Cl3FileStreamDefaultTimeOut): IStream;
        reintroduce;                 
        {* - создает поток по имени файла. }
  end;//Tl3FileStream

  Tl3NamedFileStream = class(Tl3TextStream)
    private
    // property fields
      f_FileName : String;
    public
    // public methods
      constructor Create(const aFileName : String;
                         aMode           : Tl3FileMode;
                         aTimeOut        : Longword = Cl3FileStreamDefaultTimeOut);
        override;
        {* - создает поток по имени файла. }
    public
    // public properties
      property FileName: String
        read f_FileName;
        {-}
  end;//Tl3NamedFileStream

  Tl3TempFileStream = class(Tl3HandleStream)
   {* Поток во временном файле. }
    protected
    // internal methods
      procedure FillStat(var statstg: TStatStg; grfStatFlag: Longint);
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(theName     : PString = nil;
                         const anExt : String = '');
        reintroduce;
        {* - создает поток во временном файле. }
      class function MakeBuffered: TStream;
        {-}
  end;{Tl3TempFileStream}

  Tl3ResourceStream = class(Tl3ConstMemoryStream)
   {* Поток с ресурсом в EXE-файле. }
    private
    {internal fields}
      HResInfo : HRSRC;
      HGlobal  : THandle;
      procedure Initialize(Instance: THandle; Name, ResType: PChar);
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(Instance      : THandle;
                         const ResName : String;
                         ResType       : PChar = RT_RCData);
        reintroduce;
        {* - создает поток для ресурса по имени. }
      constructor CreateFromID(Instance : THandle;
                               ResID    : Integer;
                               ResType  : PChar = RT_RCData);
        {* - создает поток для ресурса по идентификатору. }
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
  end;{Tl3ResourceStream}

  Tl3SubStream = class(Tl3Stream)
   {* Поток, который представляет собой часть другого потока. }
    private
    {internal fields}
      f_Stream   : TStream;
      f_StartPos : Int64;
      f_Size     : Int64;
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
    public
    {public methods}
      constructor Create(anOwner: TStream; aStartPos, aSize: Int64);
        reintroduce;
        {* - создает подпоток. }
      function Read(var Buffer; Count: Longint): Longint;
        override;
        {-}
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
      function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
        override;
        {-}
  end;{Tl3SubStream}

  Tl3IStreamAdapter = class(Tl3Stream)
   {* Потоковая обертка вокруг IStream. }
    private
    {internal fields}
      f_IStream  : IStream;
    protected
    // internal methods
      function  GetStream: IStream;
        virtual;
        {-}
      procedure CheckStream;
        {-}
      procedure FreeStream;
        {-}  
    function GetSize: Int64; override;
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(const anIStream: IStream);
        reintroduce;
        {* - создает адаптер. }
      function Read(var Buffer; Count: Longint): Longint;
        override;
        {-}
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
      function Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
        override;
        {-}
      function COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        override;
        {-}
  end;//Tl3IStreamAdapter

procedure l3IStream2Stream(const anIStream: IStream; out theStream: TStream);
  {* - преобразует IStream в TStream. }
function  l3Stream2IStream(aStream: TStream): IStream;
  {* - преобразует TStream в IStream. }
function  l3CopyStream(anInStream, anOutStream: TStream): Large;
  {* - копирует из одного потока в другой. }
function l3CompareStreams(const aStream1, aStream2: IStream; aHeaderBegin : AnsiChar = #0): Bool;
 overload;
 {* - сравнивает побайтово два потока. }
function l3CompareStreams(const aStream1, aStream2: TStream; aHeaderBegin : AnsiChar = #0): Bool;
 overload;
 {* - сравнивает побайтово два потока. }
function l3CompareFiles(const aStream1, aStream2: String; aHeaderBegin : AnsiChar = #0): Bool;
 {* - сравнивает побайтово два файла. }
procedure l3CatFiles(const aTo, aFrom: String;
                     const aStartDelim : String = '';
                     const aFinishDelim : String = '');
 {* - складывает два файла. }
procedure l3StripHeader(aStream : TStream; aHeaderBegin : AnsiChar);
 {-}

implementation

uses
  SysConst,
  {$IfDef Delphi6}
  RTLConsts,
  {$Else  Delphi6}
  Consts,
  {$EndIf Delphi6}
  SysUtils,
  ActiveX,
  ComObj,

  l3Const,
  l3Chars,
  l3MinMax,
  l3String,
  l3Base,
  l3InterfacesMisc,
  l3Filer,
  l3SysUtils,

  m2InternalInterfaces,
  m2COMLib
  ;

type
 TInt64Rec = packed record
  Lo : DWord;
  Hi : DWord;
 end;

{ Create and initialize a buffer stream. }
constructor Tl3BufferStream.Create(Stream : TStream);
begin
  inherited Create;
  l3Set(fStream, Stream);
  {$IfNDef l3NoBufferStream}
  { Allocate the buffer. }
  f_Buffer := Tl3BufferStreamMemoryPool.Create;
  fBufEnd := f_Buffer.AsPointer + f_Buffer.Size;
  fState := bsUnknown;
  {$EndIf  l3NoBufferStream}
end;

{ Destroy the buffer stream. If the buffer is in write mode, then
  make sure the last bufferful is written to the stream. }
procedure Tl3BufferStream.Cleanup;
begin
 {$IfNDef l3NoBufferStream}
 if (State = bsWrite) then
  FlushBuffer;
 FreeAndNil(f_Buffer);
 {$EndIf  l3NoBufferStream}
 inherited;
 {$IfNDef l3NoBufferStream}
 FreeAndNil(fStream);
 {$EndIf  l3NoBufferStream}
end;

{ Fill the input buffer. }
{$IfNDef l3NoBufferStream}
function Tl3BufferStream.FillBuffer: Boolean;
var
 NumBytes: Cardinal;
begin
 { Read from the actual stream. }
 NumBytes := Stream.Read(Buffer^, f_Buffer.Size);
 { Set the buffer pointer and end. }
 fBufPtr := Buffer;
 fBufEnd := Buffer + NumBytes;
 { If nothing was read, it must be the end of file. }
 Result := NumBytes > 0;
 if Result then
   fState := bsRead
 else
   fState := bsUnknown;
end;
{$EndIf l3NoBufferStream}

{ Write the output buffer to the stream. When done, the
  buffer is empty, so set the state back to bsUnknown. }
function Tl3BufferStream.FlushBuffer: Boolean;
{$IfNDef l3NoBufferStream}
var
 NumBytes: Long;
{$EndIf l3NoBufferStream}
begin
{$IfNDef l3NoBufferStream}
 { Determine the number of bytes in the buffer. }
 if (BufPtr = nil) OR (Buffer = nil) then
  Result := (0 = Stream.Write((nil)^, 0))
 else
 begin
  NumBytes := BufPtr - Buffer;
  { Write the buffer contents. }
  Result := NumBytes = Stream.Write(Buffer^, NumBytes);
 end;//BufPtr = nil..
 { The buffer is empty, so reset the state. }
 fBufPtr := Buffer;
 fState := bsUnknown;
{$EndIf l3NoBufferStream}
end;

{ Read Count bytes. Copy first from the input buffer, and then
  fill the input buffer repeatedly, until fetching all Count bytes.
  Return the number of bytes read. If the state was Write, then
  flush the output buffer before reading. }
function Tl3BufferStream.Read(var Buffer; Count: LongInt): LongInt;
{$IfNDef l3NoBufferStream}
var
 Ptr: PAnsiChar;
 NumBytes: Long;
{$EndIf  l3NoBufferStream}
begin
 {$IfDef l3NoBufferStream}
 Result := fStream.Read(Buffer, Count);
 {$Else  l3NoBufferStream}
 if State = bsWrite then
   FlushBuffer
 else
 if BufPtr = nil then
   fBufPtr := BufEnd; { empty buffer, so force a FillBuffer call }

 { The user might ask for more than one bufferful.
   Prepare to loop until all the requested bytes have been read. }
 Ptr := @Buffer;
 Result := 0;
 while Count > 0 do
 begin
   { If the buffer is empty, then fill it. }
   if BufPtr = BufEnd then
     if not FillBuffer then
       Break;
   NumBytes := BufEnd - BufPtr;
   if Count < NumBytes then
     NumBytes := Count;

   { Copy the buffer to the user's memory. }
   l3Move(BufPtr^, Ptr^, NumBytes);
   { Increment the pointers. The stream’s buffer is always within a single
     segment, but the user's buffer might cross segment boundaries. }
   Dec(Count, NumBytes);
   Inc(fBufPtr, NumBytes);
   Inc(Result, NumBytes);
   Ptr := Ptr + NumBytes;
 end;
 {$EndIf l3NoBufferStream}
end;

{ Write Count bytes from Buffer to the stream. If the state was
  bsRead, then reposition the stream to match. }
function Tl3BufferStream.Write(const Buffer; Count: LongInt): LongInt;
{$IfNDef l3NoBufferStream}
var
 Ptr      : Pointer;
 NumBytes : Cardinal;
{$EndIf  l3NoBufferStream}
begin
 {$IfDef l3NoBufferStream}
 Result := fStream.Write(Buffer, Count);
 {$Else  l3NoBufferStream}
 if (Count < 0) then
  raise EStreamError.Create('Пытаемся читать отрицательное количество байт');
 { If the stream is for reading, then ignore the current buffer
   by forcing the position of the underlying stream to match
   the buffered stream's position. }
 if (State = bsRead) then
   fStream.Position := Position
 else
 begin
  if (BufPtr = nil) then
  begin
    { Unknown state, so start with an empty buffer. }
    fBufPtr := f_Buffer.AsPointer;
    fBufEnd := fBufPtr + f_Buffer.Size;
  end//BufPtr = nil
  else
  if (fBufPtr = fBufEnd) AND (fBufPtr = f_Buffer.AsPointer) then
   fBufEnd := fBufPtr + f_Buffer.Size;
 end;//State = bsRead

 { The user might write more than one bufferful.
   Prepare to loop until all the requested bytes have been written. }
 Ptr := @Buffer;
 Result := 0;                   { Total number of bytes written. }
 while Count > 0 do
 begin
   { Calculate the number of bytes remaining in the buffer. }
   NumBytes := BufEnd - BufPtr;
   if (Cardinal(Count) < NumBytes) then
     NumBytes := Count;
   { Copy from the user's memory to the buffer. }
   l3Move(Ptr^, BufPtr^, NumBytes);
   { Increment the pointers. The stream's buffer is always in
     a single segment, but the user's buffer might cross
     segment boundaries.}
   Dec(Count, NumBytes);
   Inc(fBufPtr, NumBytes);
   Inc(Result, NumBytes);
   Ptr := PAnsiChar(Ptr) + NumBytes;
   if BufPtr = BufEnd then
     if not FlushBuffer then
       Break;
 end;
 { If anything remains in the buffer, then set the state to bsWrite. }
 if BufPtr <> f_Buffer.AsPointer then
   fState := bsWrite;
 {$EndIf  l3NoBufferStream}
end;

{ Seek to a new position. Calling Seek to learn the current
  position is a common idiom, so do not disturb the buffers
  and just return the position, taking the current buffer
  position into account. If the Seek is to _move to a different
  position in the stream, the dump the buffer and reset the state. }
function Tl3BufferStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
{$IfNDef l3NoBufferStream}
var
 CurrentPosition: LongInt;
{$EndIf  l3NoBufferStream}
begin
 {$IfDef l3NoBufferStream}
 Result := fStream.Seek(Offset, Origin);
 {$Else  l3NoBufferStream}
 { Determine the current position. }
 CurrentPosition := Stream.Position + BufPosition;

 { Determine the new position }
 case Origin of
  soBeginning: Result := Offset;
  soCurrent:   Result := Stream.Position + BufPosition + Offset;
  soEnd:       Result := Stream.Size + Offset; // Offset MUST be <= 0
  else
   raise Exception.Create(l3ErrInvalidOrigin);
 end;

 { Is the desired position different? }
 if Result <> CurrentPosition then
 begin
   { Flush a partial write. }
   if (State = bsWrite) and not FlushBuffer then
     raise EStreamError.Create(l3ErrSeekError);
   { Reset the stream. }
   Stream.Position := Result;
   { Discard the current buffer. }
   fBufPtr := nil;
   fState := bsUnknown;
 end;
 {$EndIf l3NoBufferStream}
end;

{$IfNDef l3NoBufferStream}
{ Return an offset that can be added to Stream.Position to
  yield the effective position in the stream. }
function Tl3BufferStream.GetBufPosition: LongInt;
begin
 case State of
 bsUnknown:
   Result := 0;
 bsRead:
   Result := LongInt(BufPtr) - LongInt(BufEnd);
 bsWrite:
   Result := BufPtr - Buffer;
 else
   raise Exception.Create('Invalid buffer state');
 end;
end;

function Tl3BufferStream.pm_GetBuffer: PAnsiChar;
  {-}
begin
 Result := f_Buffer.AsPointer;
end;
{$EndIf l3NoBufferStream}

{ Push a character back onto the input buffer. }
procedure Tl3BufferStream.PutBack(Ch: AnsiChar);
begin
 {$IfDef l3NoBufferStream}
 assert(false);
 {$Else  l3NoBufferStream}
 if fBufPtr <= f_Buffer.AsPointer then
   raise EStreamError.Create(l3ErrPutbackOverflow);
 Dec(fBufPtr);
 BufPtr[0] := Ch;
 {$EndIf l3NoBufferStream}
end;

{ Return whether the current position is at the end of the file. }
function Tl3BufferStream.IsEof: Boolean;
begin
 Result := ({$IfNDef l3NoBufferStream}
            (BufPtr = BufEnd) and
            {$EndIf  l3NoBufferStream}
            (Stream.Position = Stream.Size));
end;

procedure Tl3BufferStream.SetSize(const NewSize: Int64);
  //override;
  {-}
begin
 FlushBuffer;
 Stream.Size := NewSize;
end;

// start class Tl3TextStream 

constructor Tl3TextStream.Create(const Filename : string;
                                 aMode          : Tl3FileMode;
                                 aTimeOut       : Longword = Cl3FileStreamDefaultTimeOut);
  {-}
var
 l_Stream : TStream;
begin
 l_Stream := Tl3FileStream.Create(Filename, aMode, aTimeOut);
 try
  inherited Create(l_Stream);
 finally
  FreeAndNil(l_Stream);
 end;//try..finally
end;

constructor Tl3TextStream.Create(aStream : TStream);
  {reintroduce;}
  {overload;}
  {-}
begin
 inherited Create(aStream);
end;

{ Read a token, delimited by arbitrary characters. An empty string
  means any white space characters. }
(*function Tl3TextStream.GetToken(const Delimiters: string): string;
var
 Ch: AnsiChar;
begin
 Result := '';
 { Read the input one character at a time. }
 while Read(Ch, 1) = 1 do
 begin
   { Check for delimiters. When a delimiter is found, the delimiter
     character is pushed back onto the input buffer before exiting
     from the loop. }
   if (Length(Delimiters) = 0) and (Ch <= ' ') then
   begin
     Putback(Ch);
     Break;
   end
   else if (Length(Delimiters) > 0) and (Pos(Ch, Delimiters) > 0) then
   begin
     Putback(Ch);
     Break;
   end;
   { Append a non-delimiter to the token string. }
   Result := Result + Ch;
 end;
end;*)

{ Read a line of text, stripping the line ending characters. }
function Tl3TextStream.GetLine: string;
var
 Ch: AnsiChar;
begin
 Result := '';
 { Read characters until reaching at end-of-line character. }
 while (Read(Ch, 1) = 1) and not (Ch in [#10,#13]) do
   Result := Result + Ch;
 { If the end-of-line is CR, look for a subsequent LF. }
 if Ch = #13 then
 begin
   if (Read(Ch, 1) = 1) and (Ch <> #10) then
     Putback(Ch);
 end;
end;

{ Skip over white space (<= ' ') characters. }
(*procedure Tl3TextStream.SkipSpaces;
var
 C: AnsiChar;
begin
 while Read(C, 1) = 1 do
   if C > ' ' then
   begin
     { Stop with the first nonspace character. }
     Putback(C);
     Break;
   end;
end;

{ Read & return one character from the input buffer. }
function Tl3TextStream.GetChar: AnsiChar;
begin
 ReadBuffer(Result, 1);
end;

{ Read a token and convert it to an integer. }
function Tl3TextStream.GetInteger: LongInt;
begin
 SkipSpaces;
 Result := StrToInt(GetToken(''));
end;

{ Read a token and convert it to a floating point number. }
function Tl3TextStream.GetFloat: Extended;
begin
 SkipSpaces;
 Result := StrToFloat(GetToken(''));
end;*)

{ Print a single character. }
(*function Tl3TextStream.PutChar(Ch: AnsiChar): Tl3TextStream;
begin
 WriteBuffer(Ch, 1);
 Result := Self;
end;

function Tl3TextStream.PutWideChar(WCh: WideChar): Tl3TextStream;
begin
 WriteBuffer(WCh, SizeOf(WCh));
 Result := Self;
end;

{ Print an integer. }
function Tl3TextStream.PutInteger(Int: LongInt): Tl3TextStream;
begin
 PutString(IntToStr(Int));
 Result := Self;
end;

{ Print a floating point number. }
function Tl3TextStream.PutFloat(Flt: Extended): Tl3TextStream;
begin
 PutString(FloatToStr(Flt));
 Result := Self;
end;

{ Print a string. }
function Tl3TextStream.PutString(const Str: string): Tl3TextStream;
begin
 if Str <> '' then
  WriteBuffer(Str[1], Length(Str));
 Result := Self;
end;

{ Print a line of text, appending a line ending. }
function Tl3TextStream.PutLine(const Str: string): Tl3TextStream;
begin
 if Str <> '' then
  WriteBuffer(Str[1], Length(Str));
 PutEndOfLine;
 Result := Self;
end;

{ Print a PAnsiChar string. }
function Tl3TextStream.PutPChar(const Str: PAnsiChar): Tl3TextStream;
begin
 WriteBuffer(Str[0], StrLen(Str));
 Result := Self;
end;

{ Print a space character. }
function Tl3TextStream.PutSpace: Tl3TextStream;
begin
 PutChar(' ');
 Result := Self;
end;

{ Print a tab character. }
function Tl3TextStream.PutTab: Tl3TextStream;
begin
 PutChar(#9);
 Result := Self;
end;

{ Print an end of line. }
function Tl3TextStream.PutEndOfLine: Tl3TextStream;
begin
 PutChar(#13);
 PutChar(#10);
 Result := Self;
end;*)

{ Write arbitrary arguments, using default formatting. }
(*procedure Tl3TextStream.WriteArgs(Args: array of const);
var
 I: Integer;
begin
 for I := Low(Args) to High(Args) do
 begin
   case Args[I].VType of
   vtInteger:         PutInteger(Args[I].VInteger);
   vtBoolean:
     if Args[I].VBoolean then
       PutString('True')
     else
       PutString('False');
   vtChar:            PutChar(Args[I].VChar);
   vtExtended:        PutFloat(Args[I].VInteger);
   vtString:          PutString(Args[I].VString^);
   vtPointer:         Format('%p', [Args[I].VPointer]);
   vtPChar:           PutPChar(Args[I].VPChar);
   vtClass:           PutString(Args[I].VClass.ClassName);
   vtObject:
     begin
       PutChar('(');
       PutString(Args[I].VObject.ClassName);
       PutChar(')');
     end;
   vtAnsiString:      PutString(string(Args[I].VAnsiString));
   vtWideChar:        PutWideChar(Args[I].VWideChar);
   vtCurrency:        PutFloat(Args[I].VCurrency^);
   vtVariant:         PutString(Args[I].VVariant^);
   end;
   if (I < High(Args)) and (Args[I].VType <> vtChar) then
     PutSpace;
 end;
end;

{ Write arbitrary arguments, appending a line ending. }
procedure Tl3TextStream.WriteLn(Args: array of const);
begin
 WriteArgs(Args);
 PutEndOfLine;
end;

{ Format and write arbitrary arguments. }
procedure Tl3TextStream.Format(const Fmt: string; Args: array of const);
begin
 PutString(SysUtils.Format(Fmt, Args));
end;

{ Format and write arbitrary arguments, appending a line ending. }
procedure Tl3TextStream.FormatLn(const Fmt: string; Args: array of const);
begin
 PutString(SysUtils.Format(Fmt, Args));
 PutEndOfLine;
end;*)

// start class Tl3ResourceStream 

constructor Tl3ResourceStream.Create(Instance: THandle; const ResName: string;
  ResType: PChar);
begin
 inherited Create(nil, 0);
 Initialize(Instance, PChar(ResName), ResType);
end;

constructor Tl3ResourceStream.CreateFromID(Instance: THandle; ResID: Integer;
  ResType: PChar);
begin
 inherited Create(nil, 0);
 Initialize(Instance, PChar(ResID), ResType);
end;

procedure Tl3ResourceStream.Initialize(Instance: THandle; Name, ResType: PChar);

  procedure Error;
  begin
   raise EResNotFound.Create(Format(SResNotFound, [Name]));
  end;

begin
 HResInfo := FindResource(Instance, Name, ResType);
 if HResInfo = 0 then Error;
 HGlobal := LoadResource(Instance, HResInfo);
 if HGlobal = 0 then Error;
 Memory := LockResource(HGlobal);
 Size := SizeOfResource(Instance, HResInfo);
end;

procedure Tl3ResourceStream.Cleanup;
begin
 UnlockResource(HGlobal);
 FreeResource(HGlobal);
 inherited;
end;

function Tl3ResourceStream.Write(const Buffer; Count: Longint): Longint;
begin
 raise EStreamError.Create(SCantWriteResourceStreamError);
end;


// start class Tl3NullStream

function Tl3NullStream.Read(var Buffer; Count: Longint): Longint;
begin
 Assert(false, 'Из Tl3NullStream читать нельзя');
 //Result := Count;
end;

function Tl3NullStream.Write(const Buffer; Count: Longint): Longint;
begin
 Result := Count;
end;

function Tl3NullStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
 Result := 0;
end;

// start class Tl3HandleStream

constructor Tl3HandleStream.Create(aHandle: THandle);
begin
 inherited Create;
 FHandle := aHandle;
end;

function Tl3HandleStream.Read(var Buffer; Count: Longint): Longint;
begin
 if not Windows.ReadFile(FHandle, Buffer, Count, LongWord(Result), nil) then
  Result := 0;
end;

function Tl3HandleStream.Write(const Buffer; Count: Longint): Longint;
begin
 if not Windows.WriteFile(FHandle, Buffer, Count, LongWord(Result), nil) then
  Result := 0;
end;

function Tl3HandleStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
begin
 Result := FileSeek(Integer(FHandle), Offset, Integer(Origin));
end;

function Tl3HandleStream.Lock(const aOffset: Int64; aSize: Int64; aWaitTime : Longword) : Boolean;
var
 l_TickCount : Longword;
begin
 l_TickCount := GetTickCount;
 repeat
  Result := LockFile(fHandle, TInt64Rec(aOffset).Lo, TInt64Rec(aOffset).Hi, TInt64Rec(aSize).Lo, TInt64Rec(aSize).Hi);
 until Result or l3IsTimeElapsed(l_TickCount, aWaitTime);
end;

function Tl3HandleStream.Unlock(const aOffset: Int64; aSize: Int64) : Boolean;
begin
 Result := UnlockFile(fHandle, TInt64Rec(aOffset).Lo, TInt64Rec(aOffset).Hi, TInt64Rec(aSize).Lo, TInt64Rec(aSize).Hi);
end;

function Tl3HandleStream.GetSize: Int64;
  //override;
  {-}
type
 T64to32 = packed record
  RLoLongWord: LongWord;
  RHiLongWord: LongWord;
 end;//T64to32
var
 LResult : T64to32 absolute Result;
begin
 LResult.RLoLongWord := Windows.GetFileSize(fHandle, @LResult.RHiLongWord);
 Assert(LResult.RLoLongWord <> LongWord(-1));
end;
  
procedure Tl3HandleStream.SetSize(const NewSize: Int64);
  //override;
  {-}
begin
  Seek(NewSize, soBeginning);
{$IFDEF MSWINDOWS}
  Win32Check(SetEndOfFile(FHandle));
{$ELSE}
  if ftruncate(FHandle, Position) = -1 then
    raise EStreamError(sStreamSetSize);
{$ENDIF}
end;

// start class Tl3NamedFileStream

constructor Tl3NamedFileStream.Create(const aFileName : String;
                                      aMode           : Tl3FileMode;
                                      aTimeOut        : Longword = Cl3FileStreamDefaultTimeOut);
  //override;
  {* - создает поток по имени файла. }
begin
 f_FileName := l3StripDoubleQuotes(aFileName);
 inherited;
end;

// start class Tl3FileStream

constructor Tl3FileStream.Create(const aFileName : string;
                                 aMode          : Tl3FileMode;
                                 aTimeOut       : Longword);
var
 l_TickCount : Cardinal;
 l_Error     : Cardinal;
 l_FileName  : string;
begin
 f_Mode := aMode;
 inherited Create(0);
 l_FileName := l3StripDoubleQuotes(aFileName);
 l_TickCount := GetTickCount;
 repeat
  {if aForMG then
  begin
   Case aMode of
    l3_fmRead :
     FHandle := Windows.CreateFile(PAnsiChar(l_FileName), GENERIC_READ,
                                   FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                                   OPEN_EXISTING,
                                   FILE_FLAG_SEQUENTIAL_SCAN,
                                   0);
    l3_fmWrite :
     FHandle := Windows.CreateFile(PAnsiChar(l_FileName), GENERIC_READ OR GENERIC_WRITE,
                                   FILE_SHARE_READ, nil,
                                   CREATE_ALWAYS,
                                   FILE_FLAG_SEQUENTIAL_SCAN,
                                   0);
    l3_fmExclusiveReadWrite:
     FHandle := Windows.CreateFile(PAnsiChar(l_FileName), GENERIC_READ OR GENERIC_WRITE,
                                   0, nil,
                                   OPEN_ALWAYS,
                                   FILE_FLAG_SEQUENTIAL_SCAN,
                                   0);
    l3_fmExclusiveWrite :
     FHandle := Windows.CreateFile(PAnsiChar(l_FileName), GENERIC_WRITE,
                                   0, nil,
                                   CREATE_ALWAYS,
                                   FILE_FLAG_SEQUENTIAL_SCAN,
                                   0);
    l3_fmReadWrite :
     FHandle := Windows.CreateFile(PAnsiChar(l_FileName), GENERIC_READ OR GENERIC_WRITE,
                                   FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                                   OPEN_ALWAYS,
                                   0, 0);
    l3_fmAppend :
     FHandle := Windows.CreateFile(PAnsiChar(l_FileName), GENERIC_WRITE,
                                   FILE_SHARE_READ, nil,
                                   OPEN_ALWAYS,
                                   0, 0);
    l3_fmExclusiveAppend :
     FHandle := Windows.CreateFile(PAnsiChar(l_FileName), GENERIC_WRITE,
                                   0, nil,
                                   OPEN_ALWAYS,
                                   0, 0);
    l3_fmCreateReadWrite :
     FHandle := Windows.CreateFile(PAnsiChar(l_FileName), GENERIC_READ OR GENERIC_WRITE,
                                   FILE_SHARE_READ, nil,
                                   CREATE_ALWAYS,
                                   0, 0);
   end;//Case aMode
  end//aForMG
  else
  begin   }
   Case aMode of
    l3_fmRead :
     FHandle := Windows.CreateFile(PChar(l_FileName), GENERIC_READ,
                                   FILE_SHARE_READ, nil,
                                   OPEN_EXISTING,
                                   FILE_FLAG_SEQUENTIAL_SCAN,
                                   0);
    l3_fmWrite :
     FHandle := Windows.CreateFile(PChar(l_FileName), GENERIC_WRITE,
                                   FILE_SHARE_READ, nil,
                                   CREATE_ALWAYS,
                                   FILE_FLAG_SEQUENTIAL_SCAN,
                                   0);
    l3_fmExclusiveReadWrite:
     FHandle := Windows.CreateFile(PChar(l_FileName), GENERIC_READ OR GENERIC_WRITE,
                                   0, nil,
                                   OPEN_ALWAYS,
                                   FILE_FLAG_SEQUENTIAL_SCAN,
                                   0);
    l3_fmExclusiveWrite :
     FHandle := Windows.CreateFile(PChar(l_FileName), GENERIC_WRITE,
                                   0, nil,
                                   CREATE_ALWAYS,
                                   FILE_FLAG_SEQUENTIAL_SCAN,
                                   0);
    l3_fmReadWrite :
     FHandle := Windows.CreateFile(PChar(l_FileName), GENERIC_READ OR GENERIC_WRITE,
                                   FILE_SHARE_READ, nil,
                                   OPEN_ALWAYS,
                                   0, 0);
    l3_fmAppend :
     FHandle := Windows.CreateFile(PChar(l_FileName), GENERIC_WRITE,
                                   FILE_SHARE_READ, nil,
                                   OPEN_ALWAYS,
                                   0, 0);
    l3_fmExclusiveAppend :
     FHandle := Windows.CreateFile(PChar(l_FileName), GENERIC_WRITE,
                                   0, nil,
                                   OPEN_ALWAYS,
                                   0, 0);
    l3_fmCreateReadWrite :
     FHandle := Windows.CreateFile(PChar(l_FileName), GENERIC_READ OR GENERIC_WRITE,
                                   FILE_SHARE_READ, nil,
                                   CREATE_ALWAYS,
                                   0, 0);

    l3_fmFullShareReadWrite :
     FHandle := Windows.CreateFile(PChar(l_FileName), GENERIC_READ OR GENERIC_WRITE,
                                   FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                                   OPEN_ALWAYS,
                                   FILE_FLAG_WRITE_THROUGH, 0);
    l3_fmFullShareCreateReadWrite :
     FHandle := Windows.CreateFile(PChar(l_FileName), GENERIC_READ OR GENERIC_WRITE,
                                   FILE_SHARE_READ or FILE_SHARE_WRITE, nil,
                                   CREATE_ALWAYS,
                                   FILE_FLAG_WRITE_THROUGH, 0);
   end;//Case aMode
  //end;//aForMG
  if (FHandle = INVALID_HANDLE_VALUE) then begin
   l_Error := GetLastError;
   if l3IsTimeElapsed(l_TickCount, aTimeOut) OR (l_Error <> ERROR_SHARING_VIOLATION) then
    l3RaiseOSError(l_Error, ^M + l_FileName);
  end else begin
   if (aMode in [l3_fmAppend, l3_fmExclusiveAppend]) then
    Seek(0, soEnd);
   break;
  end;
 until false;
end;

class function Tl3FileStream.Make(const aFileName : string;
                                  aMode          : Tl3FileMode = l3_fmRead;
                                  aTimeOut       : Longword = Cl3FileStreamDefaultTimeOut): IStream;
  //reintroduce;
  {* - создает поток по имени файла. }
var
 l_Stream : Tl3FileStream;
begin
 l_Stream := Create(aFileName, aMode, aTimeOut);
 try
  Result := l_Stream;
 finally
  FreeAndNil(l_Stream);
 end;//try..finally
end;

procedure Tl3FileStream.Cleanup;
begin
 if (FHandle <> INVALID_HANDLE_VALUE) then Windows.CloseHandle(FHandle);
 inherited;
end;

procedure Tl3FileStream.FillStat(var statstg: TStatStg; grfStatFlag: Longint);
  //override;
  {-}
begin
 inherited;
 if (f_Mode = l3_fmRead) then
  statstg.grfMode := STGM_READ
 else
 if (f_Mode = l3_fmWrite) then
  statstg.grfMode := STGM_WRITE
 else
 if (f_Mode in l3_fmWriteMode) then
  statstg.grfMode := STGM_READWRITE
 else
  Assert(false);
end;
  
// start class Tl3SubStream

constructor Tl3SubStream.Create(anOwner: TStream; aStartPos, aSize: Int64);
  {reintroduce;}
  {-}
var
 l_Filer  : Tl3CustomFiler;
 l_Stream : Tl3MemoryStream;
begin
 inherited Create;
 l_Stream := nil;
 try
  if (anOwner Is Tl3FilerStream) then
  begin
   l_Filer := Tl3FilerStream(anOwner).Filer;
   if l_Filer.NotSeekStream then
   begin
    Assert(l_Filer.Mode = l3_fmRead);
    l_Stream := Tl3MemoryStream.Make;
    try
     l_Stream.CopyFrom(anOwner, aSize);
     l_Stream.Seek(0, soBeginning);
     anOwner := l_Stream;
     aStartPos := 0;
    except
     FreeAndNil(l_Stream);
     raise;
    end;//try..except
   end;//l_Filer.NotSeekStream
  end;//anOwner Is Tl3FilerStream
  l3Set(f_Stream, anOwner);
  f_StartPos := aStartPos;
  f_Size := aSize;
 finally
  FreeAndNil(l_Stream);
 end;//try..finally
end;

procedure Tl3SubStream.Cleanup;
  {override;}
  {-}
begin
 FreeAndNil(f_Stream);
 inherited;
end;

function Tl3SubStream.Read(var Buffer; Count: Longint): Longint;
  {override;}
  {-}
begin
 Count := Min(Count, f_StartPos + f_Size - f_Stream.Position);
 Result := f_Stream.Read(Buffer, Count);
end;

function Tl3SubStream.Write(const Buffer; Count: Longint): Longint;
  {override;}
  {-}
begin
 Count := Min(Count, f_StartPos + f_Size - f_Stream.Position);
 Result := f_Stream.Write(Buffer, Count);
end;

function Tl3SubStream.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
  {override;}
  {-}
begin
 case Origin of
  soBeginning:
    Result := f_Stream.Seek(f_StartPos + Offset, Origin) - f_StartPos;
  soCurrent:
    Result := f_Stream.Seek(Offset, Origin) - f_StartPos;
  soEnd:
    Result := f_Stream.Seek(f_StartPos + f_Size + Offset, soBeginning) - f_StartPos;
  else
    raise EStreamError.Create(l3ErrInvalidOrigin);
 end;//case Origin
 if (Result < 0) OR (Result > f_StartPos + f_Size) then
   raise EStreamError.Create(l3ErrSeekPastEof);
end;

// start class Tl3TempFileStream 

constructor Tl3TempFileStream.Create(theName     : PString = nil;
                                     const anExt : String = '');
  {reintroduce;}
  {-}
var
 TempPath, TempFile : array [0..MAX_PATH] of Char;
 l_Name             : String;
 l_Delete           : Cardinal;
begin
 inherited Create(0);
 Windows.GetTempPath(MAX_PATH, TempPath);
 Windows.GetTempFileName(TempPath, 'l3', 0, TempFile);
 if (anExt = '') then
  l_Name := TempFile
 else
  l_Name := ChangeFileExt(TempFile, anExt);
 if (theName <> nil) then
 begin
  theName^ := l_Name;
  l_Delete := 0;
 end//theName <> nil
 else
  l_Delete := FILE_FLAG_DELETE_ON_CLOSE;
 FHandle := Windows.CreateFile(PChar(l_Name), GENERIC_READ or GENERIC_WRITE,
                               FILE_SHARE_READ, nil,
                               OPEN_ALWAYS,
                               l_Delete OR FILE_ATTRIBUTE_TEMPORARY,
                               0);
 if (FHandle = INVALID_HANDLE_VALUE) then begin
  FHAndle := 0;
  {$IfDef Delphi7}
  raise EFOpenError.CreateResFmt(@SFOpenErrorEx, [l_Name, SysErrorMessage(GetLastError)]);
  {$Else  Delphi7}
  raise EFCreateError.Create(Format(SFCreateError, [l_Name]));
  {$EndIf Delphi7}
 end;
end;

class function Tl3TempFileStream.MakeBuffered: TStream;
  {-}
var
 l_Stream : Tl3TempFileStream;
begin
 l_Stream := Create;
 try
  Result := Tl3BufferStream.Create(l_Stream);
 finally
  FreeAndNil(l_Stream);
 end;//try..finally
end;

procedure Tl3TempFileStream.Cleanup;
  {override;}
  {-}
begin
 if (FHandle <> INVALID_HANDLE_VALUE) then FileClose(FHandle);
 inherited;
end;

procedure Tl3TempFileStream.FillStat(var statstg: TStatStg; grfStatFlag: Longint);
  //override;
  {-}
begin
 inherited;
 statstg.grfMode := STGM_READWRITE;
end;
  
// start class Tl3IStreamAdapter

constructor Tl3IStreamAdapter.Create(const anIStream: IStream);
  {reintroduce;}
  {-}
begin
 inherited Create;
 f_IStream := anIStream;
end;

procedure Tl3IStreamAdapter.Cleanup;
  {override;}
  {-}
begin
 FreeStream;
 inherited;
end;

function Tl3IStreamAdapter.GetSize: Int64; //override;
begin
 CheckStream;
 Result := m2COMGetSize(f_IStream);
end;

function Tl3IStreamAdapter.GetStream: IStream;
  {-}
begin
 Result := nil;
end;

procedure Tl3IStreamAdapter.CheckStream;
  {-}
begin
 if (f_IStream = nil) then
  f_IStream := GetStream;
end;

procedure Tl3IStreamAdapter.FreeStream;
  {-}
begin
 f_IStream := nil;
end;

function Tl3IStreamAdapter.Read(var Buffer; Count: Longint): Longint;
  {override;}
  {-}
begin
 CheckStream;
 if (f_IStream = nil) then
  Result := 0
 else
  OleCheck(f_IStream.Read(@Buffer, Count, @Result));
end;

function Tl3IStreamAdapter.Write(const Buffer; Count: Longint): Longint;
  {override;}
  {-}
begin
 CheckStream;
 if (f_IStream = nil) then
  Result := 0
 else
  OleCheck(f_IStream.Write(@Buffer, Count, @Result));
// f_IStream.Write(@Buffer, Count, @Result);
end;

function Tl3IStreamAdapter.Seek(const Offset: Int64; Origin: TSeekOrigin): Int64;
  {override;}
  {-}
var
 _Result : Int64;
begin
 CheckStream;
 if (f_IStream = nil) then
 begin
  Assert(Offset = 0);
  Result := 0;
 end//f_IStream = nil
 else
 begin
  OleCheck(f_IStream.Seek(Offset, Integer(Origin), _Result));
  Result := _Result;
 end;//f_IStream = nil
end;

function Tl3IStreamAdapter.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  {override;}
  {-}
begin
 Result.SetOk;
 if IID.EQ(IStream) then
  IStream(Obj) := f_IStream
 else
 if IID.EQ(Im2StoreStat) then
 begin
  if not Supports(f_IStream, IID.IID, Obj) then
   Result.SetNoInterface;
 end//IID.EQ(Im2StoreStat)
 else
  Result := inherited COMQueryInterface(IID, Obj);
end;

procedure l3IStream2Stream(const anIStream: IStream; out theStream: TStream);
  {-}
var
 l_ObjectWrap     : Il3ObjectWrap;
 l_Object         : TObject;
 l_IStreamAdapter : Tl3IStreamAdapter;
begin
 if (anIStream = nil) then
  theStream := nil
 else begin
  if l3IOk(anIStream.QueryInterface(Il3ObjectWrap, l_ObjectWrap)) then
   try
    if l3System.IsLocalIntf(l_ObjectWrap) then
    begin
     l_Object := l_ObjectWrap.GetObject;
     if (l_Object Is TStream) then begin
      theStream := l3Use(TStream(l_Object));
      Exit;
     end;//l_Object Is TStream
    end;//l3System.IsLocalIntf(l_ObjectWrap)
   finally
    l_ObjectWrap := nil;
   end;{try..finally}
  l_IStreamAdapter := Tl3IStreamAdapter.Create(anIStream);
  try
   theStream := l_IStreamAdapter.Use;
  finally
   FreeAndNil(l_IStreamAdapter);
  end;{try..finally}
 end;{Value = nil}
end;

function l3Stream2IStream(aStream: TStream): IStream;
  {-}
begin
 if (aStream = nil) then
  Result := nil
 else if l3BQueryInterface(aStream, IStream, Result) then
  Exit
 else
  Result := TStreamAdapter.Create(aStream) As IStream;
end;

function l3CopyStream(anInStream, anOutStream: TStream): Large;
  {-}
var  
 l_Read : Large;
begin
 l3Stream2IStream(anInStream).CopyTo(
  l3Stream2IStream(anOutStream), High(Large), l_Read, Result);
end;

function l3CompareStreams(const aStream1, aStream2: IStream; aHeaderBegin : AnsiChar = #0): Bool;
 //overload;
 {* - сравнивает побайтово два потока. }
var
 l_Stream1, l_Stream2: TStream;
begin
 l3IStream2Stream(aStream1, l_Stream1);
 try
  l3IStream2Stream(aStream2, l_Stream2);
  try
   Result := l3CompareStreams(l_Stream1, l_Stream2, aHeaderBegin);
  finally
   FreeAndNil(l_Stream2);
  end;//try..finally
 finally
  FreeAndNil(l_Stream1);
 end;//try..finally
end;

procedure l3StripHeader(aStream : TStream; aHeaderBegin : AnsiChar);
var
 aCh : AnsiChar;
 aPos : Integer;
begin
 aPos := 0;
 with aStream do
 begin
  while (Position < Size) do
  begin
   Read(aCh, 1);
   if (aCh <> aHeaderBegin) then
    break;
   while (Position < Size) and (aCh <> #10) do
    Read(aCh, 1);
   aPos := Position;
  end;//Position < Size
  Position := aPos;
 end;//with aStream
end;

function l3CompareStreams(const aStream1, aStream2: TStream; aHeaderBegin : AnsiChar = #0): Bool;
 //overload;
 {* - сравнивает побайтово два потока. }
var
 l_Size  : Long;
 l_Read  : Long;
 l_Buff1 : PAnsiChar;
 l_Buff2 : PAnsiChar;
begin
 if (aStream1 = aStream2) then
  Result := true
 else
 begin
  if (aHeaderBegin <> #0) then
  begin
   l3StripHeader(aStream1, aHeaderBegin);
   l3StripHeader(aStream2, aHeaderBegin);
  end;//aHeaderBegin <> #0
  Result := false;
  if (aStream1 <> nil) AND (aStream2 <> nil) then
  begin
   l_Size := aStream1.Size - aStream1.Position;
   if (l_Size = aStream2.Size - aStream2.Position) then
   begin
    if (l_Size > 0) then
    begin
     l_Size := Min(l_Size, l3ParseBufSize);
     l3System.GetLocalMem(l_Buff1, l_Size);
     try
      l3System.GetLocalMem(l_Buff2, l_Size);
      try
       while true do
       begin
        l_Read := aStream1.Read(l_Buff1^, l_Size);
        if (l_Read <> aStream2.Read(l_Buff2^, l_Size)) then
         Exit; // - что-то не то с длинной
        if (l_Read = 0) then
        begin
         // - закончили читать
         Result := true;
         break;
        end;//l_Read = 0
        if not CompareMem(l_Buff1, l_Buff2, l_Size) then
         break;
         // - содержимое различается
       end;//while true
      finally
       l3System.FreeLocalMem(l_Buff2);
      end;//try..finally
     finally
      l3System.FreeLocalMem(l_Buff1);
     end;//try..finally
    end//l_Size > 0
    else
     Result := true;
   end;//l_Size = aStream2.Size
  end;//aStream1 <> nil
 end;//aStream1 = aStream2
end;

function l3CompareFiles(const aStream1, aStream2: String; aHeaderBegin : AnsiChar = #0): Bool;
 {* - сравнивает побайтово два файла. }
var
 l_S1 : TStream;
 l_S2 : TStream;
begin
 l_S1 := Tl3TextStream.Create(aStream1, l3_fmRead);
 try
  l_S2 := Tl3TextStream.Create(aStream2, l3_fmRead);
  try
   Result := l3CompareStreams(l_S1, l_S2, aHeaderBegin);
  finally
   FreeAndNil(l_S2);
  end;//try..finally
 finally
  FreeAndNil(l_S1);
 end;//try..finally
end;

procedure l3CatFiles(const aTo, aFrom: String;
                     const aStartDelim : String = '';
                     const aFinishDelim : String = '');
 {* - складывает два файла. }
var
 l_To : Tl3CustomDOSFiler;
 l_From : Tl3CustomDOSFiler;
begin
 l_To := Tl3CustomDOSFiler.Make(aTo, l3_fmAppend, false);
 try
  l_From := Tl3CustomDOSFiler.Make(aFrom, l3_fmRead, false);
  try
   l_From.Open;
   try
    if not l_From.EOF then
    begin
     l_To.Open;
     try
      if (aStartDelim <> '') then
       l_To.WriteLn(aStartDelim);
      while not l_From.EOF do
      begin
       with l_From.ReadLn do
        l_To.Write(S, SLen);
       if not l_From.EOF then
        l_To.OutEOL;
      end;//while not l_From.EOF
      if (aFinishDelim <> '') then
       l_To.WriteLn(aFinishDelim);
     finally
      l_To.Close;
     end;//try..finally
    end;//not l_From.EOF
   finally
    l_From.Close;
   end;//try..finally
  finally
   FreeAndNil(l_From);
  end;//try..finally
 finally
  FreeAndNil(l_To);
 end;//try..finally
end;

// start class Tl3NamedTextStream

constructor Tl3NamedTextStream.Create(const Filename : String;
                                      aMode          : Tl3FileMode;
                                      aTimeOut       : Longword = Cl3FileStreamDefaultTimeOut);
  //override;
  {* - создает текстовый поток для файла. }
begin
 inherited;
 f_FileName := FileName;
end;

end.

