unit tfwValueStack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwValueStack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::ScriptEngineCore::TtfwValueStack
//
// Стек переменных. Сюда помещаются/выводятся переменные при исполнении скрипта.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwValueList,
  l3Interfaces,
  l3Variant
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwValueStack = class(TtfwValueList)
  {* Стек переменных. Сюда помещаются/выводятся переменные при исполнении скрипта. }
 protected
 // realized methods
   function Get_ValuesCount: Integer;
 public
 // realized methods
   procedure PushInt(aValue: Integer);
   function PopInt: Integer;
   procedure PushBool(aValue: Boolean);
   function PopBool: Boolean;
   function IsTopBool: Boolean;
   procedure PushString(const aString: AnsiString); overload; 
   procedure PushString(const aString: Il3CString); overload; 
   procedure PushString(aString: Tl3PrimString); overload; 
   function IsTopString: Boolean;
   function PopDelphiString: AnsiString;
   function PopString: Il3CString;
   function IsTopInt: Boolean;
   procedure Dup;
   procedure Drop;
   procedure Swap;
   procedure Push(const aValue: TtfwStackValue);
   function Pop: TtfwStackValue;
   function IsTopType(aType: TtfwStackValueType): Boolean;
   procedure PushObj(aValue: TObject);
   function PopObj: TObject;
   procedure DupIfNotZero;
   procedure Rot;
   procedure Pick;
   procedure InvertRot;
   procedure Swap2;
   procedure Over2;
   procedure Dup2;
   procedure Drop2;
   procedure Nip;
   procedure Tuck;
   procedure Over;
   procedure Roll;
   procedure PushIntf(const anIntf: IUnknown);
   function PopIntf(const aGUID: TGUID): IUnknown; overload; 
   function PopIntf: IUnknown; overload; 
   function IsTopIntf: Boolean;
     {* Определяет - лежит ли на верхушке стека интерфейс }
   procedure PushString(const aString: Tl3WString); overload; 
   procedure PushFile(const aFile: ItfwFile);
   function PopFile: ItfwFile;
   function IsTopObj: Boolean;
   function IsTopChar: Boolean;
   procedure PushChar(aChar: AnsiChar);
   function PopChar: AnsiChar;
   procedure PushWStr(const aStr: Tl3WString);
   function PopWStr: Tl3WString;
   function IsTopWStr: Boolean;
   function PopPrintable: Il3CString;
   function IsTopBracket: Boolean;
   procedure PushBracket;
   procedure PushClass(aClass: TClass);
   function PopClass: TClass;
   function IsTopClass: Boolean;
 public
 // public methods
   function Top: TtfwStackValue;
     {* Верхнее значение стека. }
   function PrevTop(const aDelta: Integer;
     aNeedPop: Boolean): TtfwStackValue;
     {* Получить значение предшествующее верхнему. }
 end;//TtfwValueStack
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwValueStack

function TtfwValueStack.Top: TtfwStackValue;
//#UC START# *4DF06886005A_4DB009CF0103_var*
//#UC END# *4DF06886005A_4DB009CF0103_var*
begin
//#UC START# *4DF06886005A_4DB009CF0103_impl*
 Result := Last;
//#UC END# *4DF06886005A_4DB009CF0103_impl*
end;//TtfwValueStack.Top

function TtfwValueStack.PrevTop(const aDelta: Integer;
  aNeedPop: Boolean): TtfwStackValue;
//#UC START# *4DF069C60159_4DB009CF0103_var*
var
 l_Index: Integer;
//#UC END# *4DF069C60159_4DB009CF0103_var*
begin
//#UC START# *4DF069C60159_4DB009CF0103_impl*
 Assert(Count > aDelta);
 l_Index := Count - aDelta - 1;
 Result := Items[l_Index];
 if aNeedPop then
  Delete(l_Index);
//#UC END# *4DF069C60159_4DB009CF0103_impl*
end;//TtfwValueStack.PrevTop

procedure TtfwValueStack.PushInt(aValue: Integer);
//#UC START# *4DB008F503BE_4DB009CF0103_var*
//#UC END# *4DB008F503BE_4DB009CF0103_var*
begin
//#UC START# *4DB008F503BE_4DB009CF0103_impl*
 Add(TtfwStackValue_C(aValue));
