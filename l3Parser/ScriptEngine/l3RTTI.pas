unit l3RTTI;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "L3"
// Автор: Костицын
// Модуль: "w:/common/components/rtl/Garant/L3/l3RTTI.pas"
// Начат: 27.07.2012
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi Low Level::L3::l3TestUtils::l3RTTI
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\L3\l3Define.inc}

interface

uses
  SysUtils
  ;

type
 TRTTIInfoObjectPropertyFoundCallBack = procedure (anObject: TObject;
  var aValue: AnsiString) of object;

 ERTTIInfoSkipProperty = class(Exception)
 end;//ERTTIInfoSkipProperty
function L3FormatRTTIInfo(anObject: TObject;
  aSkipEvents: Boolean = True;
  anObjectPropertyFoundCallBack: TRTTIInfoObjectPropertyFoundCallBack = nil;
  aEscapeSpecialChars: Boolean = False): AnsiString;

implementation

uses
  TypInfo,
  l3StringList,
  l3Base
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  ,
  Graphics
  ;

// unit methods

function L3FormatRTTIInfo(anObject: TObject;
  aSkipEvents: Boolean = True;
  anObjectPropertyFoundCallBack: TRTTIInfoObjectPropertyFoundCallBack = nil;
  aEscapeSpecialChars: Boolean = False): AnsiString;
//#UC START# *5012C016039F_5012BFDC0300_var*
 function PropAsString(const aProp: TPropInfo): AnsiString;

  function TypeInfoAsString(aType: PTypeInfo): AnsiString;
  begin
   case aType.Kind of
    tkSet: Result := 'set of ' + TypeInfoAsString(GetTypeData(aType).CompType^);
    tkMethod:
     if aSkipEvents
      then raise ERTTIInfoSkipProperty.Create('')
      else Result := aType.Name;
   else
    Result := aType.Name;
   end;
  end;

  function PropValueAsString(aType: PTypeInfo; const aPropName: AnsiString): AnsiString;

   function lGetPropValue(Instance: TObject; const PropName: AnsiString; PreferStrings: Boolean): Variant;

    function lSetToString(PropInfo: PPropInfo; Value: Integer): AnsiString;
    var
     S: TIntegerSet;
     TypeInfo: PTypeInfo;
     I: Integer;
    begin
     Result := '';
     Integer(S) := Value;
     TypeInfo := GetTypeData(PropInfo^.PropType^)^.CompType^;
     for I := 0 to SizeOf(Integer) * 8 - 1 do
      if I in S then
      begin
       if Result <> '' then
        Result := Result + ',';
       Result := Result + Format('%s (%d)', [GetEnumName(TypeInfo, I), I]);
      end;
     if aEscapeSpecialChars
      then Result := Format('\[%s] (%d)', [Result, Value])
      else Result := Format('[%s] (%d)', [Result, Value]);
    end;

   var
    PropInfo: PPropInfo;
   begin
    PropInfo := GetPropInfo(Instance, PropName);
    Assert(Assigned(PropInfo));

    if PropInfo^.PropType^^.Kind = tkSet
     then Result := lSetToString(PropInfo, GetOrdProp(Instance, PropInfo))
     else Result := TypInfo.GetPropValue(Instance, PropName, PreferStrings);
   end;

  var
   l_Obj: TObject;
   l_Interface: IInterface;
   l_Dummy: String;
   l_Color: TColor;
   l_Int: Integer;
  begin
   if aType.Kind = tkInterface then
   begin
    l_Interface := GetInterfaceProp(anObject, aPropName);
    if Assigned(l_Interface)
     then Result := '$' + IntToHex(Integer(l_Interface), 8)
     else Result := 'nil';
   end else
   begin
    case aType.Kind of
     tkInteger:
      if aType.Name = 'TColor' then
      begin
       l_Color := GetOrdProp(anObject, aPropName);

       if ColorToIdent(l_Color, l_Dummy)
        then Result := Format('%s ($%.8x)', [l_Dummy, l_Color])
        else Result := Format('$%.8x', [l_Color]);
      end else
      if aType.Name = 'TCursor' then
      begin
       l_Int := GetOrdProp(anObject, aPropName);


       {$If Declared(CursorToString)}
       l_Dummy := CursorToString(l_Int);
       {$Else}
       Assert(false);
       {$IfEnd}
       if Length(l_Dummy) > 0
        then Result := Format('%s (%d)', [l_Dummy, l_Int])
        else Result := IntToStr(l_Int);
      end else
       Result := lGetPropValue(anObject, aPropName, True);
       
     tkChar:
      begin
       l_Int := GetOrdProp(anObject, aPropName);
       Result := Format('''%s'' (#%d)', [Char(l_Int), l_Int]);
      end;

     tkWChar:
      begin
       l_Int := GetOrdProp(anObject, aPropName);
       Result := Format('''%s'' (#$%.4x)', [WideChar(l_Int), l_Int]);
      end;

     tkString,
     tkLString,
     tkWString: Result := '''' + lGetPropValue(anObject, aPropName, True) + '''';

     tkSet,
     tkArray,
     tkEnumeration:
      begin
       Result := lGetPropValue(anObject, aPropName, True);
       l_Dummy := lGetPropValue(anObject, aPropName, False);
       if not SameText(Result, l_Dummy) then
        Result := Format('%s (%s)', [Result, l_Dummy]);
      end;
      
     tkClass:
      begin
       l_Obj := GetObjectProp(anObject, aPropName);
       if Assigned(l_Obj) then
       begin
        Result := '$' + IntToHex(Integer(l_Obj), 8);
        if Assigned(anObjectPropertyFoundCallBack) then
         anObjectPropertyFoundCallBack(l_Obj, Result);
       end
       else
        Result := 'nil';
      end;                                   
    else
     Result := lGetPropValue(anObject, aPropName, True);
    end;
   end;
  end;

 var
  l_Name, l_Type, l_Value: AnsiString;
 begin
  try
   l_Name := aProp.Name;
   l_Type := TypeInfoAsString(aProp.PropType^);
   l_Value := PropValueAsString(aProp.PropType^, l_Name);
   Result := Format('%s: %s = %s', [l_Name, l_Type, l_Value]);
  except
   on ERTTIInfoSkipProperty do
    Result := '';
   on E:Exception do
   begin
    Result := Format('%s: %s = %s', [l_Name, l_Type, E.Message]);
    //E.Message := E.Message + Format(#13#10'На св-ве: %s: %s.', [aProp.Name, l_Type]);
    //raise E;
   end;
  end;
 end;

var
 I, l_Count: Integer;
 l_List: PPropList;
 l_Prop: AnsiString;
 l_SL: Tl3StringList;
//#UC END# *5012C016039F_5012BFDC0300_var*
begin
//#UC START# *5012C016039F_5012BFDC0300_impl*
 Result := '';
 l_Count := GetPropList(anObject, l_List);
 if l_Count > 0 then
 try
  l_SL := Tl3StringList.Make;
  try
   for I := 0 to l_Count - 1 do
   begin
    l_Prop := PropAsString(l_List^[I]^);
    if Length(l_Prop) > 0 then
     l_SL.Add(l_Prop + ';');
   end;
   l_SL.Sort;
   for I := 0 to l_SL.Count - 1 do
   begin
    Result := Result + l_SL[I].AsString;
    if I < l_SL.Count - 1 then
     Result := Result + #13#10;
   end;
  finally
   l3Free(l_SL);
  end;
 finally
  FreeMem(l_List);
 end;
//#UC END# *5012C016039F_5012BFDC0300_impl*
end;//L3FormatRTTIInfo

end.