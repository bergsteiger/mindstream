unit kwHardKey;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwHardKey.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::KeyBoardInput::HardKey
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Windows,
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TInputKeyRecord = record
   aKey : Word;
   aHold : Boolean;
 end;//TInputKeyRecord

 TInputKeyRecordArray = array of TInputKeyRecord;

 TInputArray = array of TInput;

 TkwHardKey = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwHardKey
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Menus,
  SysUtils,
  Consts,
  l3MessagesService
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwHardKey

procedure TkwHardKey.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_501956850225_var*

{$ifNDef XE}
 procedure MakeInputs(const aString: AnsiString; var anInputs: TInputArray);

  procedure MakeInputKeyRecords(const aString: AnsiString; var anInputKeyRecords: TInputKeyRecordArray);

   function CompareFront(var aText: AnsiString; const aFront: AnsiString): Boolean;
   begin
    Result := False;
    if (Length(aText) >= Length(aFront)) and
     (AnsiStrLIComp(PChar(aText), PChar(aFront), Length(aFront)) = 0) then
    begin
     Result := True;
     Delete(aText, 1, Length(aFront));
    end;
   end;
   
  var
   l_KeyCount: Integer;
   l_Key: Word;
   l_String: AnsiString;
  begin
   SetLength(anInputKeyRecords, 0);
   l_KeyCount := 0;
   l_String := aString;
   while True do
   begin
    if CompareFront(l_String, MenuKeyCaps[mkcShift]) then
    begin
     Inc(l_KeyCount);
     SetLength(anInputKeyRecords, l_KeyCount);
     with anInputKeyRecords[l_KeyCount - 1] do
     begin
      aKey := VK_SHIFT;
      aHold := True;
     end;
    end else
    if CompareFront(l_String, '^') or
     CompareFront(l_String, MenuKeyCaps[mkcCtrl]) then
    begin
     Inc(l_KeyCount);
     SetLength(anInputKeyRecords, l_KeyCount);
     with anInputKeyRecords[l_KeyCount - 1] do
     begin
      aKey := VK_CONTROL;
      aHold := True;
     end;
    end else
    if CompareFront(l_String, MenuKeyCaps[mkcAlt]) then
    begin
     Inc(l_KeyCount);
     SetLength(anInputKeyRecords, l_KeyCount);
     with anInputKeyRecords[l_KeyCount - 1] do
     begin
      aKey := VK_MENU;
      aHold := True;
     end;
    end else
     Break;
   end;
   if Length(l_String) > 0 then
    for l_Key := $08 to $255 do 
     if AnsiCompareText(l_String, ShortCutToText(l_Key)) = 0 then
     begin
      Inc(l_KeyCount);
      SetLength(anInputKeyRecords, l_KeyCount);
      with anInputKeyRecords[l_KeyCount - 1] do
      begin
       aKey := l_Key;
       aHold := False;
      end;
      Break;
     end;
  end;

  procedure DoMakeInputs(const aKeyRecords: TInputKeyRecordArray; aRecord: Integer; var anArray: TInputArray);

   procedure AddKey(var anArray: TInputArray; aKey: Word; aDown: Boolean);
   var
    l_Length: Integer;
   begin
    l_Length := Length(anArray) + 1;
    SetLength(anArray, l_Length);
    with anArray[l_Length - 1] do
    begin
     Itype := INPUT_KEYBOARD;
     ki.wVk := aKey;
     ki.wScan := MapVirtualKey(ki.wVk, 0);
     ki.dwFlags := KEYEVENTF_EXTENDEDKEY;
     if not aDown then
      ki.dwFlags := ki.dwFlags or KEYEVENTF_KEYUP;
     ki.time := 0;
     ki.dwExtraInfo := 0;
    end;
   end;

  begin
   if (aRecord >= 0) and (aRecord < Length(aKeyRecords)) then
   begin
    AddKey(anArray, aKeyRecords[aRecord].aKey, True);
    if aKeyRecords[aRecord].aHold then
    begin
     DoMakeInputs(aKeyRecords, aRecord + 1, anArray);
     AddKey(anArray, aKeyRecords[aRecord].aKey, False);
    end else
    begin
     AddKey(anArray, aKeyRecords[aRecord].aKey, False);
     DoMakeInputs(aKeyRecords, aRecord + 1, anArray);
    end;
   end;
  end;

 var
  l_InputKeyRecords: TInputKeyRecordArray;
 begin
  MakeInputKeyRecords(aString, l_InputKeyRecords);
  DoMakeInputs(l_InputKeyRecords, 0, anInputs);
 end;

 procedure SendInputWithDelays(anInputs: TInputArray);
 var
  I: Integer;
 begin
  for I := 0 to Length(anInputs) - 1 do
  begin
   SendInput(1, anInputs[I], SizeOf(TInput));
   Tl3MessagesService.Instance.ProcessMessages;
  end;
 end;

var
 l_Inputs: TInputArray;
 l_InputCount: Integer;
{$Endif XE}
//#UC END# *4DAEEDE10285_501956850225_var*
begin
//#UC START# *4DAEEDE10285_501956850225_impl*
 {$ifNDef XE}
 MakeInputs(aCtx.rEngine.PopDelphiString, l_Inputs);
 l_InputCount := Length(l_Inputs);
 RunnerAssert(l_InputCount > 0, 'Что-то не то со строкой', aCtx);
 //SendInput(l_InputCount, l_Inputs[0], SizeOf(TInput));
 SendInputWithDelays(l_Inputs);
 {$Else}
 assert(false);
 {$Endif XE}
//#UC END# *4DAEEDE10285_501956850225_impl*
end;//TkwHardKey.DoDoIt

class function TkwHardKey.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'HardKey';
end;//TkwHardKey.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация HardKey
 TkwHardKey.RegisterInEngine;
{$IfEnd} //not NoScripts

end.