//#UC END# *4DB008F503BE_4DB009CF0103_impl*
end;//TtfwValueStack.PushInt

function TtfwValueStack.PopInt: Integer;
//#UC START# *4DB0090A0000_4DB009CF0103_var*
var
 l_V : TtfwStackValue;
//#UC END# *4DB0090A0000_4DB009CF0103_var*
begin
//#UC START# *4DB0090A0000_4DB009CF0103_impl*
 Assert(Count > 0);
 l_V := Last;
 Assert(l_V.rType = tfw_svtInt);
 Result := l_V.rInteger;
 Delete(Count - 1);
//#UC END# *4DB0090A0000_4DB009CF0103_impl*
end;//TtfwValueStack.PopInt

procedure TtfwValueStack.PushBool(aValue: Boolean);
//#UC START# *4DB013A10166_4DB009CF0103_var*
//#UC END# *4DB013A10166_4DB009CF0103_var*
begin
//#UC START# *4DB013A10166_4DB009CF0103_impl*
 Add(TtfwStackValue_C(aValue));
//#UC END# *4DB013A10166_4DB009CF0103_impl*
end;//TtfwValueStack.PushBool

function TtfwValueStack.PopBool: Boolean;
//#UC START# *4DB013AF01C9_4DB009CF0103_var*
//#UC END# *4DB013AF01C9_4DB009CF0103_var*
begin
//#UC START# *4DB013AF01C9_4DB009CF0103_impl*
 Assert(Count > 0);
 Result := Last.AsBoolean;
 Delete(Count - 1);
//#UC END# *4DB013AF01C9_4DB009CF0103_impl*
end;//TtfwValueStack.PopBool

function TtfwValueStack.IsTopBool: Boolean;
//#UC START# *4DB04213007C_4DB009CF0103_var*
//#UC END# *4DB04213007C_4DB009CF0103_var*
begin
//#UC START# *4DB04213007C_4DB009CF0103_impl*
 if Empty then
  Result := false
 else
  Result := (Last.rType = tfw_svtBool); 
//#UC END# *4DB04213007C_4DB009CF0103_impl*
end;//TtfwValueStack.IsTopBool

procedure TtfwValueStack.PushString(const aString: AnsiString);
//#UC START# *4DB047EF0005_4DB009CF0103_var*
//#UC END# *4DB047EF0005_4DB009CF0103_var*
begin
//#UC START# *4DB047EF0005_4DB009CF0103_impl*
 Add(TtfwStackValue_C(TtfwCStringFactory.C(aString)));
//#UC END# *4DB047EF0005_4DB009CF0103_impl*
end;//TtfwValueStack.PushString

procedure TtfwValueStack.PushString(const aString: Il3CString);
//#UC START# *4DB0480002EF_4DB009CF0103_var*
//#UC END# *4DB0480002EF_4DB009CF0103_var*
begin
//#UC START# *4DB0480002EF_4DB009CF0103_impl*
 Add(TtfwStackValue_C(aString));
//#UC END# *4DB0480002EF_4DB009CF0103_impl*
end;//TtfwValueStack.PushString

procedure TtfwValueStack.PushString(aString: Tl3PrimString);
//#UC START# *4DB0480A0174_4DB009CF0103_var*
//#UC END# *4DB0480A0174_4DB009CF0103_var*
begin
//#UC START# *4DB0480A0174_4DB009CF0103_impl*
 Add(TtfwStackValue_C(TtfwCStringFactory.C(aString)));
//#UC END# *4DB0480A0174_4DB009CF0103_impl*
end;//TtfwValueStack.PushString

function TtfwValueStack.IsTopString: Boolean;
//#UC START# *4DB0488A0157_4DB009CF0103_var*
//#UC END# *4DB0488A0157_4DB009CF0103_var*
begin
//#UC START# *4DB0488A0157_4DB009CF0103_impl*
 if Empty then
  Result := false
 else
  Result := (Last.rType = tfw_svtStr); 
//#UC END# *4DB0488A0157_4DB009CF0103_impl*
end;//TtfwValueStack.IsTopString

function TtfwValueStack.PopDelphiString: AnsiString;
//#UC START# *4DB0489C0129_4DB009CF0103_var*
//#UC END# *4DB0489C0129_4DB009CF0103_var*
begin
//#UC START# *4DB0489C0129_4DB009CF0103_impl*
 Assert(Count > 0);
 Result := l3Str(Last.AsString);
 Delete(Count - 1);
