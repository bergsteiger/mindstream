unit afwFont;

{$IfDef DesignTimeLibrary}
{.$WEAKPACKAGEUNIT ON}
{$EndIf DesignTimeLibrary}

 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  afwInterfaces,
  Graphics,
  l3Interfaces,
  l3PureMixIns
  ;

type
 _l3Castable_Parent_ = TFont;
 {$Include w:\common\components\rtl\Garant\L3\l3Castable.imp.pas}
 TafwCastableFont = class(_l3Castable_)
  {* ״נטפע ס QueryInterface. }
 end;//TafwCastableFont

 _l3Unknown_Parent_ = TafwCastableFont;
 {$Include w:\common\components\rtl\Garant\L3\l3Unknown.imp.pas}
 TafwFontI = class(_l3Unknown_, IafwFont)
 private
 // private fields
   f_BackColor : TafwColor;
   f_Index : TafwFontIndex;
 protected
 // realized methods
   function Get_ForeColor: Tl3Color;
   procedure Set_ForeColor(aValue: Tl3Color);
   function Get_BackColor: Tl3Color;
   procedure Set_BackColor(aValue: Tl3Color);
   function Get_Name: TFontName;
   procedure Set_Name(const aValue: TFontName);
   function Get_Pitch: TFontPitch;
   procedure Set_Pitch(aValue: TFontPitch);
   function Get_Size: Integer;
   procedure Set_Size(aValue: Integer);
   function Get_Index: Tl3FontIndex;
   procedure Set_Index(aValue: Tl3FontIndex);
   function Get_Style: TFontStyles;
   procedure Set_Style(aValue: TFontStyles);
   function Get_Bold: Boolean;
   procedure Set_Bold(aValue: Boolean);
   function Get_Italic: Boolean;
   procedure Set_Italic(aValue: Boolean);
   function Get_Underline: Boolean;
   procedure Set_Underline(aValue: Boolean);
   function Get_Strikeout: Boolean;
   procedure Set_Strikeout(aValue: Boolean);
   procedure Assign2Font(aFont: TFont);
 public
 // public methods
   constructor Create; reintroduce; virtual;
   class function Make: IafwFont; reintroduce;
 end;//TafwFontI

//#UC START# *47E1233D01CDci*
//#UC END# *47E1233D01CDci*
 TafwFont = class(TafwFontI)
 public
 // overridden public methods
   constructor Create; override;
 protected
 // protected methods
   function NameStored: Boolean;
   function HeightStored: Boolean;
//#UC START# *47E1233D01CDpubl*
 published
 // published propreties
   property Charset
     default CS_RUSSIAN;
     {-}
   property Name
     stored NameStored;
     {-}
   property Height
     stored HeightStored;
     {-}
   property Color
     default clWindowText;
     {-}
   property Style
     default [];
     {-}
   property Size
     stored false;
     {-}
//#UC END# *47E1233D01CDpubl*
 end;//TafwFont

 RafwFont = class of TafwFont;

implementation

uses
  SysUtils,
  l3Base,
  l3Core,
  Windows,
  Classes,
  l3MemUtils,
  l3Interlocked
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  
  ;

{$Include w:\common\components\rtl\Garant\L3\l3Castable.imp.pas}

{$Include w:\common\components\rtl\Garant\L3\l3Unknown.imp.pas}

// start class TafwFontI

constructor TafwFontI.Create;
//#UC START# *47E15C42028A_47E1231D0293_var*
//#UC END# *47E15C42028A_47E1231D0293_var*
begin
//#UC START# *47E15C42028A_47E1231D0293_impl*
 inherited Create;
 f_BackColor := clDefault;
//#UC END# *47E15C42028A_47E1231D0293_impl*
end;//TafwFontI.Create

class function TafwFontI.Make: IafwFont;
var
 l_Inst : TafwFontI;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TafwFontI.Get_ForeColor: Tl3Color;
//#UC START# *46A610780340_47E1231D0293get_var*
//#UC END# *46A610780340_47E1231D0293get_var*
begin
//#UC START# *46A610780340_47E1231D0293get_impl*
 Result := Color;
