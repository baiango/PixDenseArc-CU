#pragma once
#include "cuda_runtime.h"
#include "unit/munit.h"
#include "type_def.h"
#include "rgb.cuh"
#include <stdbool.h>
#include <math.h>

// Note YCoCgp is for processing RGB888.
// They are not for storing.
// You would use transform coding such as DCT to store it.
typedef struct {
	mut_f32 y;
	mut_f32 co;
	mut_f32 cg;
} mut_YCoCgp;
typedef const mut_YCoCgp YCoCgp;

YCoCgp pda_new_ycocgp();
YCoCgp pda_new_black_ycocgp();
YCoCgp pda_rgb_to_ycocgp(RGB888 rgb);
u1 pda_are_equal_ycocgp(YCoCgp a, YCoCgp b);
/* ----- µnit ----- */
extern MunitTest ycocgp_tests[];
extern MunitSuite ycocgp_suite;
MunitResult pda_test_are_equal_ycocgp(const MunitParameter params[], void* user_data);
MunitResult pda_test_rgb_to_ycocgp(const MunitParameter params[], void* user_data);
MunitResult pda_test_ycocgp_to_rgb(const MunitParameter params[], void* user_data);
