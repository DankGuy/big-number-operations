unit BigNumber;

interface

function Add(Values: array of string): string;
function Mul(a, b: string): string;

type
  TBigNumber = record
    private
      FValue: string;
    public
      class operator Implicit(value: string): TBigNumber;
      class operator Implicit(value: TBigNumber): string;
      class operator Add(aValue, bValue : TBigNumber): TBigNumber;
      class operator Subtract(aValue, bValue: TBigNumber): TBigNumber;
      class operator Multiply(aValue, bValue : TBigNumber): TBigNumber;
  end;


implementation

uses System.SysUtils;

class operator TBigNumber.Implicit(value: string): TBigNumber;
begin
  Result.FValue := value;
end;

class operator TBigNumber.Implicit(value: TBigNumber): string;
begin
  Result := value.FValue;
end;

class operator TBigNumber.Add(aValue, bValue : TBigNumber): TBigNumber;
begin
  var indexA := Length(aValue);
  var indexB := Length(bValue);
  var carry := 0;
  var sum := 0;
  var char1, char2: char;
  var allZero := true;

  result := '';

  while (indexA > 0 ) or (indexB > 0) do
  begin
    if (indexA > 0) then
      char1 := aValue.FValue[indexA]
    else
      char1 := '0';

    if (indexB > 0) then
      char2 := bValue.FValue[indexB]
    else
      char2 := '0';

    sum := (Ord(char1) - Ord('0')) + (Ord(char2) - Ord('0')) + carry;
    var remainder := sum mod 10;
    carry := sum div 10;

    if (remainder > 0) or (carry > 0)  then allZero := false;


    indexA := indexA - 1;
    indexB := indexB - 1;

    result := chr(remainder + Ord('0')) + result.FValue;
  end;
  if carry > 0 then result := '1' + result.FValue;
  if allZero then result := '0';
end;

class operator TBigNumber.Subtract(aValue, bValue : TBigNumber): TBigNumber;
begin
  var lenA := Length(aValue);
  var lenB := Length(bValue);
  var indexA := lenA;
  var indexB := lenB;
  var borrowed := 0;
  var isNegative := false;

  Result := '';

  // handle negative calculation (flip)
  if (lenA < lenB) then isNegative := true
  else if (lenA = lenB) then
    begin
      for var i := 1 to lenA do
        begin
          if (StrToInt(aValue.FValue[i]) > StrToInt(bValue.FValue[i])) then break
          else if (StrToInt(aValue.FValue[i]) < StrToInt(bValue.FValue[i])) then
          begin
            isNegative := true;
            break;
          end;
        end;
    end;

  if isNegative then
    begin
      var temp_value := aValue;
      aValue := bValue;
      bValue := temp_value;
      lenA := Length(aValue);
      lenB := Length(bValue);
      indexA := lenA;
      indexB := lenB;
    end;

  for var i := lenA downto 1 do
    begin
      // check whether the index is the low
      var a, b: integer;

      if indexA > 0 then a := StrToInt(aValue.FValue[indexA])
      else a := 0;
      if indexB > 0 then b := StrToInt(bValue.FValue[indexB])
      else b := 0;

      if (borrowed > 0) then
      begin
        a:= a - borrowed;
        borrowed := 0;
      end;

      // check if a is larger than b
      if a < b then
        begin
          a := a + 10;
          Inc(borrowed);
        end;

      Result.FValue := IntToStr(a - b) + Result.FValue;
      Dec(indexA);
      Dec(indexB);
    end;

  // check zeros
  while Length(result.FValue) > 1 do
    if (result.FValue[1] = '0') then result.FValue := result.FValue.Remove(0, 1)
    else break;

  if isNegative then
    Result.FValue := '-' + Result.FValue;
end;

class operator TBigNumber.Multiply(aValue, bValue : TBigNumber): TBigNumber;
begin
  var temp := '';
  var mul := 0;
  var carry := 0;
  var remainder := 0;
  var output_arr: TArray<String>;
  SetLength(output_arr, Length(bValue));

    // b * a
    // the length of the b will determine how many addition needed to be done or vice versa
    for var i := Length(bValue) downto 1 do
    begin
      // reset values
      temp := '';
      carry := 0;

      for var j := Length(aValue) downto 1 do
        begin
          mul := StrToInt(bValue.FValue[i]) * StrToInt(aValue.FValue[j]) + carry;
          remainder := mul mod 10;
          carry := mul div 10;
          temp := IntToStr(remainder) + temp;
        end;                                    

        // to add back the carry for last char in the number
        if carry > 0 then temp := IntToStr(carry) + temp;

       // add 0 to the back of the numbers
       for var k := 1 to Length(bValue) - i do
          temp := temp + '0';

       output_arr[i-1] := temp;
       result.FValue := Add(output_arr);
    end;

end;

// 91836
//    45
function Add2Nums(num1: string; num2: string): string;
begin
  var indexA := Length(num1);
  var indexB := Length(num2);
  var carry := 0;
  var sum := 0;
  var char1, char2: char;
  var allZero := true;

  result := '';

  while (indexA > 0 ) or (indexB > 0) do
  begin
    if (indexA > 0) then
      char1 := num1[indexA]
    else
      char1 := '0';

    if (indexB > 0) then
      char2 := num2[indexB]
    else
      char2 := '0';

    sum := (Ord(char1) - Ord('0')) + (Ord(char2) - Ord('0')) + carry;
    var remainder := sum mod 10;
    carry := sum div 10;

    if (remainder > 0) or (carry > 0)  then allZero := false;


    indexA := indexA - 1;
    indexB := indexB - 1;

    result := chr(remainder + Ord('0')) + result;
  end;
  if carry > 0 then result := '1' + result;
  if allZero then result := '0';

end;

function Mul(a, b: string): string;
begin
  var temp := '';
  var mul := 0;
  var carry := 0;
  var remainder := 0;
  var output_arr: TArray<String>;
  SetLength(output_arr, Length(b));

    // b * a
    // the length of the b will determine how many addition needed to be done or vice versa
    for var i := Length(b) downto 1 do
    begin
      // reset values
      temp := '';
      carry := 0;

      for var j := Length(a) downto 1 do
        begin
          mul := StrToInt(b[i]) * StrToInt(a[j]) + carry;
          remainder := mul mod 10;
          carry := mul div 10;
          temp := IntToStr(remainder) + temp;
        end;

        // to add back the carry for last char in the number
        if carry > 0 then temp := IntToStr(carry) + temp;

       // add 0 to the back of the numbers
       for var k := 1 to Length(b) - i do
          temp := temp + '0';

       output_arr[i-1] := temp;
       result := Add(output_arr);
    end;


End;


function Add(Values: array of string): string;
begin
  var len := Length(Values);
  var temp := '';

  if len = 0 then
    result := '0'
  else if len = 1 then
    result := Values[0]
  else
  // 0+1
    temp := Add2Nums(Values[0], Values[1]);
    // 0 + 1 + 2 0+1+2+3
    for var i := 2 to len - 1 do
      temp := Add2Nums(temp, Values[i]);
    result := temp;
end;
end.