//#UC END# *46A610780340_47E1231D0293get_impl*
end;//TafwFontI.Get_ForeColor

procedure TafwFontI.Set_ForeColor(aValue: Tl3Color);
//#UC START# *46A610780340_47E1231D0293set_var*
//#UC END# *46A610780340_47E1231D0293set_var*
begin
//#UC START# *46A610780340_47E1231D0293set_impl*
 Color := aValue;
//#UC END# *46A610780340_47E1231D0293set_impl*
end;//TafwFontI.Set_ForeColor

function TafwFontI.Get_BackColor: Tl3Color;
//#UC START# *46A6108E017F_47E1231D0293get_var*
//#UC END# *46A6108E017F_47E1231D0293get_var*
begin
//#UC START# *46A6108E017F_47E1231D0293get_impl*
 Result := f_BackColor;
//#UC END# *46A6108E017F_47E1231D0293get_impl*
end;//TafwFontI.Get_BackColor

procedure TafwFontI.Set_BackColor(aValue: Tl3Color);
//#UC START# *46A6108E017F_47E1231D0293set_var*
//#UC END# *46A6108E017F_47E1231D0293set_var*
begin
//#UC START# *46A6108E017F_47E1231D0293set_impl*
 f_BackColor := aValue;
//#UC END# *46A6108E017F_47E1231D0293set_impl*
end;//TafwFontI.Set_BackColor

function TafwFontI.Get_Name: TFontName;
//#UC START# *46A610AF012C_47E1231D0293get_var*
//#UC END# *46A610AF012C_47E1231D0293get_var*
begin
//#UC START# *46A610AF012C_47E1231D0293get_impl*
 Result := Name;
//#UC END# *46A610AF012C_47E1231D0293get_impl*
end;//TafwFontI.Get_Name

procedure TafwFontI.Set_Name(const aValue: TFontName);
//#UC START# *46A610AF012C_47E1231D0293set_var*
//#UC END# *46A610AF012C_47E1231D0293set_var*
begin
//#UC START# *46A610AF012C_47E1231D0293set_impl*
 Name := aValue;
//#UC END# *46A610AF012C_47E1231D0293set_impl*
end;//TafwFontI.Set_Name

function TafwFontI.Get_Pitch: TFontPitch;
//#UC START# *46A610E10084_47E1231D0293get_var*
//#UC END# *46A610E10084_47E1231D0293get_var*
begin
//#UC START# *46A610E10084_47E1231D0293get_impl*
 Result := Pitch;
//#UC END# *46A610E10084_47E1231D0293get_impl*
end;//TafwFontI.Get_Pitch

procedure TafwFontI.Set_Pitch(aValue: TFontPitch);
//#UC START# *46A610E10084_47E1231D0293set_var*
//#UC END# *46A610E10084_47E1231D0293set_var*
begin
//#UC START# *46A610E10084_47E1231D0293set_impl*
 Pitch := aValue;
//#UC END# *46A610E10084_47E1231D0293set_impl*
end;//TafwFontI.Set_Pitch

function TafwFontI.Get_Size: Integer;
//#UC START# *46A6111000F9_47E1231D0293get_var*
//#UC END# *46A6111000F9_47E1231D0293get_var*
begin
//#UC START# *46A6111000F9_47E1231D0293get_impl*
 Result := Size;
//#UC END# *46A6111000F9_47E1231D0293get_impl*
end;//TafwFontI.Get_Size

procedure TafwFontI.Set_Size(aValue: Integer);
//#UC START# *46A6111000F9_47E1231D0293set_var*
//#UC END# *46A6111000F9_47E1231D0293set_var*
begin
//#UC START# *46A6111000F9_47E1231D0293set_impl*
 Size := aValue;
//#UC END# *46A6111000F9_47E1231D0293set_impl*
end;//TafwFontI.Set_Size

