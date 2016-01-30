unit l3Memory;
{* Объекты, классы и функции для работы с памятью. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Memory -                  }
{ Начат: 20.10.1998 17:24             }
{ $Id: l3Memory.pas,v 1.117 2014/04/23 11:13:54 lulin Exp $ }

// $Log: l3Memory.pas,v $
// Revision 1.117  2014/04/23 11:13:54  lulin
// - переходим от интерфейсов к объектам.
//
// Revision 1.116  2014/03/12 11:45:41  lulin
// - выделяем базового предка.
//
// Revision 1.115  2014/02/24 13:38:29  lulin
// {RequestLink:518433323}
//
// Revision 1.114  2014/02/21 16:28:30  lulin
// - избавляемся от обёрток над тегами.
//
// Revision 1.113  2013/07/10 15:06:08  lulin
// - рисуем на модели работу с памятью.
//
// Revision 1.112  2013/07/10 12:17:27  lulin
// - чистим код.
//
// Revision 1.111  2013/07/08 16:43:15  lulin
// - выделяем работу с размером куска памяти.
//
// Revision 1.110  2013/07/08 15:12:56  lulin
// - готовимся к переезду кода.
//
// Revision 1.109  2013/06/28 13:52:03  lulin
// - возвращаем заточку для совсем маленьких блоков.
//
// Revision 1.108  2013/04/10 11:27:02  lulin
// - портируем.
// - и поправил ошибку с проездом по памяти.
//
// Revision 1.107  2013/04/08 18:10:29  lulin
// - пытаемся отладиться под XE.
//
// Revision 1.106  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.105  2013/04/03 15:03:20  lulin
// - портируем.
//
// Revision 1.104  2013/04/03 13:57:34  lulin
// - портируем.
//
// Revision 1.103  2013/03/28 15:09:44  lulin
// - портируем.
//
// Revision 1.102  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.101  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.100  2012/11/01 07:09:29  lulin
// - вычищаем мусор.
//
// Revision 1.99  2012/01/11 18:54:10  lulin
// {RequestLink:326769483}
// - делаем методы для распределения элементов, заполненных нулями.
//
// Revision 1.98  2012/01/11 18:03:05  lulin
// {RequestLink:326769483}
// - чистка кода.
//
// Revision 1.97  2010/02/24 16:38:14  lulin
// [$173933708].
//
// Revision 1.96  2010/02/10 19:16:59  lulin
// {RequestLink:186352297}.
//
// Revision 1.95  2009/12/22 11:58:47  lulin
// {RequestLink:174719000}.
//
// Revision 1.94  2009/12/16 11:26:02  lulin
// - убираем ненужный метод.
//
// Revision 1.93  2009/12/15 12:54:00  lulin
// - пул памяти наследуем от более простого контейнера.
//
// Revision 1.91  2009/09/11 08:26:06  voba
// - bug fix: лишнее перевыделение памяти
//
// Revision 1.90  2009/09/07 10:28:45  voba
// - opt. Tl3BufferStreamMemoryPool - Стандартный буфер для буферизованных потоков
//
// Revision 1.89  2009/07/23 08:15:07  lulin
// - вычищаем ненужное использование процессора операций.
//
// Revision 1.88  2009/07/22 13:24:06  lulin
// {RequestLink:157909311}.
//
// Revision 1.87  2009/07/21 12:24:40  lulin
// {RequestLink:141264340}. №35.
//
// Revision 1.86  2009/07/20 11:22:19  lulin
// - заставляем работать F1 после - {RequestLink:141264340}. №7, 32, 33.
//
// Revision 1.85  2009/07/15 12:33:59  lulin
// - не выравниваем очень маленькие размеры локальной памяти.
//
// Revision 1.84  2008/12/12 19:19:30  lulin
// - <K>: 129762414.
//
// Revision 1.83  2008/05/08 14:04:17  fireton
// - перенос объектов в потоках из ветки
//
// Revision 1.82  2008/02/21 13:21:25  lulin
// - упрощаем наследование.
//
// Revision 1.81  2008/02/21 10:55:15  lulin
// - упрощаем наследование.
//
// Revision 1.80  2008/02/20 10:47:13  lulin
// - удалена ненужная базовая функция очистки.
//
// Revision 1.79  2008/02/15 13:22:43  lulin
// - <TDN>: 79.
//
// Revision 1.78  2007/08/28 11:12:16  lulin
// - избавляемся от _Case.
//
// Revision 1.77  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.76  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.75  2007/04/05 07:59:26  lulin
// - избавляемся от лишних преобразований строк при записи в настройки.
//
// Revision 1.74  2007/03/27 11:56:27  lulin
// - запрещаем писать в строку нулевой символ (CQ OIT5-24758).
//
// Revision 1.73  2007/02/02 13:23:42  lulin
// - упрощаем преобразование строк.
//
// Revision 1.72  2006/12/10 14:51:46  lulin
// - для работы с картинками используем свой менеджер памяти.
//
// Revision 1.71  2006/12/10 12:59:48  lulin
// - cleanup.
//
// Revision 1.70  2006/12/10 12:48:41  lulin
// - оптимизируем распределение памяти для маленьких кусочков.
//
// Revision 1.69  2006/12/10 12:03:11  lulin
// - cleanup.
//
// Revision 1.68  2006/05/06 06:41:25  lulin
// - cleanup.
//
// Revision 1.67  2006/04/25 12:47:50  lulin
// - cleanup.
//
// Revision 1.66  2006/01/25 08:19:44  lulin
// - cleanup.
//
// Revision 1.65  2006/01/04 15:35:02  lulin
// - cleanup.
//
// Revision 1.64  2005/10/26 09:55:13  lulin
// - cleanup.
//
// Revision 1.63  2005/10/21 06:11:57  lulin
// - bug fix: один пул памяти не присваивался другому - в результате не вставлялись картинки в комментарии пользователя.
//
// Revision 1.62  2004/12/14 16:47:04  lulin
// - print-preview списка перетащил на свой механизм.
//
// Revision 1.61  2004/10/20 10:51:08  lulin
// - new behavior: используем FreeMem напрямую, а не ReallocMem - когда NewSize = 0.
//
// Revision 1.60  2004/09/15 11:09:29  lulin
// - Tl3Stream переведен на "шаблон" l3Unknown.
//
// Revision 1.59  2004/08/05 17:40:31  law
// - избавился от ряда Warning'ов и Hint'ов.
//
// Revision 1.58  2004/08/03 12:51:51  law
// - new behavior: в Tl3CustomMemoryStream.Seek добавлен Assert - для контроля правильности позиции потока.
//
// Revision 1.57  2004/06/17 15:59:02  law
// - свойство Empty переместилось с класса _Tl3Base на класс _Tl3SomeDataContainer.
//
// Revision 1.56  2004/05/28 15:43:37  law
// - cleanup.
//
// Revision 1.55  2004/05/27 14:32:14  law
// - new methods: _Tl3_CBase.IsCacheable, _NeedStoreInPool.
//
// Revision 1.54  2004/05/27 13:48:00  law
// - new behavior: при уменьшении длины строки не перераспределяем память - во избежании дефрагментации памяти.
//
// Revision 1.53  2004/05/27 08:48:41  fireton
// - bug fix: Tl3StringStream генерил AV при пустой строке при получении длины потока
//
// Revision 1.52  2004/05/11 15:37:46  law
// - bug fix: более правильно забираем/вставляем cf_UnicodeText.
//
// Revision 1.51  2003/06/23 11:21:24  law
// - bug fix: в прошлую правку случайно выкинул реализацию Tl3SizedMemoryPool._Clear.
//
// Revision 1.50  2003/06/23 11:18:51  law
// - bug fix: Tl3SizedMemoryPool не сбрасывал размер при попадании в кеш.
//
// Revision 1.49  2003/03/13 16:37:21  law
// - change: попытка портировать на Builder.
//
// Revision 1.48  2003/02/04 10:30:46  law
// - cleanup: переходим к IUnknown вместо TObject.
//
// Revision 1.47  2002/09/26 14:30:06  law
// - cleanup.
//
// Revision 1.46  2002/05/14 08:37:32  law
// - new methods: Tl3VList: LoadFromStream, LoadFromFile, SaveToStream, SaveToFile.
//
// Revision 1.45  2002/04/09 10:57:32  narry
// - bug fix: утечка памяти при распределении блоков большего размера, чем размер элемента цепочки.
//
// Revision 1.44  2002/04/02 13:54:00  law
// - new method: Tl3MemoryChain._AllocItem.
//
// Revision 1.43  2002/02/26 15:48:08  law
// - optimization: попытка оптимизации путем уменьшения фрагментации выделяемой памяти.
//
// Revision 1.42  2002/01/10 10:06:23  law
// - bug fix: потенциальный RangeCheck при определении размера выделенной памяти.
//
// Revision 1.41  2001/12/27 15:03:33  law
// - new constructors: добавлены два конструктора Tl3String._Make.
//
// Revision 1.40  2001/12/14 15:24:51  law
// - new constructor: Tl3StringStream.Create.
//
// Revision 1.39  2001/11/29 16:39:11  law
// - new method: еще одна версия процедуры _AllocItem.
//
// Revision 1.38  2001/11/02 15:11:19  law
// - change.
//
// Revision 1.37  2001/11/02 08:06:16  law
// - new proc: l3NewMemoryChain.
//
// Revision 1.36  2001/11/02 07:38:42  law
// - new behavior: теперь Tl3MemoryChain сам проверяет размер выделяемого куска.
//
// Revision 1.35  2001/11/01 17:56:01  law
// - new object: Tl3MemoryChain.
//
// Revision 1.34  2001/08/31 08:50:08  law
// - cleanup: первые шаги к кроссплатформенности.
//
// Revision 1.33  2001/08/30 16:34:38  law
// - new version: портировал на Delphi 6.
//
// Revision 1.32  2001/08/29 07:01:10  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//
// Revision 1.31  2001/06/22 09:24:18  law
// - new behavior: переопределен метод GetEmpty.
//
// Revision 1.30  2001/06/19 09:28:00  law
// - cleanup.
//
// Revision 1.29  2001/06/19 08:46:27  law
// - change visibility: свойство Tl3SizedMemoryPool._f_Size теперь protected.
//
// Revision 1.28  2001/06/19 08:18:00  law
// - comments: xHelpGen.
//
// Revision 1.27  2001/04/18 13:25:24  law
// - comments: добавлены комментарии для xHelpGen.
//
// Revision 1.26  2001/04/12 13:16:47  law
// - new method: классу Tl3MemoryPool добавлен конструктор _Make.
//
// Revision 1.25  2001/04/05 11:49:47  law
// - cleanup: убраны функции поддержки 16-ти битной платформы.
//
// Revision 1.24  2001/04/03 12:55:27  law
// - cleanup: убраны ненужные классы исключительных ситуаций.
//
// Revision 1.23  2001/02/01 14:18:27  law
// - добавлена возможность подмены функции вычисления размера куска пямяти.
//
// Revision 1.22  2000/12/20 10:18:10  law
// - bug fix: working with clipboard.
//
// Revision 1.21  2000/12/19 15:52:40  law
// - убраны ненужные директивы компиляции.
//
// Revision 1.20  2000/12/15 15:19:01  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  Windows,
  Classes,
  l3Interfaces,
  l3Types,
  l3IID,
  l3InternalInterfaces,
  l3SimpleDataContainer,
  l3CustomString,
  l3BaseStream,
  l3ProtoObject,
  l3ProtoDataContainerWithCOMQI,
  l3PtrLoc,
  l3Variant
  ;

