#pragma once
#include "cuda_runtime.h"
#include "unit/munit.h"
#include "type_def.h"
#include <math.h>

typedef struct {
	mut_u8 r;
	mut_u8 g;
	mut_u8 b;
} mut_RGB888;
typedef const mut_RGB888 RGB888;

u1 pda_are_equal_rgb888(RGB888 a, RGB888 b);
/* ----- µnit ----- */
extern MunitTest rgb_tests[];
extern MunitSuite rgb_suite;
MunitResult pda_test_are_equal_rgb888(const MunitParameter params[], void* user_data);