//#UC END# *4DB0489C0129_4DB009CF0103_impl*
end;//TtfwValueStack.PopDelphiString

function TtfwValueStack.PopString: Il3CString;
//#UC START# *4DB1784F0388_4DB009CF0103_var*
//#UC END# *4DB1784F0388_4DB009CF0103_var*
begin
//#UC START# *4DB1784F0388_4DB009CF0103_impl*
 Assert(Count > 0);
 Result := Last.AsString;
 Delete(Count - 1);
//#UC END# *4DB1784F0388_4DB009CF0103_impl*
end;//TtfwValueStack.PopString

function TtfwValueStack.IsTopInt: Boolean;
//#UC START# *4DB17E8502F0_4DB009CF0103_var*
//#UC END# *4DB17E8502F0_4DB009CF0103_var*
begin
//#UC START# *4DB17E8502F0_4DB009CF0103_impl*
 if Empty then
  Result := false
 else
  Result := (Last.rType = tfw_svtInt); 
//#UC END# *4DB17E8502F0_4DB009CF0103_impl*
end;//TtfwValueStack.IsTopInt

procedure TtfwValueStack.Dup;
//#UC START# *4DB6EE5E031F_4DB009CF0103_var*
//#UC END# *4DB6EE5E031F_4DB009CF0103_var*
begin
//#UC START# *4DB6EE5E031F_4DB009CF0103_impl*
 Add(Last);
//#UC END# *4DB6EE5E031F_4DB009CF0103_impl*
end;//TtfwValueStack.Dup

procedure TtfwValueStack.Drop;
//#UC START# *4DB6F04F02D2_4DB009CF0103_var*
//#UC END# *4DB6F04F02D2_4DB009CF0103_var*
begin
//#UC START# *4DB6F04F02D2_4DB009CF0103_impl*
 Assert(Count > 0);
 Delete(Count - 1);
//#UC END# *4DB6F04F02D2_4DB009CF0103_impl*
end;//TtfwValueStack.Drop

procedure TtfwValueStack.Swap;
//#UC START# *4DB704AA00BF_4DB009CF0103_var*
//#UC END# *4DB704AA00BF_4DB009CF0103_var*
begin
//#UC START# *4DB704AA00BF_4DB009CF0103_impl*
 Assert(Count > 1);
 Exchange(Count - 1, Count - 2);
//#UC END# *4DB704AA00BF_4DB009CF0103_impl*
end;//TtfwValueStack.Swap

procedure TtfwValueStack.Push(const aValue: TtfwStackValue);
//#UC START# *4DBAF89E0328_4DB009CF0103_var*
//#UC END# *4DBAF89E0328_4DB009CF0103_var*
begin
//#UC START# *4DBAF89E0328_4DB009CF0103_impl*
 Add(aValue);
//#UC END# *4DBAF89E0328_4DB009CF0103_impl*
end;//TtfwValueStack.Push

function TtfwValueStack.Pop: TtfwStackValue;
//#UC START# *4DBAF8B002CA_4DB009CF0103_var*
//#UC END# *4DBAF8B002CA_4DB009CF0103_var*
begin
//#UC START# *4DBAF8B002CA_4DB009CF0103_impl*
 Assert(Count > 0);
 Result := Last;
 Delete(Count - 1);
//#UC END# *4DBAF8B002CA_4DB009CF0103_impl*
end;//TtfwValueStack.Pop

function TtfwValueStack.IsTopType(aType: TtfwStackValueType): Boolean;
//#UC START# *4DBAF8C200E2_4DB009CF0103_var*
//#UC END# *4DBAF8C200E2_4DB009CF0103_var*
begin
//#UC START# *4DBAF8C200E2_4DB009CF0103_impl*
 if Empty then
  Result := false
 else
  Result := (Last.rType = aType); 
//#UC END# *4DBAF8C200E2_4DB009CF0103_impl*
end;//TtfwValueStack.IsTopType