type
  Tl3Ptr = packed object
    private
    // internal fields
      P : Tl3PtrRec;
    protected
    // property methods
      function  pm_GetAsHandle: THandle;
      procedure pm_SetAsHandle(Value: THandle);
        {-}
      function  pm_GetAsPointer: PAnsiChar;
      procedure pm_SetAsPointer(Value: PAnsiChar);
        {-}
    public
    // public methods
      procedure Init(Size: Long);
        {-}
      function  GetSize: Long;
        {-}
      procedure SetSizeEx(aNewSize: Long; aGlobal: Bool);
        {-}
      procedure SetSize(aNewSize: Long);
        {-}
      procedure WritePtr(const Source: Tl3Ptr; Count: Long);
        {-}
      procedure Clear;
        {-}
      function  ReleaseHandle: THandle;
        {-}
      function  Read(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
        {-}
      function  Write(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
        {-}
    public
    // public properties
      property AsHandle: THandle
        read pm_GetAsHandle
        write pm_SetAsHandle;
        {-}
      property AsPointer: PAnsiChar
        read pm_GetAsPointer
        write pm_SetAsPointer;
        {-}
  end;//Tl3Ptr

  Rl3MemoryPoolAdapter = class of Tl3MemoryPoolAdapter;
  Rl3MemoryStream = class of Tl3MemoryStream;

{$M+}
  Tl3MemoryPoolPrim = class(Tl3Variant, IUnknown)
   {* Кусок памяти. }
    private
    // internal fields
      f_Ptr: Tl3Ptr;
    protected
    // property methods
      function  pm_GetSize: Long;
        virtual;
      procedure pm_SetSize(NewSize: Long);
        virtual;
        {-}
      function  pm_GetAsHandle: THandle;
      procedure pm_SetAsHandle(Value: THandle);
        {-}
      function  GetEmpty: Bool;
        override;
        {-}
    protected
    // internal methods
      procedure Release;
        override;
        {-}
      function GetMemoryPoolAdapterClass: Rl3MemoryPoolAdapter; virtual;
      function GetMemoryStreamClass: Rl3MemoryStream; virtual;
    public
    // public methods
      constructor Make(aHandle: THandle); overload;
        {-}
      function  AsPointer: PAnsiChar;
        {* - локальный указатель на начало куска. }
      function  ReleaseHandle: THandle;
        {-}
      function  Read(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
        virtual;
        {* - считать данные в Buf. }
      function  Write(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
        virtual;
        {* - записать данные из Buf. }
      function COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        override;
        {-}
      class function IsCacheable: Bool;
        override;
        {-}
      procedure Assign(aP: Tl3MemoryPoolPrim);
        {-}
    public
    // public properties
      property Size: Long
        read pm_GetSize
        write pm_SetSize;
        {* - размер куска памяти. }
      property AsHandle: THandle
        read pm_GetAsHandle
        write pm_SetAsHandle;
        {* - глобальный указатель на кусок памяти. }
  end;//Tl3MemoryPool
{$M-}

  Tl3MemoryPool = class(Tl3MemoryPoolPrim)
   {* Кусок памяти. Чистит память в Cleanup}
  protected
   procedure Cleanup;
        override;
        {-}
  end;//Tl3MemoryPool

  Tl3BufferStreamMemoryPool = class(Tl3MemoryPoolPrim)
   {* Кусок памяти для Tl3BufferStream}
    protected
    // property methods
      procedure pm_SetSize(NewSize: Long);
        override;
        {-}
      procedure InitFields;
        override;
        {-}
  end;//Tl3BufferStreamMemoryPool

  Tl3SizedMemoryPool = class(Tl3MemoryPool)
   {* Кусок памяти с точным настраиваемым размером. }
    protected
    // internal fields
      f_Size : Long;
    protected
    // property methods
      function  pm_GetSize: Long;
        override;
      procedure pm_SetSize(NewSize: Long);
        override;
        {-}
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
(*      procedure Clear;
        override;
        {-}*)
      function  Read(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
        override;
        {-считать данные в Buf}
      function  Write(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
        override;
        {-записать данные из Buf}
  end;//Tl3SizedMemoryPool

  Tl3MemoryPoolAdapter = class(Tl3ProtoObject,
                               Il3MemoryPool,
                               Il3HandleMemoryPool)
    private
    // internal fields
      f_Pool : Tl3MemoryPoolPrim;
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
      // Il3MemoryPool
      function  pm_GetSize: Long;
      procedure pm_SetSize(NewSize: Long);
        {-}
      // Il3HandleMemoryPool
      function AsHandle: THandle;
        {-}
      function  ReleaseHandle: THandle;
        {-}
     public
     // public methods
       constructor Create(aPool: Tl3MemoryPoolPrim);
         {-}
  end;//Tl3MemoryPoolAdapter

  Tl3CustomMemoryStream = class(Tl3Stream)
   {* Базовый класс потоков в памяти. }
    protected
    // property fields
      f_Position   : Long;
    protected
    // property methods
      function  pm_GetSize: Long;
        virtual;
        abstract;
      procedure pm_SetSize(Value: Long);
        {-}
    public
    // public methods
      function Seek(Offset: Longint; Origin: Word): Longint;
        override;
        {-}
    public
    // public properties
      property Size: Long
        read pm_GetSize
        write pm_SetSize;
        {* - размер потока. }
  end;//Tl3CustomMemoryStream

  Tl3StringStream = class(Tl3CustomMemoryStream)
   {* Поток связанный со строкой Tl3CustomString. }
    private
    // internal fields
      f_String : Tl3CustomString;
    protected
    // property methods
      function  pm_GetSize: Long;
        override;
      procedure SetSize(NewSize: Long);
        override;
        {-}
      procedure pm_SetString(Value: Tl3CustomString);
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(anOwner: Tl3CustomString = nil);
        reintroduce;
        overload;
        {-}
      constructor Create(const aString: Tl3WString);
        overload;
        {-}
      class function Make(const aString: Tl3WString): IStream;
        reintroduce;
        overload;
        {-}
      class function Make(aString: Tl3CustomString): IStream;
        overload;
        {-}
      function Read(var Buffer; Count: Longint): Longint;
        override;
        {-}
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
      function COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        override;
        {-}
    public
    // public properties
      property _String: Tl3CustomString
        read f_String
        write pm_SetString;
        {-}
  end;//Tl3StringStream

  Tl3MemoryStream = class(Tl3CustomMemoryStream)
   {* Поток в памяти. }
    protected
    // property fields
      f_MemoryPool : Tl3MemoryPoolPrim;
      f_Sharp      : Bool;
    protected
    // property methods
      function pm_GetMemoryPool: Tl3MemoryPoolPrim;
      procedure pm_SetMemoryPool(Value: Tl3MemoryPoolPrim);
        {-}
      function  pm_GetSize: Long;
        override;
      procedure SetSize(NewSize: Long);
        override;
        {-}
    protected
    // property methods
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(anOwner: TObject = nil);
        reintroduce;
        {-}
      constructor Make(aSharp: Bool = true);
        {-}
      function Read(var Buffer; Count: Longint): Longint;
        override;
        {-}
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
      function COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        override;
        {-}
    public
    // public properties
      property MemoryPool: Tl3MemoryPoolPrim
        read pm_GetMemoryPool
        write pm_SetMemoryPool;
        {* - кусок памяти с которым связан данный поток. }
  end;//Tl3MemoryStream

  Tl3ConstMemoryStream = class(Tl3CustomMemoryStream)
   {* Константный поток в памяти (без перераспределения памяти). }
    protected
    // property fields
      f_Memory : Pointer;
      f_Size   : Long;
    protected
    // property methods
      function  pm_GetSize: Long;
        override;
      procedure SetSize(NewSize: Long);
        override;
        {-}
    public
    // public methods
      constructor Create(aMemory: Pointer; aSize: Long);
        //virtual;
        {-}
      function Read(var Buffer; Count: Longint): Longint;
        override;
        {-}
      function Write(const Buffer; Count: Longint): Longint;
        override;
        {-}
    public
    // public properties
      property Memory: Pointer
        read f_Memory
        write f_Memory;
        {-}
  end;//Tl3ConstMemoryStream

  Tl3HMemoryStream = class(Tl3ConstMemoryStream)
   {* Константный поток в глобальной памяти (без перераспределения памяти). }
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(Handle: THandle);
        reintroduce;
        virtual;
        {-}
  end;//Tl3HMemoryStream

  Tl3HPCharStream = class(Tl3HMemoryStream)
   {* Константный поток в глобальной памяти оканчивающийся нулем (#0). }
    public
    // public methods
      constructor Create(Handle: THandle);
        override;
        {-}
  end;//Tl3HPCharStream

  Tl3HPWideCharStream = class(Tl3HMemoryStream)
   {* Константный поток в глобальной памяти оканчивающийся нулем (#0) в кодировке Unicode. }
    public
    // public methods
      constructor Create(Handle: THandle);
        override;
        {-}
  end;//Tl3HPWideCharStream

  Tl3MemorySizeFunc = function(aP: Pointer): Long;
   {* - прототип функции для получения размера куска памяти. }

type
  Tl3MemoryChain = object
   {* Цепочка блоков памяти одинакового размера. }
    private
    // internal fields
      f_Head     : Pointer;
      f_Size     : Long;
      f_RealSize : Long;
    public
    // public methods
      procedure Init(aSize: Long);
        {* - инициализирует цепочку. }
      procedure Clear;
        {* - очищает цепочку. }
      procedure AllocItem(out theItem: Pointer);
        overload;
        {* - распределяет элемент. }
      procedure AllocItem(out theItem: Pointer; aSize: Long);
        overload;
        {* - распределяет элемент с заданным размером. }
      procedure AllocItemZ(out theItem: Pointer);
        overload;
        {* - распределяет элемент. И чистит его. }
      procedure AllocItemZ(out theItem: Pointer; aSize: Long);
        overload;
        {* - распределяет элемент с заданным размером. И чистит его. }
      procedure AllocItem(out theItem : Pointer;
                          aSize       : Long;
                          aFill       : Pointer;
                          aFillSize   : Long);
        overload;
        {* - распределяет элемент с заданным размером. И заполняет его данными. }
      procedure AllocItem(out theItem : Pointer;
                          aSize       : Long;
                          aFill       : Byte);
        overload;
        {* - распределяет элемент с заданным размером. И заполняет его символами. }
      procedure FreeItem(var anItem: Pointer);
        {* - освобождает элемент. }
    public
    // public properties
      property Size: Long
        read f_Size;
        {-}
      property RealSize: Long
        read f_RealSize;
        {-}  
  end;//Tl3MemoryChain
  Pl3MemoryChain = ^Tl3MemoryChain;

  Pl3LinkedMemoryChain = ^Tl3LinkedMemoryChain;
  Tl3LinkedMemoryChain = object(Tl3MemoryChain)
    private
    // internal fields
      f_Next : Pl3LinkedMemoryChain;
  end;//Tl3LinkedMemoryChain

function l3NewMemoryChain(aSize: Long): Pl3MemoryChain;
  {* - распределяет новую цепочку блоков памяти. }

implementation

uses
  SysUtils,

  l3Base,
  l3MinMax,
  l3Chars,

  l3MemorySizeUtils
  ;

// start object Tl3Ptr 

procedure Tl3Ptr.Init(Size: Long);
  {-}
begin
 P.Flag := l3_mfNil;
 SetSize(Size);
end;

{$IfNDef XE}
function SzNil: Long;
  register;
asm
   xor     eax, eax
end;

function SzSmall: Long;
  register;
asm
   mov     eax, Type(Pointer)
end;

function SzLocal: Long;
  register;
asm
   inc     eax
   jmp     Tl3PtrLoc.GetSize
end;

function SzGlobal: Long;
  register;
asm
   mov     eax, [eax + 1]
   push    eax
   call    GlobalSize
end;

type
  Tl3SizeFunc = function : Long;

const
  SizeFuncs : array [Tl3MemoryFlag] of Tl3SizeFunc =
   (SzNil, SzSmall, SzLocal, SzGlobal);
{$EndIf XE}

function Tl3Ptr.GetSize: Long;
  {-}
{$IfNDef XE}
  register;
asm
   xor     ecx, ecx
   mov     cl,  byte ptr [eax]
   mov     ecx, [ecx * Type(Tl3SizeFunc) + SizeFuncs]
   jmp     ecx
end;
{$Else XE}
begin
 Case P.Flag of
  l3_mfNil:
   Result:= 0;
  l3_mfSmall:
   Result := SizeOf(Pointer);
  l3_mfLocal:
   Result := Tl3PtrLoc(P.Ptr).GetSize;
  l3_mfGlobal:
   Result := GlobalSize(P.H);
  else
   Result := 0;
 end;//Case P.Flag
end;
{$EndIf XE}

{$IfNDef XE}
function PtNil: PAnsiChar;
  register;
asm
   xor     eax, eax
end;

function PtSmall: PAnsiChar;
  register;
asm
   inc     eax
end;

function PtLocal: PAnsiChar;
  register;
asm
   mov     eax, [eax + 1]
end;

function PtGlobal: PAnsiChar;
  register;
asm
   mov     eax, [eax + 1]
end;

type
  Tl3PtFunc = function : PAnsiChar;

const
  PtFuncs : array [Tl3MemoryFlag] of Tl3PtFunc =
   (PtNil, PtSmall, PtLocal, PtGlobal);
{$EndIf XE}

function Tl3Ptr.pm_GetAsPointer: PAnsiChar;
  {-}
{$IfNDef XE}
  register;
asm
   xor     ecx, ecx
   mov     cl,  byte ptr [eax]
   mov     ecx, [ecx * Type(Tl3PtFunc) + PtFuncs]
   jmp     ecx
end;
{$Else XE}
begin
 Case P.Flag of
  l3_mfNil:
   Result := nil;
  l3_mfSmall:
   Result := @P.Ptr;
  l3_mfLocal:
   Result := Tl3PtrLoc(P.Ptr).AsPointer;
  l3_mfGlobal:
   Result := Pointer(P.H);
  else
   Result := nil;
 end;//Case P.Flag
end;
{$EndIf XE}

procedure Tl3Ptr.SetSizeEx(aNewSize: Long; aGlobal: Bool);
  {-}

 procedure DoFree;
 begin
  Case P.Flag of
   l3_mfLocal  : Tl3PtrLoc(P.Ptr).Clear;
   l3_mfGlobal : l3System.GlobalFree(P.H);
  end;//Case P.Flag
  P.Flag := l3_mfNil;
 end;//DoFree

 procedure DoAlloc(var theNewP: Tl3Ptr);
 begin
  if aGlobal then
  begin
   theNewP.P.H := l3System.GlobalAlloc(gmem_Fixed, (aNewSize + $1F) and  $ffffffe0);
   if (theNewP.P.H = 0) then
    theNewP.P.Flag := l3_mfNil
   else
    theNewP.P.Flag := l3_mfGlobal;
  end//aGlobal
  else
  begin
   if (aNewSize = 0) then
    theNewP.P.Flag := l3_mfNil
   else
   {.$IfNDef XE}
   if (aNewSize <= SizeOf(Pointer)) then
    theNewP.P.Flag := l3_mfSmall
   else
   {.$EndIf XE}
   if Tl3PtrLoc(theNewP.P.Ptr).Init(aNewSize) then
    theNewP.P.Flag := l3_mfLocal
   else
    theNewP.P.Flag := l3_mfNil;
  end;//aGlobal
 end;

var
 l_OldSize : Long;
 l_NewP    : Tl3Ptr;
 OldGlobal : Bool;
begin
 l_OldSize := GetSize;
 OldGlobal := (P.Flag = l3_mfGlobal);
 if (l_OldSize <> aNewSize) OR (OldGlobal <> aGlobal) then
 begin
  if (aNewSize = 0) then
   DoFree {-освобождаем старую память}
  else
  begin
   if (l_OldSize = 0) then
    DoAlloc(Self)
   else
   begin

    l_NewP.P.Flag := l3_mfNil; {-пока ничего заново не распределено}

    if OldGlobal then
    begin
     if aGlobal then
     begin
      {пытаемся изменить размер глобальной памяти если это необходимо}
      l_NewP.P.H := l3System.GlobalRealloc(P.H, (aNewSize + $1F) and  $ffffffe0, gmem_Fixed);
      if (l_NewP.P.H <> 0) then
       l_NewP.P.Flag := l3_mfGlobal;
     end;//aGlobal
    end//OldGlobal
    else
    if not aGlobal then
    begin
     if (P.Flag = l3_mfSmall) then
     begin
      if (aNewSize <= SizeOf(Pointer)) then
       Exit;
     end//P.Flag = l3_mfSmall
     else
     begin
      Tl3PtrLoc(P.Ptr).SetSize(aNewSize);
      Exit;
     end;//P.Flag = l3_mfSmall
    end;//not aGlobal

    if (l_NewP.P.Flag = l3_mfNil) then
    begin
     DoAlloc(l_NewP);
     if (l_NewP.P.Flag = l3_mfNil) then
      OutOfMemoryError; {-не удалось распределить память}
     l_NewP.WritePtr(Self, Min(l_OldSize, aNewSize)); {-копируем старые данные}
     DoFree; {-освобождаем старую память}
    end;//l_NewP.Flag = l3_mfNil
    Self := l_NewP;

   end;//l_OldSize = 0
  end;//aNewSize = 0
 end;//l_OldSize <> aNewSize..
end;

procedure Tl3Ptr.SetSize(aNewSize: Long);
  {-}
begin
 SetSizeEx(aNewSize, (aNewSize > (High(Word) - 512)));
end;

procedure Tl3Ptr.WritePtr(const Source: Tl3Ptr; Count: Long);
  {-}
begin
 l3Move(Tl3Ptr(Source).AsPointer^, AsPointer^, Count);
end;

procedure Tl3Ptr.Clear;
  {-}
begin
 SetSize(0);
end;

procedure Tl3Ptr.pm_SetAsPointer(Value: PAnsiChar);
  {-}
begin
 Clear;
 if (Value = nil) then
  P.Flag := l3_mfNil
 else
 begin
  P.Flag := l3_mfLocal;
  P.Ptr := Value;
 end;//Value = 0
end;

function Tl3Ptr.pm_GetAsHandle: THandle;
  {-}
begin
 Case P.Flag of
  l3_mfNil:
   Result := 0;
  l3_mfSmall,
  l3_mfLocal:
  begin
   SetSizeEx((GetSize + $1F) and  $ffffffe0 , true);
   Result := P.H;
  end;//l3_mfLocal
  l3_mfGlobal:
   Result := P.H;
  else
   Result := 0;
 end;//Case P.Flag
end;

procedure Tl3Ptr.pm_SetAsHandle(Value: THandle);
  {-}
begin
 Clear;
 if (Value = 0) then
  P.Flag := l3_mfNil
 else
 begin
  P.Flag := l3_mfGlobal;
  P.H := Value;
 end;//Value = 0
end;

function Tl3Ptr.ReleaseHandle: THandle;
  {-}
begin
 Result := AsHandle;
 P.Flag := l3_mfNil;
end;

function Tl3Ptr.Read(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
  {-}
begin
 if (P.Flag = l3_mfNil) then
  Result := 0
 else
 begin
  Result := Min(GetSize - Ofs, BufSize);
  if (Result > 0) then
  begin
   if (P.Flag = l3_mfSmall) then
    l3Move((PAnsiChar(@P.Ptr) + Ofs)^, Buf^, Result)
   else
    l3Move((P.Ptr + Ofs)^, Buf^, Result)
  end//Result > 0
  else
   Result := 0;
 end;//P.Flag = l3_mfNil
end;

function Tl3Ptr.Write(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
  {-}
var
 OldSize : Long;
 NewSize : Long;
begin
 OldSize := GetSize;
 NewSize := Ofs + BufSize;
 if (NewSize > OldSize) then
  SetSize(NewSize);
 if (P.Flag = l3_mfNil) then
  Result := 0
 else
 begin
  Result := BufSize;
  if (P.Flag = l3_mfSmall) then
   l3Move(Buf^, (PAnsiChar(@P.Ptr) + Ofs)^, Result)
  else
   l3Move(Buf^, (P.Ptr + Ofs)^, Result);
 end;//P.Flag = l3_mfNil
end;

// start class Tl3MemoryPool

constructor Tl3MemoryPoolPrim.Make(aHandle: THandle);
  {-}
begin
 Create;
 AsHandle := aHandle;
end;

procedure Tl3MemoryPoolPrim.Release;
  {override;}
  {-}
begin
 f_Ptr.Clear;
 inherited;
end;

function Tl3MemoryPoolPrim.AsPointer: PAnsiChar;
  {-}
begin
 Result := f_Ptr.AsPointer;
end;

function Tl3MemoryPoolPrim.pm_GetAsHandle: THandle;
  {-}
begin
 Result := f_Ptr.AsHandle;
end;

procedure Tl3MemoryPoolPrim.pm_SetAsHandle(Value: THandle);
  {-}
begin
 f_Ptr.AsHandle := Value;
end;

function Tl3MemoryPoolPrim.GetEmpty: Bool;
  //override;
  {-}
begin
 Result := (Size <= 0);
end;

function Tl3MemoryPoolPrim.ReleaseHandle: THandle;
  {-}
begin
 Result := f_Ptr.ReleaseHandle;
end;

function Tl3MemoryPoolPrim.Read(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
  {-}
begin
 Result := f_Ptr.Read(Ofs, Buf, BufSize);
end;

function Tl3MemoryPoolPrim.Write(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
  {-}
begin
 Result := f_Ptr.Write(Ofs, Buf, BufSize);
end;

function Tl3MemoryPoolPrim.GetMemoryPoolAdapterClass: Rl3MemoryPoolAdapter;
begin
 Result := Tl3MemoryPoolAdapter;
end;

function Tl3MemoryPoolPrim.GetMemoryStreamClass: Rl3MemoryStream;
begin
 Result := Tl3MemoryStream;
end;

function Tl3MemoryPoolPrim.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  {override;}
  {-}
var
 l_Stream : Tl3MemoryStream;
begin
 Result.SetOk;
 if IID.EQ(Il3MemoryPool) then
  Pointer(Obj) := Pointer(Il3MemoryPool(GetMemoryPoolAdapterClass.Create(Self)))
 else
 if IID.EQ(Il3HandleMemoryPool) then
  Pointer(Obj) := Pointer(Il3HandleMemoryPool(GetMemoryPoolAdapterClass.Create(Self)))
 else
 if IID.EQ(IStream) then
 begin
  l_Stream := GetMemoryStreamClass.Create(Self);
  try
   Result := Tl3HResult_C(l_Stream.QueryInterface(IStream, Obj));
  finally
   l3Free(l_Stream);
  end;//try..finally
 end//IID.EQ(IStream)
 else
  Result := inherited COMQueryInterface(IID, Obj);
end;

class function Tl3MemoryPoolPrim.IsCacheable: Bool;
  {override;}
  {-}
begin
 Result := true;
end;

procedure Tl3MemoryPoolPrim.Assign(aP: Tl3MemoryPoolPrim);
  //override;
  {-}
begin
 Write(0, Tl3MemoryPoolPrim(aP).AsPointer, Tl3MemoryPoolPrim(aP).Size)
end;

function Tl3MemoryPoolPrim.pm_GetSize: Long;
  {-}
begin
 Result := f_Ptr.GetSize;
end;

procedure Tl3MemoryPoolPrim.pm_SetSize(NewSize: Long);
  {-}
begin
 f_Ptr.SetSize(NewSize);
end;

// start class Tl3MemoryPool

procedure Tl3MemoryPool.Cleanup;
  {override;}
  {-}
begin
 f_Ptr.Clear;
 inherited;
end;

// start class Tl3BufferStreamMemoryPool

procedure Tl3BufferStreamMemoryPool.InitFields;
  //override;
  {-}
const
 cBuffSize = 64*1024;
begin
 inherited;
 inherited pm_SetSize(cBuffSize);
end;

procedure Tl3BufferStreamMemoryPool.pm_SetSize(NewSize: Long);
begin
 Assert(false, 'Default value is 64k. Can not be changed');
 //inherited pm_SetSize(NewSize);
end;

// start class Tl3MemoryStream

constructor Tl3MemoryStream.Create(anOwner: TObject = nil);
  {override;}
  {-}
begin
 inherited Create;
 if (anOwner Is Tl3MemoryPoolPrim) then
  MemoryPool := Tl3MemoryPoolPrim(anOwner)
 else
  f_Sharp := true; 
end;

constructor Tl3MemoryStream.Make(aSharp: Bool = true);
  {-}
begin
 Create;
 f_Sharp := aSharp;
end;

function Tl3MemoryStream.pm_GetMemoryPool: Tl3MemoryPoolPrim;
  {-}
begin
 if (f_MemoryPool = nil) then
 begin
  if f_Sharp then
   f_MemoryPool := Tl3SizedMemoryPool.Create{(Self)}
  else
   f_MemoryPool := Tl3MemoryPoolPrim.Create{(Self)};
 end;//f_MemoryPool = nil
 Result := f_MemoryPool;
end;

procedure Tl3MemoryStream.pm_SetMemoryPool(Value: Tl3MemoryPoolPrim);
  {-}
begin
 if l3Set(f_MemoryPool, Value) then
  f_Sharp := (Value Is Tl3SizedMemoryPool);
end;

function  Tl3MemoryStream.pm_GetSize: Long;
  {override;}
  {-}
begin
 Result := MemoryPool.Size;
end;

procedure Tl3MemoryStream.SetSize(NewSize: Long);
  {override;}
  {-}
begin
 MemoryPool.Size := NewSize;
end;

procedure Tl3MemoryStream.Cleanup;
  {override;}
  {-}
begin
 MemoryPool := nil;
 inherited;
end;

function Tl3MemoryStream.Read(var Buffer; Count: Longint): Longint;
  {override;}
  {-}
begin
 if (f_MemoryPool = nil) then
  Result := 0
 else
  Result := f_MemoryPool.Read(f_Position, @Buffer, Count);
 Inc(f_Position, Result);
end;

function Tl3MemoryStream.Write(const Buffer; Count: Longint): Longint;
  {override;}
  {-}
var
 l_OldSize : Long;
 l_NewSize : Long;
 l_MemoryPool : Tl3MemoryPoolPrim;
begin
 l_MemoryPool := MemoryPool;
 if not f_Sharp then
 begin
  l_OldSize := l_MemoryPool.Size;
  l_NewSize := f_Position + Count;
  if (l_NewSize > l_OldSize) then
   l_MemoryPool.Size := l_NewSize + l_OldSize div 4;
 end;//not f_Sharp
 Result := l_MemoryPool.Write(f_Position, @Buffer, Count);
 Inc(f_Position, Result);
end;

function Tl3MemoryStream.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  {override;}
  {-}
begin
 if IID.SomeOf([Il3MemoryPool, Il3HandleMemoryPool]) then
 begin
  if Supports(MemoryPool, IID.IID, Obj) then
   Result.SetOk
 else
   Result.SetNoInterface;
 end//IID.SomeOf([Il3MemoryPool, Il3HandleMemoryPool])
 else
 begin
  Result := inherited COMQueryInterface(IID, Obj);
  if Result.Fail then
  begin
   if Supports(MemoryPool, IID.IID, Obj) then
    Result.SetOk
   else
    Result.SetNoInterface;
  end;//l3IFail(Result)
 end;//IID.SomeOf([Il3MemoryPool, Il3HandleMemoryPool])
end;

// start class Tl3ConstMemoryStream 

constructor Tl3ConstMemoryStream.Create(aMemory: Pointer; aSize: Long);
  {virtual;}
  {-}
begin
 inherited Create;
 f_Memory := aMemory;
 f_Size := aSize;
end;

function Tl3ConstMemoryStream.Read(var Buffer; Count: Longint): Longint;
  {override;}
var
 l_P : Pointer;
begin
 if (f_Memory <> nil) AND (f_Size > 0) AND (f_Position < f_Size) then
 begin
  l_P := PAnsiChar(f_Memory) + f_Position;
  Result := Min(f_Size-f_Position, Count);
  l3Move(l_P^, Buffer, Result);
  Inc(f_Position, Result);
 end//f_Memory <> nil
 else
  Result := 0;
end;

function Tl3ConstMemoryStream.Write(const Buffer; Count: Longint): Longint;
  {override;}
var
 l_P : Pointer;
begin
 if (f_Memory <> nil) AND (f_Size > 0) AND (f_Position < f_Size) then
 begin
  l_P := PAnsiChar(f_Memory) + f_Position;
  Result := Min(f_Size-f_Position, Count);
  l3Move(Buffer, l_P^, Result);
  Inc(f_Position, Result);
 end//f_Memory <> nil..
 else
  Result := 0;
end;

function Tl3ConstMemoryStream.pm_GetSize: Long;
  {override;}
  {-}
begin
 Result := f_Size;
end;

procedure Tl3ConstMemoryStream.SetSize(NewSize: Long);
  {override;}
  {-}
begin
 f_Size := NewSize;
end;

// start class Tl3CustomMemoryStream 

function Tl3CustomMemoryStream.Seek(Offset: Longint; Origin: Word): Longint;
  {override;}
  {-}
begin
 case Origin of
  0: f_Position := Offset;
  1: Inc(f_Position, Offset);
  2: f_Position := Size + Offset;
 end;//case Origin
 Result := f_Position;
 Assert((f_Position >= 0) AND (f_Position <= Size), 'Неправильная позиция потока');
end;

procedure Tl3CustomMemoryStream.pm_SetSize(Value: Long);
  {-}
begin
 SetSize(Value);
end;

// start class Tl3HMemoryStream 

constructor Tl3HMemoryStream.Create(Handle: THandle);
  {virtual;}
  {-}
begin
 inherited Create(GlobalLock(Handle), GlobalSize(Handle))
end;

procedure Tl3HMemoryStream.Cleanup;
  {override;}
  {-}
begin
 GlobalUnlock(GlobalHandle(f_Memory));
 inherited;
end;

// start class Tl3HPCharStream 

constructor Tl3HPCharStream.Create(Handle: THandle);
  {override;}
  {-}
var
 Sz : Long;
begin
 inherited Create(Handle);
 Sz := 0;
 while (Sz < f_Size) AND ((PAnsiChar(f_Memory) + Sz)^ <> #0) do
  Inc(Sz);
 f_Size := Sz * SizeOf(ANSIChar);
end;

// start class Tl3HPWideCharStream 

constructor Tl3HPWideCharStream.Create(Handle: THandle);
  {override;}
  {-}
var
 Sz : Long;
begin
 inherited Create(Handle);
 Sz := 0;
 while (Sz < f_Size) AND ((PWideChar(f_Memory) + Sz)^ <> #0) do
  Inc(Sz);
 f_Size := Sz * SizeOf(WideChar);
end;

// start class Tl3StringStream 

constructor Tl3StringStream.Create(anOwner: Tl3CustomString = nil);
  {override;}
  {-}
begin
 inherited Create;
 if (anOwner = nil) then
  f_String := Tl3String.Create
 else
  l3Set(f_String, anOwner);
end;

constructor Tl3StringStream.Create(const aString: Tl3WString);
  //overload;
  {-}
var
 l_String : Tl3String;
begin
 l_String := Tl3String.Make(aString);
 try
  Create(l_String);
 finally
  l3Free(l_String);
 end;//try..finally
end;

class function Tl3StringStream.Make(const aString: Tl3WString): IStream;
  //reintroduce;
  {-}
var
 l_S : Tl3StringStream;
begin
 l_S := Create(aString);
 try
  Result := l_S;
 finally
  l3Free(l_S);
 end;//try..finally
end;

class function Tl3StringStream.Make(aString: Tl3CustomString): IStream;
  //overload;
  {-}
var
 l_S : Tl3StringStream;
begin
 l_S := Create(aString);
 try
  Result := l_S;
 finally
  l3Free(l_S);
 end;//try..finally
end;

procedure Tl3StringStream.Cleanup;
  {override;}
  {-}
begin
 l3Free(f_String);
 inherited;
end;

function Tl3StringStream.pm_GetSize: Long;
  {override;}
  {-}
begin
 if f_String.Empty then
  Result := 0
 else
  Result := f_String.Len;
end;

procedure Tl3StringStream.SetSize(NewSize: Long);
  {override;}
  {-}
begin
 f_String.Len := NewSize;
end;

procedure Tl3StringStream.pm_SetString(Value: Tl3CustomString);
  {-}
begin
 if l3Set(f_String, Value) then
  f_Position := 0;
end;

function Tl3StringStream.Read(var Buffer; Count: Longint): Longint;
  {override;}
  {-}
begin
 Result := Min(Size - f_Position, Count);
 if (Result > 0) then
  l3Move(f_String.St[f_Position], Buffer, Result)
 else
  Result := 0;
 Inc(f_Position, Result);
end;

function Tl3StringStream.Write(const Buffer; Count: Longint): Longint;
  {override;}
  {-}
var
 OldSize, NewSize: Long;
begin
 if (@Buffer = @cc_NullVar) then
  Result := 0
 else
 begin
  OldSize := Size;
  NewSize := f_Position + Count;
  if (NewSize > OldSize) then Size := NewSize;
  Result := Count;
  l3Move(Buffer, f_String.St[f_Position], Result);
  Inc(f_Position, Result);
 end;//@Buffer = cc_NullVar
end;

function Tl3StringStream.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  {override;}
  {-}
begin
 if IID.SomeOf([Il3MemoryPool, Il3CString]) then
 begin
  if (f_String <> nil) AND l3IOk(f_String.QueryInterface(IID.IID, Obj)) then
   Result.SetOk
  else
   Result.SetNoInterface;
 end//IID.SomeOf([Il3MemoryPool, Il3CString])
 else
 begin
  Result := inherited COMQueryInterface(IID, Obj); 
  if Result.Fail then
  begin
  if (f_String <> nil) AND l3IOk(f_String.QueryInterface(IID.IID, Obj)) then
   Result.SetOk
  else
   Result.SetNoInterface;
  end;//l3IFail(Result)
 end;//IID.SomeOf([Il3MemoryPool, Il3CString])
end;

// start class Tl3MemoryPoolAdapter

constructor Tl3MemoryPoolAdapter.Create(aPool: Tl3MemoryPoolPrim);
  {-}
begin
 inherited Create;
 l3Set(f_Pool, aPool);
end;

procedure Tl3MemoryPoolAdapter.Cleanup;
  //override;
  {-}
begin
 FreeAndNil(f_Pool);
 inherited;
end;

function Tl3MemoryPoolAdapter.pm_GetSize: Long;
  {-}
begin
 Result := f_Pool.Size;
end;

procedure Tl3MemoryPoolAdapter.pm_SetSize(NewSize: Long);
  {-}
begin
 f_Pool.Size := NewSize;
end;

function Tl3MemoryPoolAdapter.AsHandle: THandle;
  {-}
begin
 Result := f_Pool.AsHandle;
end;

function Tl3MemoryPoolAdapter.ReleaseHandle: THandle;
  {-}
begin
 Result := f_Pool.ReleaseHandle;
end;

// start class Tl3SizedMemoryPool

function Tl3SizedMemoryPool.pm_GetSize: Long;
  //override;
begin
 Result := f_Size;
end;

procedure Tl3SizedMemoryPool.pm_SetSize(NewSize: Long);
  //override;
  {-}
begin
 f_Size := NewSize;
 inherited;
end;

function Tl3SizedMemoryPool.Read(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
  //override;
  {-считать данные в Buf}
begin
 if (Ofs + BufSize >= Size) then
  Result := inherited Read(Ofs, Buf, Size - Ofs)
 else
  Result := inherited Read(Ofs, Buf, BufSize);
end;

function Tl3SizedMemoryPool.Write(Ofs: Long; Buf: PAnsiChar; BufSize: Long): Long;
  //override;
  {-записать данные из Buf}
var
 l_NewSize : Long;
begin
 l_NewSize := Ofs + BufSize;
 if (l_NewSize > Size) then
  Size := l_NewSize;
 Result := inherited Write(Ofs, Buf, BufSize);
end;

procedure Tl3SizedMemoryPool.Cleanup;
  //override;
  {-}
begin
 f_Size := 0;
 inherited;
end;

(*procedure Tl3SizedMemoryPool.Clear;
  //override;
  {-}
begin
 f_Size := 0;
 inherited;
end;*)

// start object Tl3MemoryChain

procedure Tl3MemoryChain.Init(aSize: Long);
  {-}
var
 l_P : Pointer;
begin
 f_Head := nil;
 f_Size := aSize;
 AllocItem(l_P);
 try
  f_RealSize := l3MemorySize(l_P);
 finally
  FreeItem(l_P);
 end;//try..finally
end;

procedure Tl3MemoryChain.Clear;
  {* - очищает цепочку. }
var
 Prev : Pointer;
 Next : Pointer;
begin
 Prev := f_Head;
 while (Prev <> nil) do
 begin
  Next := PPointer(Prev)^;
  l3System.FreeLocalMem(Prev);
  Prev := Next;
 end;//Prev <> nil
 f_Head := nil;
end;

procedure Tl3MemoryChain.AllocItemZ(out theItem: Pointer);
  //overload;
  {* - распределяет элемент. И чистит его. }
begin
 AllocItem(theItem);
 Assert(theItem <> nil);
 l3FillChar(theItem^, l3MemorySize(theItem));
end;

procedure Tl3MemoryChain.AllocItemZ(out theItem: Pointer; aSize: Long);
  //overload;
  {* - распределяет элемент с заданным размером. И чистит его. }
begin
 AllocItem(theItem, aSize);
 Assert(theItem <> nil);
 l3FillChar(theItem^, l3MemorySize(theItem));
end;

procedure Tl3MemoryChain.AllocItem(out theItem: Pointer);
  {* - распределяет элемент. }
begin
 if (f_Head = nil) then
  l3System.GetLocalMem(theItem, f_Size)
 else
 begin
  theItem := f_Head;
  f_Head := PPointer(theItem)^;
 end;//f_Head = nil
end;

procedure Tl3MemoryChain.AllocItem(out theItem: Pointer; aSize: Long);
  {* - распределяет элемент с заданным размером. }
var
 l_Prev  : PPointer;
 l_Block : Pointer;
begin
 if (aSize <= f_RealSize) then
  AllocItem(theItem)
 else
 begin
  l_Prev := @f_Head;
  l_Block := f_Head;
  while (l_Block <> nil) do
  begin
   if (l3MemorySize(l_Block) >= aSize) then
   begin
    l_Prev^ := PPointer(l_Block)^;
    theItem := l_Block;
    Exit;
   end//l3MemorySize(l_Block) >= aSize
   else
   begin
    l_Prev := l_Block;
    l_Block := l_Prev^;
   end;//l3MemorySize(l_Block) >= aSize
  end;//while l_Block <> nil
  l3System.GetLocalMem(theItem, aSize);
 end;
end;

procedure Tl3MemoryChain.AllocItem(out theItem : Pointer;
                                   aSize       : Long;
                                   aFill       : Pointer;
                                   aFillSize   : Long);
  //overload;
  {* - распределяет элемент с заданным размером. И заполняет его данными. }
begin
 AllocItem(theItem, aSize);
 if (aFill = nil) then
  aFillSize := 0
 else
 begin
  aFillSize := Min(aSize, aFillSize);
  l3Move(aFill^, theItem^, aFillSize);
 end;//aFill = nil
 l3FillChar(PAnsiChar(theItem)[aFillSize], Max(0, aSize - aFillSize), 0);
end;

procedure Tl3MemoryChain.AllocItem(out theItem : Pointer;
                                   aSize       : Long;
                                   aFill       : Byte);
  //overload;
  {* - распределяет элемент с заданным размером. И заполняет его символами. }
begin
 AllocItem(theItem, aSize);
 l3FillChar(theItem^, aSize, aFill);
end;

procedure Tl3MemoryChain.FreeItem(var anItem: Pointer);
  {* - освобождает элемент. }
begin
 if (anItem <> nil) then
 begin
  if (l3MemorySize(anItem) >= f_RealSize) then
  begin
   PPointer(anItem)^ := f_Head;
   f_Head := anItem;
   anItem := nil;
  end//l3MemorySize(anItem) >= f_RealSize
  else
   l3System.FreeLocalMem(anItem);
 end;//anItem <> nil
end;

var
 g_MemoryChainHead : Pl3LinkedMemoryChain = nil;

function l3NewMemoryChain(aSize: Long): Pl3MemoryChain;
  {* - распределяет новую цепочку блоков памяти. }
begin
 Result := g_MemoryChainHead;
 while (Result <> nil) do
 begin
  if (Result^.Size = aSize) then
   Exit
  else
   Result := Pl3LinkedMemoryChain(Result)^.f_Next;
 end;//while (l_P <> nil)
 l3System.GetLocalMem(Result, SizeOf(Tl3LinkedMemoryChain));
 try
  with Pl3LinkedMemoryChain(Result)^ do
  begin
   Init(aSize);
   f_Next := g_MemoryChainHead;
  end;//with g_MemoryChainHead^
  g_MemoryChainHead := Pl3LinkedMemoryChain(Result);
 except
  l3System.FreeLocalMem(g_MemoryChainHead);
  raise;
 end;//try..except
end;

procedure l3FreeMemoryChains;
  {* - очищает цепочки блоков. }
var
 Prev : Pl3LinkedMemoryChain;
 Next : Pl3LinkedMemoryChain;
begin
 Prev := g_MemoryChainHead;
 while (Prev <> nil) do
 begin
  Next := Prev^.f_Next;
  Prev^.Clear;
  l3System.FreeLocalMem(Prev);
  Prev := Next;
 end;{Prev <> nil}
 g_MemoryChainHead := nil;
end;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3Memory.pas initialization enter'); {$EndIf}
  l3System.AddExitProc(l3FreeMemoryChains);

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3Memory.pas initialization leave'); {$EndIf}
end.
