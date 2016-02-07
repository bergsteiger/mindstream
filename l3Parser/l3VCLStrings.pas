unit l3VCLStrings;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3VCLStrings -              }
{ Начат: 29.12.2006 13:48             }
{ $Id: l3VCLStrings.pas,v 1.26 2013/03/28 17:25:05 lulin Exp $ }

// $Log: l3VCLStrings.pas,v $
// Revision 1.26  2013/03/28 17:25:05  lulin
// - портируем.
//
// Revision 1.25  2008/07/08 09:48:51  lulin
// - не перекладываем строки в ноды, а просто реализуем интерфейс ноды.
//
// Revision 1.24  2008/02/20 17:23:09  lulin
// - упрощаем строки.
//
// Revision 1.23  2008/02/12 19:32:36  lulin
// - избавляемся от универсальности списков.
//
// Revision 1.22  2008/02/06 11:44:42  lulin
// - список строк переехал в отдельный файл.
//
// Revision 1.21  2007/07/24 19:21:13  lulin
// - скомпилировался F1 с модулем l3Interfaces, сгенерированным с модели.
//
// Revision 1.20  2007/04/05 11:16:58  lulin
// - cleanup.
//
// Revision 1.19  2007/03/28 19:43:00  lulin
// - ЭлПаковский редактор переводим на строки с кодировкой.
//
// Revision 1.18  2007/03/27 14:27:39  lulin
// - используем кошерный список строк.
//
// Revision 1.17  2007/03/16 12:21:28  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.16  2007/03/01 08:53:59  lulin
// - cleanup.
//
// Revision 1.15  2007/03/01 08:39:52  lulin
// - не копируем данные строки, если их держит интерфейс строки.
//
// Revision 1.14  2007/02/28 18:50:55  lulin
// - используем полиморфизм базового класса строки, вместо приведения типа.
//
// Revision 1.13  2007/02/16 19:19:15  lulin
// - в выпадающих списках используем родной список строк.
//
// Revision 1.12  2007/02/13 14:46:11  lulin
// - cleanup.
//
// Revision 1.11  2007/02/13 09:34:42  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.10  2007/02/06 15:21:20  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.9  2007/02/05 15:02:32  lulin
// - добавляем возможность работать с элементами с кодировкой.
//
// Revision 1.8  2007/02/02 08:39:24  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.7  2006/12/29 14:35:00  lulin
// - копируем объект при копировании строки.
//
// Revision 1.6  2006/12/29 13:58:02  lulin
// - используем собственную реализацию списка строк.
//
// Revision 1.5  2006/12/29 13:09:27  lulin
// - реализуем интерфейс расширенного списка строк.
//
// Revision 1.4  2006/12/29 12:11:00  lulin
// - реализуем хранение объектов, связанных со строками.
//
// Revision 1.3  2006/12/29 12:03:46  lulin
// - реализуем интерфейс списка строк.
//
// Revision 1.2  2006/12/29 11:52:32  lulin
// - выделена базовая реализация списка VCL-ных строк.
//
// Revision 1.1  2006/12/29 10:57:59  lulin
// - начал работать над "родной" реализацией VCL-ных строк.
//

{$Include l3Define.inc }

interface

uses
  Classes,
  
  l3Interfaces,
  l3Base,
  l3StringList,
  l3VCLStringsItems
  ;

