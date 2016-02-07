unit l3LogFont;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  Windows,

  l3Interfaces,
  l3PrimString,
  l3CustomString
  ;

type
  Tl3LogFont = class(Tl3PrimString{Tl3CustomString})
   {* Описатель шрифта системы. }
    private
    // property fields
      f_NameLen    : Integer;  
      f_LogFont    : TEnumLogFont;
      f_TextMetric : TTextMetric;
    protected
    // property methods
      function  GetAsPCharLen: Tl3PCharLenPrim;
        override;
        {-}
    public
    // public methods
      procedure AssignString(P: Tl3PrimString);
        override;
        {-}
      function IsFixed: Boolean;
        {-}
      function IsTrueType: Boolean;
        {-}
      constructor Create(const lpLogFont    : TEnumLogFont;
                         const lpTextMetric : TTextMetric);
        reintroduce;
        {-}
      constructor CreateNamed(const lpLogFont    : TEnumLogFont;
                              const lpTextMetric : TTextMetric;
                              const aName        : AnsiString);
        {-}
    public
    // public properties
      property LogFont: TEnumLogFont
        read f_LogFont;
        {-}
      property TextMetric: TTextMetric
        read f_TextMetric;
        {-}
  end;//Tl3LogFont

implementation

uses
  SysUtils,
  
  l3String,
  l3FontTools,
  l3Base
  ;

// start class Tl3LogFont

constructor Tl3LogFont.Create(const lpLogFont    : TEnumLogFont;
                              const lpTextMetric : TTextMetric);
  //reintroduce;
  {-}
begin
 inherited Create;
 Self.f_LogFont := lpLogFont;
 Self.f_NameLen := StrLen(Self.f_LogFont.elfLogFont.lfFaceName);
 Self.f_TextMetric := lpTextMetric;
 if l3IsDefaultCharset(Self.f_LogFont.elfLogFont.lfCharSet) then
  Self.f_LogFont.elfLogFont.lfCharSet := CS_Effective;
end;

constructor Tl3LogFont.CreateNamed(const lpLogFont    : TEnumLogFont;
                                   const lpTextMetric : TTextMetric;
                                   const aName        : AnsiString);
  {-}
{$IfDef XE}
var
 l_WS : String;
{$EndIf XE}
begin
 Create(lpLogFont, lpTextMetric);
 {$IfDef XE}
 l_WS := aName;
 l3Move(l_WS[1], f_LogFont.elfLogFont.lfFaceName[0], Length(l_WS) * SizeOf(Char));
 {$Else XE}
 l3Move(aName[1], f_LogFont.elfLogFont.lfFaceName[0], Length(aName));
 {$EndIf XE}
 f_NameLen := Length(aName);
end;

function Tl3LogFont.GetAsPCharLen: Tl3PCharLenPrim;
  //override;
  {-}
begin
 Result := l3PCharLen(f_LogFont.elfLogFont.lfFaceName, f_NameLen);
end;

procedure Tl3LogFont.AssignString(P: Tl3PrimString);
  {override;}
  {-}
begin
 inherited;
 if (P Is Tl3LogFont) then
 begin
  Assert(false, 'А нужно ли такое присваивание константных объектов?');
  f_LogFont := Tl3LogFont(P).f_LogFont;
  f_TextMetric := Tl3LogFont(P).f_TextMetric;
 end;//P Is Tl3LogFont
end;

function Tl3LogFont.IsFixed: Boolean;
  {-}
begin
 Result := not
           // http://mdp.garant.ru/pages/viewpage.action?pageId=296632270&focusedCommentId=296633958#comment-296633958
           ((f_TextMetric.tmPitchAndFamily AND TMPF_FIXED_PITCH) <> 0);
end;

function Tl3LogFont.IsTrueType: Boolean;
  {-}
begin
 Result := (f_TextMetric.tmPitchAndFamily AND TMPF_TRUETYPE) <> 0;
end;

end.