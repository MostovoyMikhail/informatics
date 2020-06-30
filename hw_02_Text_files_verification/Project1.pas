program project1;
uses
  SysUtils;
type
  Detail=record
  Name: String;
  Number: Integer;
  Weight: Real;
end;
function GetDetail (var F: TextFile): Detail;
var
  I: Integer;
  S, T: String;
begin
  ReadLn(F, S);
  GetDetail.Name:='';
  I:=1;
  while S[I]<>';' do
  begin
    GetDetail.Name+=S[I];
     I+=1;
  end;
  I+=1;
  T:='';
  while S[I]<>';' do
  begin
    T+=S[I];
    I+=1;
  end;
  GetDetail.Number:= StrToInt(T);
  T:='';
  for I:=I+1 to Length(S) do
    T+=S[I];
  GetDetail.Weight:=StrToFloat(T);
end;

var
  FileName: String;
  F: TextFile;
  I: Integer;
  WeightSum: Real;
  Det, MaxDet, MinDet: Detail;
begin
  write('File name: ');
  ReadLn(FileName);
  Assign (F, FileName);
  Reset(F);
  MinDet:=GetDetail(F);
  MaxDet:=MinDet;
  WeightSum:=MinDet.Weight*MinDet.Number;
  while not EOF(F) do
  begin
    Det:=GetDetail(F);
    WeightSum+=Det.Weight*Det.Number;
    if Det.Weight < MinDet.Weight then
      MinDet:=Det;
    if Det.Weight > MaxDet.Weight then
      MaxDet:=Det;
  end;
  WriteLn('Spaceship weight: ', WeightSum:0:6);
  WriteLn('Min detail:', MinDet.Name, ' ', MinDet.Number, ' ', MinDet.Weight:0:6);
  WriteLn('Max detail:', MaxDet.Name, ' ', MaxDet.Number, ' ', MaxDet.Weight:0:6);
  CloseFile(F);
  ReadLn;
end.
