// Lean compiler output
// Module: Metanoia.Nat.Induction
// Imports: Init
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_fib___boxed(lean_object*);
LEAN_EXPORT lean_object* l___private_Metanoia_Nat_Induction_0__Metanoia_Nat_Induction_sumTo_match__1_splitter___rarg(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_sumSquares___boxed(lean_object*);
LEAN_EXPORT lean_object* l___private_Metanoia_Nat_Induction_0__Metanoia_Nat_Induction_sumTo_match__1_splitter___rarg___boxed(lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l___private_Metanoia_Nat_Induction_0__Metanoia_Nat_Induction_sumTo_match__1_splitter(lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_sumTo(lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_fib(lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* lean_nat_mul(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_sumTo___boxed(lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_sumSquares(lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_sumTo(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; 
x_2 = lean_unsigned_to_nat(0u);
x_3 = lean_nat_dec_eq(x_1, x_2);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_4 = lean_unsigned_to_nat(1u);
x_5 = lean_nat_sub(x_1, x_4);
x_6 = lean_nat_add(x_5, x_4);
x_7 = l_Metanoia_Nat_Induction_sumTo(x_5);
lean_dec(x_5);
x_8 = lean_nat_add(x_6, x_7);
lean_dec(x_7);
lean_dec(x_6);
return x_8;
}
else
{
lean_object* x_9; 
x_9 = lean_unsigned_to_nat(0u);
return x_9;
}
}
}
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_sumTo___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_Metanoia_Nat_Induction_sumTo(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l___private_Metanoia_Nat_Induction_0__Metanoia_Nat_Induction_sumTo_match__1_splitter___rarg(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; uint8_t x_5; 
x_4 = lean_unsigned_to_nat(0u);
x_5 = lean_nat_dec_eq(x_1, x_4);
if (x_5 == 0)
{
lean_object* x_6; lean_object* x_7; lean_object* x_8; 
x_6 = lean_unsigned_to_nat(1u);
x_7 = lean_nat_sub(x_1, x_6);
x_8 = lean_apply_1(x_3, x_7);
return x_8;
}
else
{
lean_dec(x_3);
lean_inc(x_2);
return x_2;
}
}
}
LEAN_EXPORT lean_object* l___private_Metanoia_Nat_Induction_0__Metanoia_Nat_Induction_sumTo_match__1_splitter(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = lean_alloc_closure((void*)(l___private_Metanoia_Nat_Induction_0__Metanoia_Nat_Induction_sumTo_match__1_splitter___rarg___boxed), 3, 0);
return x_2;
}
}
LEAN_EXPORT lean_object* l___private_Metanoia_Nat_Induction_0__Metanoia_Nat_Induction_sumTo_match__1_splitter___rarg___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3) {
_start:
{
lean_object* x_4; 
x_4 = l___private_Metanoia_Nat_Induction_0__Metanoia_Nat_Induction_sumTo_match__1_splitter___rarg(x_1, x_2, x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_4;
}
}
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_sumSquares(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; 
x_2 = lean_unsigned_to_nat(0u);
x_3 = lean_nat_dec_eq(x_1, x_2);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; lean_object* x_6; lean_object* x_7; lean_object* x_8; lean_object* x_9; 
x_4 = lean_unsigned_to_nat(1u);
x_5 = lean_nat_sub(x_1, x_4);
x_6 = lean_nat_add(x_5, x_4);
x_7 = lean_nat_mul(x_6, x_6);
lean_dec(x_6);
x_8 = l_Metanoia_Nat_Induction_sumSquares(x_5);
lean_dec(x_5);
x_9 = lean_nat_add(x_7, x_8);
lean_dec(x_8);
lean_dec(x_7);
return x_9;
}
else
{
lean_object* x_10; 
x_10 = lean_unsigned_to_nat(0u);
return x_10;
}
}
}
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_sumSquares___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_Metanoia_Nat_Induction_sumSquares(x_1);
lean_dec(x_1);
return x_2;
}
}
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_fib(lean_object* x_1) {
_start:
{
lean_object* x_2; uint8_t x_3; 
x_2 = lean_unsigned_to_nat(0u);
x_3 = lean_nat_dec_eq(x_1, x_2);
if (x_3 == 0)
{
lean_object* x_4; lean_object* x_5; uint8_t x_6; 
x_4 = lean_unsigned_to_nat(1u);
x_5 = lean_nat_sub(x_1, x_4);
x_6 = lean_nat_dec_eq(x_5, x_2);
if (x_6 == 0)
{
lean_object* x_7; lean_object* x_8; lean_object* x_9; lean_object* x_10; lean_object* x_11; 
x_7 = lean_nat_sub(x_5, x_4);
lean_dec(x_5);
x_8 = lean_nat_add(x_7, x_4);
x_9 = l_Metanoia_Nat_Induction_fib(x_8);
lean_dec(x_8);
x_10 = l_Metanoia_Nat_Induction_fib(x_7);
lean_dec(x_7);
x_11 = lean_nat_add(x_9, x_10);
lean_dec(x_10);
lean_dec(x_9);
return x_11;
}
else
{
lean_object* x_12; 
lean_dec(x_5);
x_12 = lean_unsigned_to_nat(1u);
return x_12;
}
}
else
{
lean_object* x_13; 
x_13 = lean_unsigned_to_nat(0u);
return x_13;
}
}
}
LEAN_EXPORT lean_object* l_Metanoia_Nat_Induction_fib___boxed(lean_object* x_1) {
_start:
{
lean_object* x_2; 
x_2 = l_Metanoia_Nat_Induction_fib(x_1);
lean_dec(x_1);
return x_2;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Metanoia_Nat_Induction(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
