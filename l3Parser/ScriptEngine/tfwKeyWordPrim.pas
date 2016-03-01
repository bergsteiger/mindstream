unit tfwKeyWordPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Parsing"
// Модуль: "tfwKeyWordPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Parsing::Parser::TtfwKeyWordPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

uses
  l3Interfaces,
  l3Variant
  ;

type
 TtfwKeyWordPrim = {abstract} class(Tl3PrimString)
 private
 // private fields
   f_AsCStr : Il3CString;
    {* Поле для свойства AsCStr}
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   constructor Create(const aKeyword: Il3CString); reintroduce;
 public
 // public properties
   property AsCStr: Il3CString
     read f_AsCStr;
 end;//TtfwKeyWordPrim

implementation

// start class TtfwKeyWordPrim

constructor TtfwKeyWordPrim.Create(const aKeyword: Il3CString);
//#UC START# *55A6967900B3_4FFEEC080367_var*
//#UC END# *55A6967900B3_4FFEEC080367_var*
begin
//#UC START# *55A6967900B3_4FFEEC080367_impl*
 inherited Create;
 f_AsCStr := aKeyword;
//#UC END# *55A6967900B3_4FFEEC080367_impl*
end;//TtfwKeyWordPrim.Create

procedure TtfwKeyWordPrim.ClearFields;
 {-}
begin
 f_AsCStr := nil;
 inherited;
end;//TtfwKeyWordPrim.ClearFields

end.