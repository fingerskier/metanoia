// Lean compiler output
// Module: Metanoia.Safety.Bounded
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
LEAN_EXPORT lean_object* l_Metanoia_Safety_addBounded___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Safety_addBounded___rarg(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Safety_clamp___boxed(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Safety_addBounded(lean_object*, lean_object*, lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Safety_LOAD__THRESHOLD;
LEAN_EXPORT lean_object* l_Metanoia_Safety_addBounded___rarg___boxed(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Safety_clamp(lean_object*, lean_object*, lean_object*, lean_object*);
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
LEAN_EXPORT lean_object* l_Metanoia_Safety_clamp(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
uint8_t x_5; 
x_5 = lean_nat_dec_le(x_2, x_3);
if (x_5 == 0)
{
uint8_t x_6; 
x_6 = lean_nat_dec_le(x_1, x_3);
if (x_6 == 0)
{
lean_inc(x_1);
return x_1;
}
else
{
lean_inc(x_3);
return x_3;
}
}
else
{
uint8_t x_7; 
x_7 = lean_nat_dec_le(x_1, x_2);
if (x_7 == 0)
{
lean_inc(x_1);
return x_1;
}
else
{
lean_inc(x_2);
return x_2;
}
}
}
}
LEAN_EXPORT lean_object* l_Metanoia_Safety_clamp___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = l_Metanoia_Safety_clamp(x_1, x_2, x_3, x_4);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_5;
}
}
LEAN_EXPORT lean_object* l_Metanoia_Safety_addBounded___rarg(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = lean_nat_add(x_1, x_2);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Metanoia_Safety_addBounded(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = lean_alloc_closure((void*)(l_Metanoia_Safety_addBounded___rarg___boxed), 2, 0);
return x_5;
}
}
LEAN_EXPORT lean_object* l_Metanoia_Safety_addBounded___rarg___boxed(lean_object* x_1, lean_object* x_2) {
_start:
{
lean_object* x_3; 
x_3 = l_Metanoia_Safety_addBounded___rarg(x_1, x_2);
lean_dec(x_2);
lean_dec(x_1);
return x_3;
}
}
LEAN_EXPORT lean_object* l_Metanoia_Safety_addBounded___boxed(lean_object* x_1, lean_object* x_2, lean_object* x_3, lean_object* x_4) {
_start:
{
lean_object* x_5; 
x_5 = l_Metanoia_Safety_addBounded(x_1, x_2, x_3, x_4);
lean_dec(x_4);
lean_dec(x_3);
lean_dec(x_2);
lean_dec(x_1);
return x_5;
}
}
static lean_object* _init_l_Metanoia_Safety_LOAD__THRESHOLD() {
_start:
{
lean_object* x_1; 
x_1 = lean_unsigned_to_nat(10u);
return x_1;
}
}
lean_object* initialize_Init(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Metanoia_Safety_Bounded(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
l_Metanoia_Safety_LOAD__THRESHOLD = _init_l_Metanoia_Safety_LOAD__THRESHOLD();
lean_mark_persistent(l_Metanoia_Safety_LOAD__THRESHOLD);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