procedure TtfwValueStack.PushObj(aValue: TObject);
//#UC START# *4DBAF910011B_4DB009CF0103_var*
//#UC END# *4DBAF910011B_4DB009CF0103_var*
begin
//#UC START# *4DBAF910011B_4DB009CF0103_impl*
 Add(TtfwStackValue_C(aValue));
//#UC END# *4DBAF910011B_4DB009CF0103_impl*
end;//TtfwValueStack.PushObj

function TtfwValueStack.PopObj: TObject;
//#UC START# *4DBAF9210150_4DB009CF0103_var*
//#UC END# *4DBAF9210150_4DB009CF0103_var*
begin
//#UC START# *4DBAF9210150_4DB009CF0103_impl*
 Assert(Count > 0);
 Result := Last.AsObject;
 Delete(Count - 1);
//#UC END# *4DBAF9210150_4DB009CF0103_impl*
end;//TtfwValueStack.PopObj

procedure TtfwValueStack.DupIfNotZero;
//#UC START# *4DCBD16302CD_4DB009CF0103_var*
var
 l_L : TtfwStackValue;
//#UC END# *4DCBD16302CD_4DB009CF0103_var*
begin
//#UC START# *4DCBD16302CD_4DB009CF0103_impl*
 l_L := Last;
 if (l_L.rInteger <> 0) AND (l_L.rType = tfw_svtInt) then
  Add(l_L);
//#UC END# *4DCBD16302CD_4DB009CF0103_impl*
end;//TtfwValueStack.DupIfNotZero

procedure TtfwValueStack.Rot;
//#UC START# *4DEF28E400E0_4DB009CF0103_var*
var
 l_BottomID: Integer;
//#UC END# *4DEF28E400E0_4DB009CF0103_var*
begin
//#UC START# *4DEF28E400E0_4DB009CF0103_impl*
 Assert(Count > 2);
 l_BottomID := Count - 3;
 Exchange(l_BottomID, l_BottomID + 1);
 Inc(l_BottomID);
 Exchange(l_BottomID, l_BottomID + 1);
//#UC END# *4DEF28E400E0_4DB009CF0103_impl*
end;//TtfwValueStack.Rot

procedure TtfwValueStack.Pick;
//#UC START# *4DEF5D850232_4DB009CF0103_var*
//#UC END# *4DEF5D850232_4DB009CF0103_var*
begin
//#UC START# *4DEF5D850232_4DB009CF0103_impl*
 if IsTopInt then
  Add(PrevTop(PopInt, False))
 else
  Assert(False);
//#UC END# *4DEF5D850232_4DB009CF0103_impl*
end;//TtfwValueStack.Pick

procedure TtfwValueStack.InvertRot;
//#UC START# *4DEF5FBB0157_4DB009CF0103_var*
var
 l_TopID: Integer;
//#UC END# *4DEF5FBB0157_4DB009CF0103_var*
begin
//#UC START# *4DEF5FBB0157_4DB009CF0103_impl*
 Assert(Count > 2);
 l_TopID := Count - 1;
 Exchange(l_TopID, l_TopID - 1);
 Dec(l_TopID);
 Exchange(l_TopID, l_TopID - 1);
//#UC END# *4DEF5FBB0157_4DB009CF0103_impl*
end;//TtfwValueStack.InvertRot

procedure TtfwValueStack.Swap2;
//#UC START# *4DEF5FE202B1_4DB009CF0103_var*
var
 l_TopID: Integer;
//#UC END# *4DEF5FE202B1_4DB009CF0103_var*
begin
//#UC START# *4DEF5FE202B1_4DB009CF0103_impl*
 Assert(Count > 3);
 l_TopID := Count - 1;
 Exchange(l_TopID - 2, l_TopID);
 Exchange(l_TopID - 1, l_TopID - 3);
//#UC END# *4DEF5FE202B1_4DB009CF0103_impl*
end;//TtfwValueStack.Swap2

procedure TtfwValueStack.Over2;
//#UC START# *4DEF5FF802E6_4DB009CF0103_var*
//#UC END# *4DEF5FF802E6_4DB009CF0103_var*
begin
//#UC START# *4DEF5FF802E6_4DB009CF0103_impl*
 Assert(Count > 3);
 Add(PrevTop(3, False));
 Add(PrevTop(3, False));
//#UC END# *4DEF5FF802E6_4DB009CF0103_impl*
end;//TtfwValueStack.Over2

