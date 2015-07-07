unit kwSmartEquals;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSmartEquals.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ExtendedPrimitives::ExtendedPrimitivesPack::SmartEquals
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
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwTwoValuesWord.imp.pas}
 TkwSmartEquals = {final} class(_tfwTwoValuesWord_)
 protected
 // realized methods
   procedure DoValues(const aV1: TtfwStackValue;
     const aV2: TtfwStackValue;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // public methods
   class function CompareValues(const aV1: TtfwStackValue;
     const aV2: TtfwStackValue;
     const aCtx: TtfwContext): Boolean;
 end;//TkwSmartEquals
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  l3Chars,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSmartEquals;

{$Include ..\ScriptEngine\tfwTwoValuesWord.imp.pas}

// start class TkwSmartEquals

class function TkwSmartEquals.CompareValues(const aV1: TtfwStackValue;
  const aV2: TtfwStackValue;
  const aCtx: TtfwContext): Boolean;
//#UC START# *4F51EE02033C_4F51EBAA01DA_var*

 procedure CompareAsPrintable;
 begin//CompareAsPrintable
  Result := l3Same(aV1.AsPrintable, aV2.AsPrintable);
 end;//CompareAsPrintable

var
 l_C : AnsiChar;
//#UC END# *4F51EE02033C_4F51EBAA01DA_var*
begin
//#UC START# *4F51EE02033C_4F51EBAA01DA_impl*
 Result := false;
 if (aV1.rType = aV2.rType) then
 begin
  Case aV1.rType of
   tfw_svtVoid:
    Result := true;
   tfw_svtInt:
    Result := (aV1.rInteger = aV2.rInteger);
   tfw_svtBool:
    Result := (aV1.AsBoolean = aV2.AsBoolean);
   tfw_svtStr:
    Result := l3Same(aV1.AsString, aV2.AsString);
   tfw_svtObj:
    Result := (aV1.AsObject = aV2.AsObject);
   tfw_svtList:
    Result := (aV1.AsIntf = aV2.AsIntf);
   tfw_svtIntf:
    Result := (aV1.AsIntf = aV2.AsIntf);
   tfw_svtNil:
    Result := true;
   tfw_svtFile:
    Result := (aV1.AsIntf = aV2.AsIntf);
   tfw_svtChar:
    Result := (aV1.AsChar = aV2.AsChar);
   tfw_svtWStr:
    Result := l3Same(aV1.AsWString, aV2.AsWString);
   tfw_svtBracket:
    Result := true;
   else
    {Runner}Assert(false, 'Неизвестный тип для сравнения'{, aCtx});
  end;//aV1.rType
 end//aV1.rType = aV2.rType
 else
 begin
  Case aV1.rType of
(*   tfw_svtVoid:
    Result := true;
   tfw_svtInt:
    Result := (aV1.rInteger = aV2.rInteger);
   tfw_svtBool:
    Result := (aV1.AsBoolean = aV2.AsBoolean);*)
   tfw_svtStr:
   begin
    Case aV2.rType of
     tfw_svtWStr:
      Result := l3Same(aV1.AsString.AsWStr, aV2.AsWString);
     tfw_svtChar:
     begin
      l_C := aV2.AsChar;
      Result := l3Same(aV1.AsString.AsWStr, l3PCharLen(@l_C, 1, CP_ANSI));
     end;//tfw_svtChar
     else
      CompareAsPrintable;
    end;//Case aV2.rType
   end;//tfw_svtStr
   tfw_svtObj:
    Case aV2.rType of
     tfw_svtNil:
      Result := (aV1.AsObject = nil);
     else
      CompareAsPrintable;
    end;//Case aV2.rType
   tfw_svtIntf:
    Case aV2.rType of
     tfw_svtNil:
      Result := (aV1.AsIntf = nil);
     else
      CompareAsPrintable;
    end;//Case aV2.rType
   tfw_svtNil:
    Case aV2.rType of
     tfw_svtIntf:
      Result := (aV2.AsIntf = nil);
     tfw_svtObj:
      Result := (aV2.AsObject = nil);
     else
      CompareAsPrintable;
    end;//Case aV2.rType
(*   tfw_svtFile:
    Result := (aV1.AsIntf = aV2.AsIntf);*)
   tfw_svtChar:
   begin
    l_C := aV1.AsChar;
    Case aV2.rType of
     tfw_svtStr:
      Result := l3Same(l3PCharLen(@l_C, 1, CP_ANSI), aV2.AsString.AsWStr);
     tfw_svtWStr:
      Result := l3Same(l3PCharLen(@l_C, 1, CP_ANSI), aV2.AsWString);
     else
      CompareAsPrintable;
    end;//Case aV2.rType
   end;//tfw_svtChar
   tfw_svtWStr:
    Case aV2.rType of
     tfw_svtStr:
      Result := l3Same(aV1.AsWString, aV2.AsString.AsWStr);
     tfw_svtChar:
     begin
      l_C := aV2.AsChar;
      Result := l3Same(aV1.AsWString, l3PCharLen(@l_C, 1, CP_ANSI));
     end;//tfw_svtChar
     else
      CompareAsPrintable;
    end;//Case aV2.rType
(*   tfw_svtBracket:
    Result := true;*)
   else
    CompareAsPrintable;
  end;//aV1.rType
 end;//aV1.rType = aV2.rType
//#UC END# *4F51EE02033C_4F51EBAA01DA_impl*
end;//TkwSmartEquals.CompareValues

procedure TkwSmartEquals.DoValues(const aV1: TtfwStackValue;
  const aV2: TtfwStackValue;
  const aCtx: TtfwContext);
//#UC START# *4F51EEF0010D_4F51EBAA01DA_var*
//#UC END# *4F51EEF0010D_4F51EBAA01DA_var*
begin
//#UC START# *4F51EEF0010D_4F51EBAA01DA_impl*
 aCtx.rEngine.PushBool(CompareValues(aV1, aV2, aCtx));
//#UC END# *4F51EEF0010D_4F51EBAA01DA_impl*
end;//TkwSmartEquals.DoValues

class function TkwSmartEquals.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '?==';
end;//TkwSmartEquals.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwTwoValuesWord.imp.pas}
{$IfEnd} //not NoScripts

end.