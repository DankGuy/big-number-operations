unit BigNumber.TestCase;

interface

uses TestFramework;

type
  TTestCase_BigNumber = class(TTestCase)
  published
    procedure Test1;
    procedure Test2;
    procedure Test3;
    procedure Test4;
    procedure Test5;
    procedure Test6;

    procedure Test7;
    procedure Test8;
    procedure Test9;
    procedure Test10;
    procedure Test11;
    procedure Test12;
    procedure Test13;
    procedure Test14;

    procedure sub1;
    procedure sub2;
    procedure sub3;
    procedure sub4;
    procedure sub5;
    procedure sub6;
    procedure sub7;
    procedure sub8;

    procedure mix;
  end;

implementation

uses BigNumber;

procedure TTestCase_BigNumber.Test1;
begin
//  var A := TArray<string>.Create(
//    '91836183501283764581273618235123213412345119873518723651712359'
//  , '56747865283465819768134812736518263471246532341234'
//  );

    var A: TBigNumber := '91836183501283764581273618235123213412345119873518723651712359';
    var B: TBigNumber := '56747865283465819768134812736518263471246532341234';

  CheckEquals('91836183501340512446557084054891348225081638136989970184053593', A + B);
end;

procedure TTestCase_BigNumber.Test2;
begin
//  var A := TArray<string>.Create(
//    '86578742932'
//  , '23469872394672398452983465132751034604395809138759183675981365'
//  , '87568273465871963457813478347861534856137842651378245618732457813245781324576571645812364587123548912365245'
//  );

  var A: TBigNumber := '86578742932';
  var B: TBigNumber := '23469872394672398452983465132751034604395809138759183675981365';
  var C: TBigNumber := '87568273465871963457813478347861534856137842651378245618732457813245781324576571645812364587123548912365245';

  CheckEquals('87568273465871963457813478347861534856137842674848118013404856266229246457327606250208173725882819167089542', A + B + C);
end;

procedure TTestCase_BigNumber.Test3;
begin
//  var A := TArray<string>.Create(
//    '913846913579348673140985712345123412341251435'
//  , '1934586913486578943659813654193657913846513513513'
//  , '69873548672854298759813265981263501934534185130561403561334'
//  , '938461834956183945981345'
//  );

  var A: TBigNumber := '913846913579348673140985712345123412341251435';
  var B: TBigNumber := '1934586913486578943659813654193657913846513513513';
  var C: TBigNumber := '69873548672854298759813265981263501934534185130561403561334';
  var D: TBigNumber := '938461834956183945981345';

  CheckEquals('69873548674789799520213424273596457512902023124004204307627', A + B + C + D);
end;

procedure TTestCase_BigNumber.Test4;
begin
//  var A := TArray<string>.Create(
//    '81'
//  , '810'
//  , '810'
//  , '8100'
//  );

  var A: TBigNumber := '81';
  var B: TBigNumber := '810';
  var C: TBigNumber := '810';
  var D: TBigNumber := '8100';


  CheckEquals('9801', A + B + C + D);
end;

procedure TTestCase_BigNumber.Test5;
begin
//  var A := TArray<string>.Create(
//    '0'
//  , '00'
//  , '000'
//  , '0000'
//  );

  var A: TBigNumber := '0';
  var B: TBigNumber := '00';
  var C: TBigNumber := '000';
  var D: TBigNumber := '0000';
  CheckEquals('0', A + B + C + D);
end;

procedure TTestCase_BigNumber.Test6;
begin
  var A := TArray<string>.Create(
    '0'
  , '00'
  , '000'
  , '1000'
  );

  CheckEquals('1000', Add(A));
end;

procedure TTestCase_BigNumber.Test7;
begin
  CheckEquals('145366832045907875168315832958164125958191015136179367218818603552882596863640710157704473064117060484169038',
  Mul('19873521123513461346143905867189659817324123451325346345134', '7314598713658061381591965136453487563284568324657'));