procedure TtfwValueStack.Dup2;
//#UC START# *4DEF60050174_4DB009CF0103_var*
//#UC END# *4DEF60050174_4DB009CF0103_var*
begin
//#UC START# *4DEF60050174_4DB009CF0103_impl*
 Assert(Count > 1);
 Add(PrevTop(1, False));
 Add(PrevTop(1, False));
//#UC END# *4DEF60050174_4DB009CF0103_impl*
end;//TtfwValueStack.Dup2

procedure TtfwValueStack.Drop2;
//#UC START# *4DEF6013023F_4DB009CF0103_var*
//#UC END# *4DEF6013023F_4DB009CF0103_var*
begin
//#UC START# *4DEF6013023F_4DB009CF0103_impl*
 Assert(Count > 1);
 Delete(Count - 1);
 Delete(Count - 1);
//#UC END# *4DEF6013023F_4DB009CF0103_impl*
end;//TtfwValueStack.Drop2

procedure TtfwValueStack.Nip;
//#UC START# *4DEF602000E4_4DB009CF0103_var*
//#UC END# *4DEF602000E4_4DB009CF0103_var*
begin
//#UC START# *4DEF602000E4_4DB009CF0103_impl*
 Assert(Count > 1);
 Delete(Count - 2);
//#UC END# *4DEF602000E4_4DB009CF0103_impl*
end;//TtfwValueStack.Nip

procedure TtfwValueStack.Tuck;
//#UC START# *4DEF602B03A2_4DB009CF0103_var*
//#UC END# *4DEF602B03A2_4DB009CF0103_var*
begin
//#UC START# *4DEF602B03A2_4DB009CF0103_impl*
 Assert(Count > 1);
 Insert(Count - 2, Top);
//#UC END# *4DEF602B03A2_4DB009CF0103_impl*
end;//TtfwValueStack.Tuck

procedure TtfwValueStack.Over;
//#UC START# *4DF06491010E_4DB009CF0103_var*
//#UC END# *4DF06491010E_4DB009CF0103_var*
begin
//#UC START# *4DF06491010E_4DB009CF0103_impl*
 Assert(Count > 1);
 Add(PrevTop(1, False));
//#UC END# *4DF06491010E_4DB009CF0103_impl*
end;//TtfwValueStack.Over

procedure TtfwValueStack.Roll;
//#UC START# *4DF0649B0073_4DB009CF0103_var*
var
 l_Index: Integer;
//#UC END# *4DF0649B0073_4DB009CF0103_var*
begin
//#UC START# *4DF0649B0073_4DB009CF0103_impl*
 //if IsTopInt then
  Add(PrevTop(PopInt, True))
// else
//  Assert(False);
 //#UC END# *4DF0649B0073_4DB009CF0103_impl*
end;//TtfwValueStack.Roll

procedure TtfwValueStack.PushIntf(const anIntf: IUnknown);
//#UC START# *4EB2747D0294_4DB009CF0103_var*
//#UC END# *4EB2747D0294_4DB009CF0103_var*
begin
//#UC START# *4EB2747D0294_4DB009CF0103_impl*
 Add(TtfwStackValue_C(anIntf));
//#UC END# *4EB2747D0294_4DB009CF0103_impl*
end;//TtfwValueStack.PushIntf

function TtfwValueStack.PopIntf(const aGUID: TGUID): IUnknown;
//#UC START# *4EB274C402BC_4DB009CF0103_var*
//#UC END# *4EB274C402BC_4DB009CF0103_var*
begin
//#UC START# *4EB274C402BC_4DB009CF0103_impl*
 Assert(Count > 0);
 Result := Last.AsIntf(aGUID);
 Delete(Count - 1);
//#UC END# *4EB274C402BC_4DB009CF0103_impl*
end;//TtfwValueStack.PopIntf

function TtfwValueStack.PopIntf: IUnknown;
//#UC START# *4EB274E201C2_4DB009CF0103_var*
//#UC END# *4EB274E201C2_4DB009CF0103_var*
begin
//#UC START# *4EB274E201C2_4DB009CF0103_impl*
 Assert(Count > 0);
 Result := Last.AsIntf;
 Delete(Count - 1);
//#UC END# *4EB274E201C2_4DB009CF0103_impl*
end;//TtfwValueStack.PopIntf

