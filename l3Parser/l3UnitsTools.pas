unit l3UnitsTools;
 
{$Include l3Define.inc}

interface

function EvInch2Char(aPixel: LongInt): LongInt;
function EvChar2Inch(aChar: LongInt): LongInt;
function L3Cm2Inch(aCm: LongInt): LongInt;
function EvPixel2Cm(anInch: LongInt): LongInt;
function EvCellWidthEpsilon: Integer;
   {* Погрешность выравнивания ячеек в дюймах (соотвествует ширине символа). }
function EvHalfCellWidthEpsilon: Integer;
function L3FrameLinesDelta: Integer;
   {* Величина, используемая при выравнивании линий в FrameLines }
function EvGetMinimalCellWidth: Integer;
   {* Возвращает минимально допустимую ширину ячейки. }

implementation

uses
  l3Math,
  l3Defaults,
  l3Const
  ;

const
  { CharConst }
 cnMaxPredefChars = 73;

var g_CWEpsilon : Integer = 0;

var g_CWEpsilon_div2 : Integer = 0;

// unit methods

procedure CheckEpsilonParams;
//#UC START# *4F2A42D00142_4A3918BB0114_var*
//#UC END# *4F2A42D00142_4A3918BB0114_var*
begin
//#UC START# *4F2A42D00142_4A3918BB0114_impl*
 if g_CWEpsilon = 0 then
 begin
  g_CWEpsilon := evChar2Inch(1);
  g_CWEpsilon_div2 := g_CWEpsilon div 2;
  //g_BoundAlignment := g_CWEpsilon * 4;
 end; // if g_CWEpsilon = 0 then
//#UC END# *4F2A42D00142_4A3918BB0114_impl*
end;//CheckEpsilonParams

function EvInch2Char(aPixel: LongInt): LongInt;
//#UC START# *4F2A3430033F_4A3918BB0114_var*
//#UC END# *4F2A3430033F_4A3918BB0114_var*
begin
//#UC START# *4F2A3430033F_4A3918BB0114_impl*
 Result := l3MulDiv(aPixel, cnMaxPredefChars, def_inchPrintableWidth);
//#UC END# *4F2A3430033F_4A3918BB0114_impl*
end;//EvInch2Char

function EvChar2Inch(aChar: LongInt): LongInt;
//#UC START# *4F2A3451001B_4A3918BB0114_var*
//#UC END# *4F2A3451001B_4A3918BB0114_var*
begin
//#UC START# *4F2A3451001B_4A3918BB0114_impl*
 Result := l3MulDiv(aChar, def_inchPrintableWidth, cnMaxPredefChars);
//#UC END# *4F2A3451001B_4A3918BB0114_impl*
end;//EvChar2Inch

function L3Cm2Inch(aCm: LongInt): LongInt;
//#UC START# *4F2A348600F9_4A3918BB0114_var*
//#UC END# *4F2A348600F9_4A3918BB0114_var*
begin
//#UC START# *4F2A348600F9_4A3918BB0114_impl*
 Result := l3MulDiv(aCm, l3Inch, l3mmInInch);
//#UC END# *4F2A348600F9_4A3918BB0114_impl*
end;//L3Cm2Inch

function EvPixel2Cm(anInch: LongInt): LongInt;
//#UC START# *4F2A34B20068_4A3918BB0114_var*
//#UC END# *4F2A34B20068_4A3918BB0114_var*
begin
//#UC START# *4F2A34B20068_4A3918BB0114_impl*
 Result := l3MulDiv(anInch, l3mmInInch, l3Inch);
//#UC END# *4F2A34B20068_4A3918BB0114_impl*
end;//EvPixel2Cm

function EvCellWidthEpsilon: Integer;
//#UC START# *4F2A40EA0064_4A3918BB0114_var*
//#UC END# *4F2A40EA0064_4A3918BB0114_var*
begin
//#UC START# *4F2A40EA0064_4A3918BB0114_impl*
 CheckEpsilonParams;
 Result := g_CWEpsilon;
//#UC END# *4F2A40EA0064_4A3918BB0114_impl*
end;//EvCellWidthEpsilon

function EvHalfCellWidthEpsilon: Integer;
//#UC START# *4F2A416E022B_4A3918BB0114_var*
//#UC END# *4F2A416E022B_4A3918BB0114_var*
begin
//#UC START# *4F2A416E022B_4A3918BB0114_impl*
 CheckEpsilonParams;
 Result := g_CWEpsilon_div2;
//#UC END# *4F2A416E022B_4A3918BB0114_impl*
end;//EvHalfCellWidthEpsilon

function L3FrameLinesDelta: Integer;
//#UC START# *4F2A554B0360_4A3918BB0114_var*
//#UC END# *4F2A554B0360_4A3918BB0114_var*
begin
//#UC START# *4F2A554B0360_4A3918BB0114_impl*
 CheckEpsilonParams;
 Result := g_CWEpsilon;
//#UC END# *4F2A554B0360_4A3918BB0114_impl*
end;//L3FrameLinesDelta

function EvGetMinimalCellWidth: Integer;
//#UC START# *5119E20703B0_4A3918BB0114_var*
//#UC END# *5119E20703B0_4A3918BB0114_var*
begin
//#UC START# *5119E20703B0_4A3918BB0114_impl*
 Result := evCellWidthEpsilon;
//#UC END# *5119E20703B0_4A3918BB0114_impl*
end;//EvGetMinimalCellWidth

end.