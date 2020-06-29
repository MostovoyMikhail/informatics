unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls;

type
  TSegment=record
A, B: TPoint;
end;

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  T: array of TSegment;

implementation

{$R *.lfm}

{ TForm1 }
function GetDistance (S: TSegment): Real;
begin
GetDistance:=sqrt(sqr(S.A.x-S.B.x)+sqr(S.A.y-S.B.y));
end;

procedure TForm1.Button1Click(Sender: TObject);
var IMin, IMax, I: Integer;
begin
  SetLength(T,Length(T)+1);
T[Length(T)-1].A.x:=StrToInt(Edit1.text);
T[Length(T)-1].A.y:=StrToInt(Edit2.text);
T[Length(T)-1].B.x:=StrToInt(Edit3.text);
T[Length(T)-1].B.y:=StrToInt(Edit4.text);

IMin:=0;
IMax:=0;

Image1.Canvas.Brush.Style:=BsSolid;
Image1.Canvas.Pen.Style:=PsSolid;
Image1.Canvas.Brush.Color:=ClWhite;
Image1.Canvas.Pen.Color:=ClWhite;
Image1.Canvas.Pen.Width:=1;
Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);

for I:=1 to Length(T)-1 do
begin
if GetDistance(T[I])<GetDistance(T[IMin]) then
IMin:=I;
if GetDistance(T[I])>GetDistance(T[IMax]) then
IMax:=I;
end;

for I:=0 to Length(T)-1 do
begin
Image1.Canvas.Pen.Color:=ClBlack;
Image1.Canvas.Brush.Color:=ClBlack;
if I=IMin then
begin
Image1.Canvas.Pen.Color:=ClBlue;
Image1.Canvas.Brush.Color:=ClBlue;
end;
if I=IMax then
begin
Image1.Canvas.Pen.Color:=ClRed;
Image1.Canvas.Brush.Color:=ClRed;
end;
Image1.Canvas.MoveTo(T[I].A);
Image1.Canvas.LineTo(T[I].B);
Image1.Canvas.Ellipse(T[I].A.x-3, T[I].A.y-3, T[I].A.x+3, T[I].A.y+3);
Image1.Canvas.Ellipse(T[I].B.x-3, T[I].B.y-3, T[I].B.x+3, T[I].B.y+3);
end;
end;

end.