function TtfwValueStack.IsTopIntf: Boolean;
//#UC START# *4EB2759D021C_4DB009CF0103_var*
//#UC END# *4EB2759D021C_4DB009CF0103_var*
begin
//#UC START# *4EB2759D021C_4DB009CF0103_impl*
 if Empty then
  Result := false
 else
  Result := (Last.rType = tfw_svtIntf); 
//#UC END# *4EB2759D021C_4DB009CF0103_impl*
end;//TtfwValueStack.IsTopIntf

function TtfwValueStack.Get_ValuesCount: Integer;
//#UC START# *4F3E34A1009A_4DB009CF0103get_var*
//#UC END# *4F3E34A1009A_4DB009CF0103get_var*
begin
//#UC START# *4F3E34A1009A_4DB009CF0103get_impl*
 Result := Count;
//#UC END# *4F3E34A1009A_4DB009CF0103get_impl*
end;//TtfwValueStack.Get_ValuesCount

procedure TtfwValueStack.PushString(const aString: Tl3WString);
//#UC START# *4F4749150158_4DB009CF0103_var*
//#UC END# *4F4749150158_4DB009CF0103_var*
begin
//#UC START# *4F4749150158_4DB009CF0103_impl*
 Add(TtfwStackValue_C(TtfwCStringFactory.C(aString)));
//#UC END# *4F4749150158_4DB009CF0103_impl*
end;//TtfwValueStack.PushString

procedure TtfwValueStack.PushFile(const aFile: ItfwFile);
//#UC START# *4F4FD9790124_4DB009CF0103_var*
//#UC END# *4F4FD9790124_4DB009CF0103_var*
begin
//#UC START# *4F4FD9790124_4DB009CF0103_impl*
 Add(TtfwStackValue_C(aFile));
//#UC END# *4F4FD9790124_4DB009CF0103_impl*
end;//TtfwValueStack.PushFile

function TtfwValueStack.PopFile: ItfwFile;
//#UC START# *4F4FD99A0182_4DB009CF0103_var*
//#UC END# *4F4FD99A0182_4DB009CF0103_var*
begin
//#UC START# *4F4FD99A0182_4DB009CF0103_impl*
 Result := Last.AsFile;
 Drop;
//#UC END# *4F4FD99A0182_4DB009CF0103_impl*
end;//TtfwValueStack.PopFile

function TtfwValueStack.IsTopObj: Boolean;
//#UC START# *4F4FDC210286_4DB009CF0103_var*
//#UC END# *4F4FDC210286_4DB009CF0103_var*
begin
//#UC START# *4F4FDC210286_4DB009CF0103_impl*
 if Empty then
  Result := false
 else
  Result := (Last.rType = tfw_svtObj); 
//#UC END# *4F4FDC210286_4DB009CF0103_impl*
end;//TtfwValueStack.IsTopObj

function TtfwValueStack.IsTopChar: Boolean;
//#UC START# *4F4FDCFB0195_4DB009CF0103_var*
//#UC END# *4F4FDCFB0195_4DB009CF0103_var*
begin
//#UC START# *4F4FDCFB0195_4DB009CF0103_impl*
 if Empty then
  Result := false
 else
  Result := (Last.rType = tfw_svtChar); 
//#UC END# *4F4FDCFB0195_4DB009CF0103_impl*
end;//TtfwValueStack.IsTopChar

procedure TtfwValueStack.PushChar(aChar: AnsiChar);
//#UC START# *4F4FDD140127_4DB009CF0103_var*
//#UC END# *4F4FDD140127_4DB009CF0103_var*
begin
//#UC START# *4F4FDD140127_4DB009CF0103_impl*
 Add(TtfwStackValue_C(aChar));
//#UC END# *4F4FDD140127_4DB009CF0103_impl*
end;//TtfwValueStack.PushChar

function TtfwValueStack.PopChar: AnsiChar;
//#UC START# *4F4FDD38028A_4DB009CF0103_var*
//#UC END# *4F4FDD38028A_4DB009CF0103_var*
begin
//#UC START# *4F4FDD38028A_4DB009CF0103_impl*
 Result := Last.AsChar;
 Drop;
//#UC END# *4F4FDD38028A_4DB009CF0103_impl*
end;//TtfwValueStack.PopChar

