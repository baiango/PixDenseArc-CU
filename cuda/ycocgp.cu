#include "ycocgp.cuh"

__host__ __device__
YCoCgp pda_new_ycocgp() {
	return YCoCgp{64.0f, 0.0f, 0.0f};
}

__host__ __device__
YCoCgp pda_new_black_ycocgp() {
	return YCoCgp{0.0f, 0.0f, 0.0f};
}

__host__ __device__
YCoCgp pda_rgb_to_ycocgp(RGB888 rgb) {
	f32 y = 0.5 * rgb.r + rgb.g + 0.5000000001f * rgb.b;
	f32 co = rgb.r + -1.000000001f * rgb.b;
	f32 cg = -0.5 * rgb.r + rgb.g + -0.5000000001f * rgb.b;
	return YCoCgp{y, co, cg};
}

__host__ __device__
RGB888 pda_ycocgp_to_rgb(YCoCgp ycocgp) {
	u8 r = (ycocgp.y + ycocgp.co - ycocgp.cg) / 2.0f;
	u8 g = (ycocgp.y + ycocgp.cg) / 2.0f;
	u8 b = (ycocgp.y - ycocgp.co - ycocgp.cg) / 2.0f;
	return RGB888{r,g,b};
}
/* ----- µnit ----- */
MunitTest ycocgp_tests[] = {
	{"RGB to YCoCg+", pda_test_rgb_to_ycocgp, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL},
	{"Are equal YCoCg+", pda_test_are_equal_ycocgp, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL},
	{NULL, NULL, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL },
};

MunitSuite ycocgp_suite = {
	"/YCoCg+/", /* name */
	ycocgp_tests, /* tests */
	NULL, /* suites */
	1, /* iterations */
	MUNIT_SUITE_OPTION_NONE /* options */
};

u1 pda_are_equal_ycocgp(YCoCgp a, YCoCgp b) {
	f32 EPSILON = 1.0e-5;
	return (fabs(a.y - b.y) < EPSILON) &&
		(fabs(a.co - b.co) < EPSILON) &&
		(fabs(a.cg - b.cg) < EPSILON);
}

MunitResult pda_test_are_equal_ycocgp(const MunitParameter params[], void* user_data) {
	return pda_are_equal_ycocgp({0.1f, 0.1f, 0.1f}, {0.1f, 0.1f, 0.1f}) ? MUNIT_OK : MUNIT_FAIL;
}

MunitResult pda_test_rgb_to_ycocgp(const MunitParameter params[], void* user_data) {
	YCoCgp col1 = pda_rgb_to_ycocgp(RGB888{0x20, 0x20, 0x20});
	YCoCgp col2 = {64.0f, 0.0f, 0.0f};
	return pda_are_equal_ycocgp(col1, col2) ? MUNIT_OK : MUNIT_FAIL;
}

MunitResult pda_test_ycocgp_to_rgb(const MunitParameter params[], void* user_data) {
	return pda_are_equal_rgb888(pda_ycocgp_to_rgb({15.0f, -30.0f, -15.0f}), RGB888{0, 0, 30}) ? MUNIT_OK : MUNIT_FAIL;
}