type
  Tl3CustomStrings = class;
  
  Tl3StringsItems = class(Tl3VCLStringsItems)
    private
    // property fields
      f_Strings : Tl3CustomStrings;
    protected
    // internal methods
      procedure Clear;
        override;
        {-}
      procedure Insert(Index: Integer; const S: String);
        override;
        {-}
      function  Get(Index: Integer): String;
        override;
        {-}
      procedure Put(Index: Integer; const S: String);
        override;
        {-}
      function  GetCount: Integer;
        override;
        {-}
      function  GetObject(Index: Integer): TObject;
        override;
        {-}
      procedure PutObject(Index: Integer; aObject: TObject);
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(aStrings: Tl3CustomStrings);
        reintroduce;
        {-}
  end;//Tl3StringsItems
  Rl3StringsItems = class of Tl3StringsItems;

  Tl3CustomStrings = class(Tl3StringList, Il3Strings, Il3StringsEx)
    protected
    // interface methods
      // Il3Strings
      function  Get_Items: TStrings;
        virtual;
        {-}
      // Il3StringsEx
      procedure Set_Items(aValue: TStrings);
        {-}
      function  Get_Count: Integer;
        {-}
      function  Get_Item(Index: Integer): AnsiString;
        {-}
      procedure Set_Item(Index: Integer; const S: AnsiString);
        {-}
      function  Get_Objects(anIndex: Integer): TObject;
        {-}
      procedure Set_Objects(anIndex: Integer; anObject: TObject);
        {-}
      function  EQ(const aStrings: Il3StringsEx): Boolean;
        {-}
      procedure Assign(aStrings: TStrings);
        reintroduce;
        overload;
        {-}
    protected
    // internal methods
      //function  pm_GetDuplicates: TDuplicates;
      procedure pm_SetDuplicates(Value: TDuplicates);
        reintroduce;
        {-}
      function  ItemsClass: Rl3StringsItems;
        virtual;
        {-}
      function  StringItemClass: Rl3String;
        override;
        {-}
      function  CStrToItem(const aStr: Il3CString): Tl3CustomString;
        override;
        {-}
      procedure ReadData(Reader: TReader);
        {-}
      procedure WriteData(Writer: TWriter);
        {-}
      procedure DefineProperties(Filer: TFiler);
        override;
        {-}
    public
    // public methods
      class function Make: Il3StringsEx;
        reintroduce;
        {-}
      procedure BeginUpdate;
        {-}
      procedure EndUpdate;
        {-}
      procedure Assign(const aStrings: Il3StringsEx);
        reintroduce;
        overload;
        {-}
      function  AddObject(const aStr: AnsiString; anObject: TObject): Integer;
        overload;
      function  AddObject(const aStr: Il3CString; anObject: TObject): Integer;
        overload;
        {-}
      {$IfDef XE2}
      function Add(const aStr: AnsiString): Integer; overload;
      function IndexOf(const aSt: AnsiString): Integer; overload;
      procedure Insert(aIndex: Integer;
       const aStr: AnsiString); overload;
      {$EndIf XE2}
      procedure SetText(const aString: String);
        {-}  
    public
    // public properties
      property Duplicates: TDuplicates
        //read pm_GetDuplicates
        write pm_SetDuplicates;
        {-}
  end;//Tl3CustomStrings

  Tl3Strings = class(Tl3CustomStrings)
    private
    // internal fields
      f_Items : Tl3StringsItems;
    protected
    // internal methods
      function  Get_Items: TStrings;
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
  end;//Tl3Strings

implementation

uses
  l3Types,
  l3String
  ;

// start class Tl3StringsItems

constructor Tl3StringsItems.Create(aStrings: Tl3CustomStrings);
  //reintroduce;
  {-}
begin
 inherited Create;
 f_Strings := aStrings;
end;

procedure Tl3StringsItems.Cleanup;
  {override;}
  {-}
begin
 f_Strings := nil;
 inherited;
end;

procedure Tl3StringsItems.Clear;
  //override;
  {-}
begin
 f_Strings.Clear;
end;

procedure Tl3StringsItems.Insert(Index: Integer; const S: string);
  //override;
  {-}
begin
 f_Strings.Insert(Index, S);
end;

function Tl3StringsItems.Get(Index: Integer): string;
  {override;}
  {-}
begin
 Result := f_Strings.Get_Item(Index);
end;

procedure Tl3StringsItems.Put(Index: Integer; const S: string);
  {override;}
  {-}
begin
 f_Strings.Set_Item(Index, S);
end;

function Tl3StringsItems.GetCount: Integer;
  {override;}
  {-}
begin
 Result := f_Strings.Count;
end;

function Tl3StringsItems.GetObject(Index: Integer): TObject;
  {override;}
  {-}
begin
 Result := f_Strings.Get_Objects(Index);
end;

procedure Tl3StringsItems.PutObject(Index: Integer; aObject: TObject);
  //override;
  {-}
begin
 f_Strings.Set_Objects(Index, aObject);
end;

// start class Tl3CustomStrings

class function Tl3CustomStrings.Make: Il3StringsEx;
  //reintroduce;
  {-}
var
 l_L : Tl3CustomStrings;
begin
 l_L := Create;
 try
  Result := l_L;
 finally
  l3Free(l_L);
 end;//try..finally
end;

function Tl3CustomStrings.Get_Items: TStrings;
  {-}
begin
 Result := nil;
end;

procedure Tl3CustomStrings.Set_Items(aValue: TStrings);
  {-}
begin
 Assign(aValue);
end;

function Tl3CustomStrings.Get_Count: Integer;
  {-}
begin
 Result := Count;
end;

function Tl3CustomStrings.Get_Item(Index: Integer): AnsiString;
  {-}
begin
 Result := Items[Index].AsString;
end;

procedure Tl3CustomStrings.Set_Item(Index: Integer; const S: AnsiString);
  {-}
begin
 Items[Index].AsString := S;
end;

function Tl3CustomStrings.Get_Objects(anIndex: Integer): TObject;
  {-}
begin
 Result := Items[anIndex].LinkedObject;
end;

procedure Tl3CustomStrings.Set_Objects(anIndex: Integer; anObject: TObject);
  {-}
begin
 Items[anIndex].LinkedObject := anObject;
end;

procedure Tl3CustomStrings.Assign(const aStrings: Il3StringsEx);
  //reintroduce;
  //overload;
  {-}
begin
 if (aStrings = nil) then
  Clear
 else
  inherited Assign(aStrings.Items);