end;

procedure TTestCase_BigNumber.Test8;
begin
  CheckEquals(
    '1637965163249760910311921515537323904969619447560940648288211295599698484471852831274620424283259211825828133919701063158910164165291939704022825265856110357558466978314481989771421702382443532419993068762166558336668069013375221810'
  , Mul('4681726358923468534516238491278398325182356891723468172341832756132981723457812345891234659817236481234', '349863498563465801350193658916435901846513647589134658136459187364586345896342856823945982346598234659823465982346789243678972465')
  )
end;

procedure TTestCase_BigNumber.Test9;
begin
  CheckEquals(
    '96'
  , Mul('8', '12')
  )
end;

procedure TTestCase_BigNumber.Test10;
begin
  CheckEquals(
    '9801'
  , Mul('99', '99')
  )
end;

procedure TTestCase_BigNumber.Test11;
begin
  CheckEquals(
    '0'
  , Mul('0', '87681248972614896545896142598643852989134258914325981346598')
  );
end;

procedure TTestCase_BigNumber.Test12;
begin
  CheckEquals(
    '92034756923475928734590273845602873502358547698347268924352385'
  , Mul('1', '92034756923475928734590273845602873502358547698347268924352385')
  );
end;

procedure TTestCase_BigNumber.Test13;
begin
  var A : TBigNumber := '0';
  var B : TBigNumber := '92034756923475928734590273845602873502358547698347268924352385';

  CheckEquals(
    '0'
  , A * B
  );
end;

procedure TTestCase_BigNumber.Test14;
begin
  CheckEquals(
    '41956'
  , Mul('1234', '34')
  );
end;

procedure TTestCase_BigNumber.Sub1;
begin
  var A, B: TBigNumber;
  A := '10';
  B := '10';

  CheckEquals('0', A - B);
end;

procedure TTestCase_BigNumber.Sub2;
begin
  var A, B: TBigNumber;
  A := '95';
  B := '5';

  CheckEquals('90', A - B);
end;

procedure TTestCase_BigNumber.Sub3;
begin
  var A, B: TBigNumber;
  A := '9375923876908789475369082697048528903590237459023455';
  B := '98769857693456907290387459238745902386479238067290384759203745902837590238769023476';

  CheckEquals('-98769857693456907290387459238736526462602329277815015676506697373934000001310000021', A - B);
end;


procedure TTestCase_BigNumber.Sub4;
begin
  var A, B: TBigNumber;
  A := '1';
  B := '10000000000000000000000000000000000000000000000000000000000000000000000000000';

  CheckEquals('-9999999999999999999999999999999999999999999999999999999999999999999999999999', A - B);
end;

procedure TTestCase_BigNumber.Sub5;
begin
  var A, B: TBigNumber;
  A := '0';
  B := '1';

  CheckEquals('-1', A - B);
end;

procedure TTestCase_BigNumber.Sub6;
begin
  var A, B: TBigNumber;
  A := '1353453249284769278346902384759043';
  B := '1353453249284769278346902384759043';

  CheckEquals('0', A - B);
end;

procedure TTestCase_BigNumber.Sub7;
begin
  var A, B: TBigNumber;
  A := '51325';
  B := '51326';

  CheckEquals('-1', A - B);
end;

procedure TTestCase_BigNumber.Sub8;
begin
  var A, B: TBigNumber;
  A := '513257';
  B := '513168';

  CheckEquals('89', A - B);
end;

procedure TTestCase_BigNumber.Mix;
begin
  var A: TBigNumber := '982734589437609238742398746982476023455';
  var B := A * A - '97394857209347' + '9023490273432844242344906324' * A;
  CheckEquals('965767273285974087956886351327537099092305719613860178231010797020332854757098', B);
end;


initialization
  RegisterTest(TTestCase_BigNumber.Suite);
end.

