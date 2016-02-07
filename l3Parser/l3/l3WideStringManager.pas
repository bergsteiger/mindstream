unit l3WideStringManager;

 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3SizedPoolManager
  ;

type
 Tl3WideStringManager = class(Tl3SizedPoolManager)
  {* Менеджер Unicode-строк }
 public
 // public methods
   constructor Create(aBlockSize: Integer); reintroduce;
   function AllocString(const aString: WideString): PWideChar;
     {* распределяет строку }
   procedure FreeString(var theString: PWideChar);
     {* освобождает строку }
   class function StringAsPCharLen(aString: PWideChar): Tl3WString;
     {* приводит строку к Tl3PChatLen }
   class function StringAsWideString(aString: PWideChar): WideString;
     {* приводит строку к WideString }
 end;//Tl3WideStringManager

implementation

uses
  l3String
  ;

// start class Tl3WideStringManager

constructor Tl3WideStringManager.Create(aBlockSize: Integer);
//#UC START# *54B9097403A0_5459EE930103_var*
//#UC END# *54B9097403A0_5459EE930103_var*
begin
//#UC START# *54B9097403A0_5459EE930103_impl*
 inherited Create(aBlockSize, SizeOf(WideChar));
//#UC END# *54B9097403A0_5459EE930103_impl*
end;//Tl3WideStringManager.Create

function Tl3WideStringManager.AllocString(const aString: WideString): PWideChar;
//#UC START# *54B9099101F5_5459EE930103_var*
var
 l_Length : Cardinal;
//#UC END# *54B9099101F5_5459EE930103_var*
begin
//#UC START# *54B9099101F5_5459EE930103_impl*
 l_Length := Length(aString);
 AllocItem(Result, l_Length);
 // - надо бы посмотреть - нужно ли что-то распределять, если длина нулевая
 if (l_Length > 0) then
  //l3Move(aString[1], Result^, l_Length * f_ItemSize);
  System.Move(aString[1], Result^, l_Length * f_ItemSize);
//#UC END# *54B9099101F5_5459EE930103_impl*
end;//Tl3WideStringManager.AllocString

procedure Tl3WideStringManager.FreeString(var theString: PWideChar);
//#UC START# *54B909CF01F6_5459EE930103_var*
//#UC END# *54B909CF01F6_5459EE930103_var*
begin
//#UC START# *54B909CF01F6_5459EE930103_impl*
 FreeItem(theString);
//#UC END# *54B909CF01F6_5459EE930103_impl*
end;//Tl3WideStringManager.FreeString

class function Tl3WideStringManager.StringAsPCharLen(aString: PWideChar): Tl3WString;
//#UC START# *54B909F900AB_5459EE930103_var*
//#UC END# *54B909F900AB_5459EE930103_var*
begin
//#UC START# *54B909F900AB_5459EE930103_impl*
 Result := l3PCharLen(aString, ItemLength(aString));
//#UC END# *54B909F900AB_5459EE930103_impl*
end;//Tl3WideStringManager.StringAsPCharLen

class function Tl3WideStringManager.StringAsWideString(aString: PWideChar): WideString;
//#UC START# *54B90A41007F_5459EE930103_var*
//#UC END# *54B90A41007F_5459EE930103_var*
begin
//#UC START# *54B90A41007F_5459EE930103_impl*
 SetString(Result, aString, ItemLength(aString));
//#UC END# *54B90A41007F_5459EE930103_impl*
end;//Tl3WideStringManager.StringAsWideString

end.