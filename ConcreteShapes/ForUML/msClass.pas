unit msClass;

interface

uses
 msInterfaces,
 msRectangle
 ;

type
 TmsClass = class(TmsRectangle)
 protected
  procedure DoDrawTo(const aCtx: TmsDrawContext); override;
  function Stereotype: String;
 end;//TmsClass

implementation

uses
 System.Types,
 FMX.Graphics,
 FMX.Types
 ;

procedure TmsClass.DoDrawTo(const aCtx: TmsDrawContext);
var
 l_R : TRectF;
 l_R1 : TRectF;
 l_S : String;
begin
 inherited;
 l_R := DrawBounds;
 aCtx.rCanvas.DrawLine(TPointF.Create(l_R.Left, l_R.Top + l_R.Height / 3),
                       TPointF.Create(l_R.Right, l_R.Top + l_R.Height / 3), 1);
 aCtx.rCanvas.DrawLine(TPointF.Create(l_R.Left, l_R.Top +  2 * l_R.Height / 3),
                       TPointF.Create(l_R.Right, l_R.Top + 2 * l_R.Height / 3), 1);
 l_S := '<< ' + Stereotype + ' >>';

 l_R1 := TRectF.Create(l_R.Left, l_R.Top, l_R.Right, l_R.Top + l_R.Height / 3);

 aCtx.rCanvas.Fill.Color :=  aCtx.rCanvas.Stroke.Color;
 aCtx.rCanvas.FillText(l_R1,
                       l_S,
                       false,
                       1,
                       [],
                       TTextAlign.Center,
                       TTextAlign.Center);
end;

function TmsClass.Stereotype: String;
begin
 Result := ClassName;
 Result := Copy(Result, 4, Length(Result) - 3);
end;

end.
