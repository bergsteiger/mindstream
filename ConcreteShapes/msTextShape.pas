unit msTextShape;

interface

uses
 msShape,
 System.Types,
 FMX.Graphics,
 FMX.Types,
 System.UITypes,
 msInterfaces,
 msRectangle
 ;

type
 TmsTextShape = class(TmsRectangle)
 protected
  class function InitialWidth: Single; override;
  class function InitialHeight: Single; override;
  procedure TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext); override;
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
 end;

implementation

{ TmsTextShape }

procedure TmsTextShape.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_msPointContext: TRectF;
begin
 l_msPointContext := DrawBounds;
 aCtx.rCanvas.FillText(l_msPointContext,
                       'ABC',
                       false,
                       1,
                       [TFillTextFlag.ftRightToLeft],
                       TTextAlign.taCenter,
                       TTextAlign.taCenter);
end;

class function TmsTextShape.InitialHeight: Single;
begin
 Result := 14
end;

class function TmsTextShape.InitialWidth: Single;
begin
 Result := 21;
end;

procedure TmsTextShape.TransformDrawOptionsContext(var theCtx: TmsDrawOptionsContext);
begin
 inherited;
 theCtx.rFillColor := TAlphaColorRec.Black;
end;

end.

