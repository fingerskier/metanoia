// Lean compiler output
// Module: Metanoia
// Imports: Init Metanoia.Logic.Basic Metanoia.Logic.Classical Metanoia.Logic.Quantifiers Metanoia.Nat.Basic Metanoia.Nat.Divisibility Metanoia.Nat.Induction Metanoia.Nat.Prime Metanoia.Algebra.Group Metanoia.List.Basic Metanoia.Music.Interval Metanoia.Philosophy.Syllogism Metanoia.Safety.Bounded Metanoia.Safety.StateMachine Metanoia.ThreeValuedLogic
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
lean_object* initialize_Init(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Logic_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Logic_Classical(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Logic_Quantifiers(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Nat_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Nat_Divisibility(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Nat_Induction(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Nat_Prime(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Algebra_Group(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_List_Basic(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Music_Interval(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Philosophy_Syllogism(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Safety_Bounded(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_Safety_StateMachine(uint8_t builtin, lean_object*);
lean_object* initialize_Metanoia_ThreeValuedLogic(uint8_t builtin, lean_object*);
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_Metanoia(uint8_t builtin, lean_object* w) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
res = initialize_Init(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Logic_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Logic_Classical(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Logic_Quantifiers(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Nat_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Nat_Divisibility(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Nat_Induction(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Nat_Prime(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Algebra_Group(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_List_Basic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Music_Interval(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Philosophy_Syllogism(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Safety_Bounded(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_Safety_StateMachine(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Metanoia_ThreeValuedLogic(builtin, lean_io_mk_world());
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