function TafwFontI.Get_Index: Tl3FontIndex;
//#UC START# *46A61136020C_47E1231D0293get_var*
//#UC END# *46A61136020C_47E1231D0293get_var*
begin
//#UC START# *46A61136020C_47E1231D0293get_impl*
 Result := f_Index;
//#UC END# *46A61136020C_47E1231D0293get_impl*
end;//TafwFontI.Get_Index

procedure TafwFontI.Set_Index(aValue: Tl3FontIndex);
//#UC START# *46A61136020C_47E1231D0293set_var*
//#UC END# *46A61136020C_47E1231D0293set_var*
begin
//#UC START# *46A61136020C_47E1231D0293set_impl*
 f_Index := aValue;
//#UC END# *46A61136020C_47E1231D0293set_impl*
end;//TafwFontI.Set_Index

function TafwFontI.Get_Style: TFontStyles;
//#UC START# *46A6127B0282_47E1231D0293get_var*
//#UC END# *46A6127B0282_47E1231D0293get_var*
begin
//#UC START# *46A6127B0282_47E1231D0293get_impl*
 Result := Style;
//#UC END# *46A6127B0282_47E1231D0293get_impl*
end;//TafwFontI.Get_Style

procedure TafwFontI.Set_Style(aValue: TFontStyles);
//#UC START# *46A6127B0282_47E1231D0293set_var*
//#UC END# *46A6127B0282_47E1231D0293set_var*
begin
//#UC START# *46A6127B0282_47E1231D0293set_impl*
 Style := aValue;
//#UC END# *46A6127B0282_47E1231D0293set_impl*
end;//TafwFontI.Set_Style

function TafwFontI.Get_Bold: Boolean;
//#UC START# *46A6129101E3_47E1231D0293get_var*
//#UC END# *46A6129101E3_47E1231D0293get_var*
begin
//#UC START# *46A6129101E3_47E1231D0293get_impl*
 Result := (fsBold in Style);
//#UC END# *46A6129101E3_47E1231D0293get_impl*
end;//TafwFontI.Get_Bold

procedure TafwFontI.Set_Bold(aValue: Boolean);
//#UC START# *46A6129101E3_47E1231D0293set_var*
//#UC END# *46A6129101E3_47E1231D0293set_var*
begin
//#UC START# *46A6129101E3_47E1231D0293set_impl*
 if aValue then
  Style := Style + [fsBold]
 else
  Style := Style - [fsBold];
//#UC END# *46A6129101E3_47E1231D0293set_impl*
end;//TafwFontI.Set_Bold

function TafwFontI.Get_Italic: Boolean;
//#UC START# *46A612AF0038_47E1231D0293get_var*
//#UC END# *46A612AF0038_47E1231D0293get_var*
begin
//#UC START# *46A612AF0038_47E1231D0293get_impl*
 Result := (fsItalic in Style);
//#UC END# *46A612AF0038_47E1231D0293get_impl*
end;//TafwFontI.Get_Italic

procedure TafwFontI.Set_Italic(aValue: Boolean);
//#UC START# *46A612AF0038_47E1231D0293set_var*
//#UC END# *46A612AF0038_47E1231D0293set_var*
begin
//#UC START# *46A612AF0038_47E1231D0293set_impl*
 if aValue then
  Style := Style + [fsItalic]
 else
  Style := Style - [fsItalic];
//#UC END# *46A612AF0038_47E1231D0293set_impl*
end;//TafwFontI.Set_Italic

function TafwFontI.Get_Underline: Boolean;
//#UC START# *46A612C302D6_47E1231D0293get_var*
//#UC END# *46A612C302D6_47E1231D0293get_var*
begin
//#UC START# *46A612C302D6_47E1231D0293get_impl*
 Result := (fsUnderline in Style);
//#UC END# *46A612C302D6_47E1231D0293get_impl*
end;//TafwFontI.Get_Underline

procedure TafwFontI.Set_Underline(aValue: Boolean);
//#UC START# *46A612C302D6_47E1231D0293set_var*
//#UC END# *46A612C302D6_47E1231D0293set_var*
begin
//#UC START# *46A612C302D6_47E1231D0293set_impl*
 if aValue then
  Style := Style + [fsUnderline]
 else
  Style := Style - [fsUnderline];
