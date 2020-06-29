program project1;
type
TArray =array of integer;

function GetNewArray (const A: TArray; const T: integer) : TArray;
var
  I: integer;
begin
  for I:=0 to length (A)-1 do
  begin
     if ABS(A[I])<=T then
     begin
       SetLength(GetNewArray, length (GetNewArray)+1);
       GetNewArray[length (GetNewArray)-1]:=A[I] ;
     end;
  end;
end;
var
N, I, T :integer;
A, B:TArray;

begin
  write('N: ');
  readln(N);
  SetLength(A, N);
  for I:=0 to length (A)-1 do
    read(A[I]);
  Readln;

  write('T: ');
  readln(T);

  B:= GetNewArray(A,T);
  for I:=0 to length (B)-1 do
    write(B[I], ' ');
  Readln;

end.
