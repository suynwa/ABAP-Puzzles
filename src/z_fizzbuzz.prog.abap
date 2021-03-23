"! My solution to the abap FizzBuzz puzzle
"! https://blogs.sap.com/2021/03/07/puzzles-in-abap-starting-with-fizzbuzz
report Z_FIZZBUZZ no standard page heading.

class LCL_START definition create public.
  public section.
    methods MAIN.
endclass.

class LCL_START implementation.
  method MAIN.
    types TT_OUTPUT type standard table of STRING with empty key.
    data MAX_NUMBER type INT1 value 100.

    CL_DEMO_INPUT=>REQUEST( exporting TEXT = |FizzBuzz upto| changing FIELD = MAX_NUMBER ).

    CL_DEMO_OUTPUT=>DISPLAY(
      NAME = |It's FizzBuzz time|
      DATA = value TT_OUTPUT(
               for I = 1 while I <= MAX_NUMBER
               ( cond #(
                    let J = I mod 3
                        K = I mod 5 in
                    when J = 0 and K = 0 then |FizzBuzz|
                    when J = 0 then |Fizz|
                    when K = 0 then |Buzz|
                    else |{ I }| ) ) ) ).
  endmethod.
endclass.

start-of-selection.
  new LCL_START( )->MAIN( ).