procedure TtfwValueStack.PushWStr(const aStr: Tl3WString);
//#UC START# *4F4FE1DC0081_4DB009CF0103_var*
//#UC END# *4F4FE1DC0081_4DB009CF0103_var*
begin
//#UC START# *4F4FE1DC0081_4DB009CF0103_impl*
 Add(TtfwStackValue_C(aStr));
//#UC END# *4F4FE1DC0081_4DB009CF0103_impl*
end;//TtfwValueStack.PushWStr

function TtfwValueStack.PopWStr: Tl3WString;
//#UC START# *4F4FE2000271_4DB009CF0103_var*
//#UC END# *4F4FE2000271_4DB009CF0103_var*
begin
//#UC START# *4F4FE2000271_4DB009CF0103_impl*
 Result := Last.AsWString;
 Drop;
//#UC END# *4F4FE2000271_4DB009CF0103_impl*
end;//TtfwValueStack.PopWStr

function TtfwValueStack.IsTopWStr: Boolean;
//#UC START# *4F4FE2210169_4DB009CF0103_var*
//#UC END# *4F4FE2210169_4DB009CF0103_var*
begin
//#UC START# *4F4FE2210169_4DB009CF0103_impl*
 if Empty then
  Result := false
 else
  Result := (Last.rType = tfw_svtWStr); 
//#UC END# *4F4FE2210169_4DB009CF0103_impl*
end;//TtfwValueStack.IsTopWStr

function TtfwValueStack.PopPrintable: Il3CString;
//#UC START# *4F4FEB6100A7_4DB009CF0103_var*
//#UC END# *4F4FEB6100A7_4DB009CF0103_var*
begin
//#UC START# *4F4FEB6100A7_4DB009CF0103_impl*
 Result := Last.AsPrintable;
 Drop;
//#UC END# *4F4FEB6100A7_4DB009CF0103_impl*
end;//TtfwValueStack.PopPrintable

function TtfwValueStack.IsTopBracket: Boolean;
//#UC START# *4F5030B002E0_4DB009CF0103_var*
//#UC END# *4F5030B002E0_4DB009CF0103_var*
begin
//#UC START# *4F5030B002E0_4DB009CF0103_impl*
 if Empty then
  Result := false
 else
  Result := (Last.rType = tfw_svtBracket); 
//#UC END# *4F5030B002E0_4DB009CF0103_impl*
end;//TtfwValueStack.IsTopBracket

procedure TtfwValueStack.PushBracket;
//#UC START# *4F5030D00022_4DB009CF0103_var*
//#UC END# *4F5030D00022_4DB009CF0103_var*
begin
//#UC START# *4F5030D00022_4DB009CF0103_impl*
 Add(TtfwStackValue_CBracket);
//#UC END# *4F5030D00022_4DB009CF0103_impl*
end;//TtfwValueStack.PushBracket

procedure TtfwValueStack.PushClass(aClass: TClass);
//#UC START# *508526FE0229_4DB009CF0103_var*
//#UC END# *508526FE0229_4DB009CF0103_var*
begin
//#UC START# *508526FE0229_4DB009CF0103_impl*
 Add(TtfwStackValue_C(aClass));
//#UC END# *508526FE0229_4DB009CF0103_impl*
end;//TtfwValueStack.PushClass

function TtfwValueStack.PopClass: TClass;
//#UC START# *5085273502AA_4DB009CF0103_var*
//#UC END# *5085273502AA_4DB009CF0103_var*
begin
//#UC START# *5085273502AA_4DB009CF0103_impl*
 Assert(Count > 0);
 Result := Last.AsClass;
 Delete(Count - 1);
//#UC END# *5085273502AA_4DB009CF0103_impl*
end;//TtfwValueStack.PopClass

function TtfwValueStack.IsTopClass: Boolean;
//#UC START# *5085275F0044_4DB009CF0103_var*
//#UC END# *5085275F0044_4DB009CF0103_var*
begin
//#UC START# *5085275F0044_4DB009CF0103_impl*
 if Empty then
  Result := false
 else
  Result := (Last.rType = tfw_svtClass);
//#UC END# *5085275F0044_4DB009CF0103_impl*
end;//TtfwValueStack.IsTopClass

{$IfEnd} //not NoScripts

end.