//#UC END# *46A612C302D6_47E1231D0293set_impl*
end;//TafwFontI.Set_Underline

function TafwFontI.Get_Strikeout: Boolean;
//#UC START# *46A612DC01F5_47E1231D0293get_var*
//#UC END# *46A612DC01F5_47E1231D0293get_var*
begin
//#UC START# *46A612DC01F5_47E1231D0293get_impl*
 Result := (fsStrikeout in Style);
//#UC END# *46A612DC01F5_47E1231D0293get_impl*
end;//TafwFontI.Get_Strikeout

procedure TafwFontI.Set_Strikeout(aValue: Boolean);
//#UC START# *46A612DC01F5_47E1231D0293set_var*
//#UC END# *46A612DC01F5_47E1231D0293set_var*
begin
//#UC START# *46A612DC01F5_47E1231D0293set_impl*
 if aValue then
  Style := Style + [fsStrikeout]
 else
  Style := Style - [fsStrikeout];
//#UC END# *46A612DC01F5_47E1231D0293set_impl*
end;//TafwFontI.Set_Strikeout

procedure TafwFontI.Assign2Font(aFont: TFont);
//#UC START# *473DAA0F01C7_47E1231D0293_var*
//#UC END# *473DAA0F01C7_47E1231D0293_var*
begin
//#UC START# *473DAA0F01C7_47E1231D0293_impl*
 if (aFont <> nil) then
  aFont.Assign(Self);
//#UC END# *473DAA0F01C7_47E1231D0293_impl*
end;//TafwFontI.Assign2Font
// start class TafwFont

function TafwFont.NameStored: Boolean;
//#UC START# *47E15C740102_47E1233D01CD_var*
//#UC END# *47E15C740102_47E1233D01CD_var*
begin
//#UC START# *47E15C740102_47E1233D01CD_impl*
 Result := (Name <> DefFontData.Name) AND (Name <> 'Arial') AND (Name <> 'Segoe UI');
//#UC END# *47E15C740102_47E1233D01CD_impl*
end;//TafwFont.NameStored

function TafwFont.HeightStored: Boolean;
//#UC START# *47E15C7F03CD_47E1233D01CD_var*
//#UC END# *47E15C7F03CD_47E1233D01CD_var*
begin
//#UC START# *47E15C7F03CD_47E1233D01CD_impl*
 Result := (Size <> 11) AND (Size <> 10){(Height <> DefFontData.Height)};
//#UC END# *47E15C7F03CD_47E1233D01CD_impl*
end;//TafwFont.HeightStored

constructor TafwFont.Create;
//#UC START# *47E15C42028A_47E1233D01CD_var*
//#UC END# *47E15C42028A_47E1233D01CD_var*
begin
//#UC START# *47E15C42028A_47E1233D01CD_impl*
 inherited;
 Color := clWindowText;
(* if (Win32Platform = VER_PLATFORM_WIN32_NT) then
 begin
  if (Win32MajorVersion >= 6) then
  // - Vista
   Name := 'Segoe UI'
  else
   Name := 'Arial';
 end//Win32Platform = VER_PLATFORM_WIN32_NT
 else*)
  Name := 'Arial';
(* if (Name = 'Segoe UI') then
  Size := 10
 else
  {$IfDef Nemesis}
  Size := 10;
  {$Else  Nemesis}
  Size := 11;
  {$EndIf Nemesis}*)
 {$IfNDef DesignTimeLibrary}
 if (Screen.PixelsPerInch > 96) then
  Size := 9
 else
 {$EndIf  DesignTimeLibrary}
  Size := 10;
 CharSet := RUSSIAN_CHARSET;
//#UC END# *47E15C42028A_47E1233D01CD_impl*
end;//TafwFont.Create

//#UC START# *47E1233D01CDimpl*
//#UC END# *47E1233D01CDimpl*

end.