"! My solution to the abap Narcissistic (aka Armstrong) Numbers
"! https://blogs.sap.com/2021/03/20/another-abap-puzzle-narcissistic-numbers
report Z_ARMSTRONG_NUMBER_FINDER no standard page heading.

class LCL_START definition
  final
  create public .

  public section.
    methods MAIN.
endclass.

class LCL_START implementation.
  method MAIN.
    types TT_ARMSTRONG_NUMBER type sorted table of I with unique key TABLE_LINE.
    data MAX_DIGITS type N length 1 value 5.

    CL_DEMO_INPUT=>REQUEST( exporting TEXT = |Max Digits| changing FIELD = MAX_DIGITS ).
    data(MAX_NUMBER) = IPOW( BASE = 10 EXP = MAX_DIGITS ).

    CL_DEMO_OUTPUT=>DISPLAY(
      NAME = |Armstrong numbers in [0,{ MAX_NUMBER number = user }]|
      DATA = value TT_ARMSTRONG_NUMBER(
                for N = 0 while N < MAX_NUMBER
                for M = 1
                  while M = 1
                        and N = reduce I(
                                  let STR = |{ N }|
                                      LEN = STRLEN( STR ) in
                                  init SUM = 0
                                  for OFF = 0 while OFF < LEN
                                  next SUM += IPOW( BASE = STR+OFF(1) EXP = LEN ) )
                ( N ) ) ).

  endmethod.

endclass.

start-of-selection.
  new LCL_START( )->MAIN( ).