end;

procedure Tl3CustomStrings.Assign(aStrings: TStrings);
  //reintroduce;
  //overload;
  {-}
begin
 if (aStrings = nil) then
  Clear
 else
  inherited Assign(aStrings);
end;

function Tl3CustomStrings.EQ(const aStrings: Il3StringsEx): Boolean;
  {-}
var
 l_Index : Integer;
 l_Item  : Tl3CustomString;
begin
 // количество одинаковое
 Result := (Count = aStrings.Count);
 // сравним
 if Result then
  for l_Index := 0 to Pred(Count) do
   // нашли не одинаковые
  begin
   l_Item := Tl3CustomString(Items[l_Index]);
   if not l3Same(l_Item.AsWStr, aStrings.ItemC[l_Index]) then
   begin
    Result := false;
    break;
   end;//not l3Same(l_Item.AsWStr, aStrings.ItemC[l_Index])
   if (l_Item.LinkedObject <> aStrings.Objects[l_Index]) then
   begin
    Result := false;
    break;
   end;//l_Item.LinkedObject <> aStrings.Objects[l_Index]
  end;//for l_Index
end;

function Tl3CustomStrings.AddObject(const aStr: AnsiString; anObject: TObject): Integer;
  {-}
begin
 Result := Add(aStr);
 Set_Objects(Result, anObject);
end;

function Tl3CustomStrings.AddObject(const aStr: Il3CString; anObject: TObject): Integer;
  //overload;
  {-}
begin
 Result := Add(aStr);
 Set_Objects(Result, anObject);
end;

{$IfDef XE2}
function Tl3CustomStrings.Add(const aStr: AnsiString): Integer;
begin
 Result := inherited Add(String(aStr));
end;

function Tl3CustomStrings.IndexOf(const aSt: AnsiString): Integer;
begin
 Result := inherited IndexOf(String(aSt));
end;

procedure Tl3CustomStrings.Insert(aIndex: Integer;
 const aStr: AnsiString);
begin
 inherited Insert(aIndex, String(aStr));
end;
{$EndIf XE2}

procedure Tl3CustomStrings.SetText(const aString: String);
  {-}
begin
 Get_Items.Text := aString;
end;

procedure Tl3CustomStrings.BeginUpdate;
  {-}
begin
 Changing;
end;

procedure Tl3CustomStrings.EndUpdate;
  {-}
begin
 Changed;
end;

procedure Tl3CustomStrings.pm_SetDuplicates(Value: TDuplicates);
  {-}
begin
 Case Value of
  dupIgnore :
   inherited Duplicates := l3_dupIgnore;
  dupAccept :
   inherited Duplicates := l3_dupAccept;
  dupError :
   inherited Duplicates := l3_dupError;
 end;//Case Value
end;
  
function Tl3CustomStrings.ItemsClass: Rl3StringsItems;
  //virtual;
  {-}
begin
 Result := Tl3StringsItems;
end;
  
function Tl3CustomStrings.StringItemClass: Rl3String;
  //override;
  {-}
begin
 Result := Tl3ObjPtrString;
end;

function Tl3CustomStrings.CStrToItem(const aStr: Il3CString): Tl3CustomString;
  //override;
  {-}
begin
 Result := Tl3ObjPtrIntfString.Make(aStr);
end;

procedure Tl3CustomStrings.DefineProperties(Filer: TFiler);
  //override;
  {-}

  function DoWrite: Boolean;
  begin//DoWrite
   if (Filer.Ancestor <> nil) then
   begin
    Result := True;
    if (Filer.Ancestor is Tl3CustomStrings) then
      Result := not EQ(Tl3CustomStrings(Filer.Ancestor))
   end//Filer.Ancestor <> nil
   else
    Result := Count > 0;
  end;//DoWrite

begin
 Filer.DefineProperty('Strings', ReadData, WriteData, DoWrite);
end;

procedure Tl3CustomStrings.ReadData(Reader: TReader);
begin
 Reader.ReadListBegin;
 BeginUpdate;
 try
  Clear;
  while not Reader.EndOfList do
   Add(Reader.ReadString);
 finally
  EndUpdate;
 end;
 Reader.ReadListEnd;
end;

procedure Tl3CustomStrings.WriteData(Writer: TWriter);
var
 I: Integer;
begin
 Writer.WriteListBegin;
 for I := 0 to Count - 1 do
  Writer.WriteString(Get_Item(I));
 Writer.WriteListEnd;
end;

// start class Tl3Strings

procedure Tl3Strings.Cleanup;
  //override;
  {-}
begin
 if (f_Items <> nil) then
  f_Items.f_Strings := nil;
 l3Free(f_Items);
 inherited;
end;

function Tl3Strings.Get_Items: TStrings;
  {-}
begin
 if (f_Items = nil) then
  f_Items := ItemsClass.Create(Self);
 Result := f_Items;
end;

end.

